import { useState } from 'react';
import KlinePage from './pages/KlinePage';
import './App.css';

function App() {
  const [page, setPage] = useState('kline');

  return (
    <div className="app">
      <nav className="navbar">
        <span className="logo">jzhu-trading</span>
        <div className="nav-links">
          <button
            className={page === 'kline' ? 'active' : ''}
            onClick={() => setPage('kline')}
          >
            K Line
          </button>
        </div>
      </nav>
      <main className="main-content">
        {page === 'kline' && <KlinePage />}
      </main>
    </div>
  );
}

export default App;
