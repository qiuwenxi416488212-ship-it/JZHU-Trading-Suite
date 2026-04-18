const API_BASE = 'http://localhost:8081';

export async function fetchKline(symbol, period = 'daily') {
  const response = await fetch(`${API_BASE}/api/kline/${symbol}?period=${period}`);