import type { HttpResponse, HttpTransport } from './types.ts';

export class FetchTransport implements HttpTransport {
  readonly #timeoutMs: number;

  constructor(timeoutMs = 10_000) {
    this.#timeoutMs = timeoutMs;
  }

  async get(url: string, headers: Record<string, string> = {}): Promise<HttpResponse> {
    const response = await fetch(url, {
      method: 'GET',
      headers,
      signal: AbortSignal.timeout(this.#timeoutMs),
    });

    const text = await response.text();
    let body: unknown = null;
    if (text) {
      try {
        body = JSON.parse(text);
      } catch {
        body = { rawText: text };
      }
    }

    return {
      status: response.status,
      headers: {
        'x-correlation-id': response.headers.get('x-correlation-id') ?? undefined,
        'x-request-id': response.headers.get('x-request-id') ?? undefined,
        'sap-message-id': response.headers.get('sap-message-id') ?? undefined,
      },
      body,
    };
  }
}
