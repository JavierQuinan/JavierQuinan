import { SapApiError } from './errors.ts';
import { buildReadUrl, normalizeBaseUrl } from './url.ts';
import type {
  HttpResponse,
  HttpTransport,
  PageRequest,
  ProcurementApiConfig,
  ProcurementDocument,
} from './types.ts';

function getCorrelationId(headers: Record<string, string | undefined>): string | undefined {
  return headers['x-correlation-id'] ?? headers['x-request-id'] ?? headers['sap-message-id'];
}

function asODataValues(body: unknown): Record<string, unknown>[] {
  if (typeof body !== 'object' || body === null || !('value' in body)) {
    throw new Error('Unexpected OData response: missing value array.');
  }

  const value = (body as { value: unknown }).value;
  if (!Array.isArray(value)) {
    throw new Error('Unexpected OData response: value is not an array.');
  }

  return value.filter(
    (item): item is Record<string, unknown> => typeof item === 'object' && item !== null,
  );
}

function pickId(item: Record<string, unknown>, keys: string[]): string {
  for (const key of keys) {
    const value = item[key];
    if (typeof value === 'string' && value.trim()) return value;
    if (typeof value === 'number') return String(value);
  }
  return 'UNKNOWN';
}

export class ProcurementApiClient {
  readonly #config: ProcurementApiConfig;
  readonly #transport: HttpTransport;

  constructor(config: ProcurementApiConfig, transport: HttpTransport) {
    this.#config = {
      ...config,
      baseUrl: normalizeBaseUrl(config.baseUrl),
    };
    this.#transport = transport;
  }

  async getPurchaseOrders(page: PageRequest = {}): Promise<ProcurementDocument[]> {
    const url = buildReadUrl(this.#config.baseUrl, this.#config.purchaseOrderServicePath, page);
    const response = await this.#read(url);

    return asODataValues(response.body).map((raw) => ({
      id: pickId(raw, ['PurchaseOrder', 'PurchaseOrderUUID', 'ID']),
      documentType: 'PURCHASE_ORDER' as const,
      raw,
    }));
  }

  async getPurchaseRequisitions(page: PageRequest = {}): Promise<ProcurementDocument[]> {
    const url = buildReadUrl(
      this.#config.baseUrl,
      this.#config.purchaseRequisitionServicePath,
      page,
    );
    const response = await this.#read(url);

    return asODataValues(response.body).map((raw) => ({
      id: pickId(raw, ['PurchaseRequisition', 'PurchaseRequisitionUUID', 'ID']),
      documentType: 'PURCHASE_REQUISITION' as const,
      raw,
    }));
  }

  async #read(url: string): Promise<HttpResponse> {
    const headers: Record<string, string> = {
      accept: 'application/json',
    };
    if (this.#config.authHeader) headers.authorization = this.#config.authHeader;

    const response = await this.#transport.get(url, headers);
    if (response.status < 200 || response.status >= 300) {
      throw new SapApiError(
        `SAP API read failed with HTTP ${response.status}`,
        response.status,
        getCorrelationId(response.headers),
      );
    }

    return response;
  }
}
