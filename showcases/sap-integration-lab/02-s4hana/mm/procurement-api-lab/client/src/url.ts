import type { PageRequest } from './types.ts';

export function normalizeBaseUrl(baseUrl: string): string {
  const parsed = new URL(baseUrl);
  if (parsed.protocol !== 'https:' && parsed.hostname !== 'localhost') {
    throw new Error('SAP base URL must use HTTPS unless localhost is used for tests.');
  }
  return parsed.toString().replace(/\/$/, '');
}

export function buildReadUrl(baseUrl: string, servicePath: string, page: PageRequest = {}): string {
  if (!servicePath.startsWith('/')) {
    throw new Error('Service path must start with /.');
  }

  const url = new URL(`${normalizeBaseUrl(baseUrl)}${servicePath}`);
  if (page.top !== undefined) url.searchParams.set('$top', String(page.top));
  if (page.skip !== undefined) url.searchParams.set('$skip', String(page.skip));
  if (page.filter) url.searchParams.set('$filter', page.filter);
  return url.toString();
}
