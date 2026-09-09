export class SapApiError extends Error {
  readonly status: number;
  readonly correlationId?: string;

  constructor(message: string, status: number, correlationId?: string) {
    super(message);
    this.name = 'SapApiError';
    this.status = status;
    this.correlationId = correlationId;
  }
}
