import { useState, useEffect } from 'react';
import { fetchKline } from '../services/api';

export default function KlinePage() {
  const [symbol, setSymbol] = useState('AAPL');
  const [period, setPeriod] = useState('daily');
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadData();
  }, []);

  async function loadData() {
    setLoading(true);
    setError(null);
    try {
      const result = await fetchKline(symbol, period);
      setData(result);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  function handleSubmit(e) {
    e.preventDefault();
    loadData();
  }

  return (
    <div className="kline-page">
      <h1>K Line Data</h1>

      <form onSubmit={handleSubmit} className="search-form">
        <input
          type="text"
          value={symbol}
          onChange={e => setSymbol(e.target.value.toUpperCase())}
          placeholder="Symbol (e.g. AAPL)"
        />
        <select value={period} onChange={e => setPeriod(e.target.value)}>
          <option value="daily">Daily</option>
          <option value="weekly">Weekly</option>
          <option value="monthly">Monthly</option>
        </select>
        <button type="submit">Search</button>
      </form>

      {loading && <p>Loading...</p>}
      {error && <p className="error">Error: {error}</p>}

      {data.length > 0 && (
        <table className="kline-table">
          <thead>
            <tr>
              <th>Date</th>
              <th>Open</th>
              <th>High</th>
              <th>Low</th>
              <th>Close</th>
              <th>Volume</th>
            </tr>
          </thead>
          <tbody>
            {data.map((item, idx) => (
              <tr key={idx}>
                <td>{item.date}</td>
                <td>{item.open.toFixed(2)}</td>
                <td>{item.high.toFixed(2)}</td>
                <td>{item.low.toFixed(2)}</td>
                <td>{item.close.toFixed(2)}</td>
                <td>{item.volume.toLocaleString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}
