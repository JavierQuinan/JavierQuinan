export type ProcurementDocument = {
  id: string;
  documentType: 'PURCHASE_ORDER' | 'PURCHASE_REQUISITION';
  raw: Record<string, unknown>;
};

export type PageRequest = {
  top?: number;
  skip?: number;
  filter?: string;
};

export type HttpResponse = {
  status: number;
  headers: Record<string, string | undefined>;
  body: unknown;
};

export interface HttpTransport {
  get(url: string, headers?: Record<string, string>): Promise<HttpResponse>;
}

export type ProcurementApiConfig = {
  baseUrl: string;
  purchaseOrderServicePath: string;
  purchaseRequisitionServicePath: string;
  authHeader?: string;
  timeoutMs?: number;
};
