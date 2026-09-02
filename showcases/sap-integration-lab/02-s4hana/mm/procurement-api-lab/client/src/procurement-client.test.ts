import assert from 'node:assert/strict';
import test from 'node:test';
import { ProcurementApiClient } from './procurement-client.ts';
import { SapApiError } from './errors.ts';
import type { HttpResponse, HttpTransport } from './types.ts';

class QueueTransport implements HttpTransport {
  readonly calls: Array<{ url: string; headers?: Record<string, string> }> = [];
  readonly #responses: HttpResponse[];

  constructor(responses: HttpResponse[]) {
    this.#responses = [...responses];
  }

  async get(url: string, headers?: Record<string, string>): Promise<HttpResponse> {
    this.calls.push({ url, headers });
    const response = this.#responses.shift();
    if (!response) throw new Error('No mock response configured.');
    return response;
  }
}

function makeClient(transport: HttpTransport): ProcurementApiClient {
  return new ProcurementApiClient(
    {
      baseUrl: 'https://example.invalid',
      purchaseOrderServicePath: '/odata/purchase-orders',
      purchaseRequisitionServicePath: '/odata/purchase-requisitions',
      authHeader: 'Bearer synthetic-test-token',
    },
    transport,
  );
}

test('normalizes purchase-order reads', async () => {
  const transport = new QueueTransport([
    { status: 200, headers: {}, body: { value: [{ PurchaseOrder: '4500000001' }] } },
  ]);

  const result = await makeClient(transport).getPurchaseOrders({ top: 10 });

  assert.equal(result[0]?.id, '4500000001');
  assert.equal(result[0]?.documentType, 'PURCHASE_ORDER');
  assert.match(transport.calls[0]?.url ?? '', /%24top=10/);
});

test('normalizes purchase-requisition reads', async () => {
  const transport = new QueueTransport([
    { status: 200, headers: {}, body: { value: [{ PurchaseRequisition: '10000001' }] } },
  ]);

  const result = await makeClient(transport).getPurchaseRequisitions({
    skip: 20,
    filter: "Status eq 'A'",
  });

  assert.equal(result[0]?.id, '10000001');
  assert.equal(result[0]?.documentType, 'PURCHASE_REQUISITION');
  assert.match(transport.calls[0]?.url ?? '', /%24skip=20/);
});

test('returns an empty array for an empty OData page', async () => {
  const transport = new QueueTransport([{ status: 200, headers: {}, body: { value: [] } }]);
  assert.deepEqual(await makeClient(transport).getPurchaseOrders(), []);
});

test('maps authorization failures with correlation id', async () => {
  const transport = new QueueTransport([
    {
      status: 401,
      headers: { 'x-correlation-id': 'corr-synthetic-1' },
      body: { error: 'unauthorized' },
    },
  ]);

  await assert.rejects(
    () => makeClient(transport).getPurchaseOrders(),
    (error: unknown) =>
      error instanceof SapApiError &&
      error.status === 401 &&
      error.correlationId === 'corr-synthetic-1',
  );
});

test('rejects unexpected non-OData response shapes', async () => {
  const transport = new QueueTransport([{ status: 200, headers: {}, body: { data: [] } }]);
  await assert.rejects(() => makeClient(transport).getPurchaseOrders(), /missing value array/);
});

test('rejects insecure non-local SAP base URLs', () => {
  const transport = new QueueTransport([]);

  assert.throws(
    () =>
      new ProcurementApiClient(
        {
          baseUrl: 'http://sap.example.invalid',
          purchaseOrderServicePath: '/po',
          purchaseRequisitionServicePath: '/pr',
        },
        transport,
      ),
    /must use HTTPS/,
  );
});
