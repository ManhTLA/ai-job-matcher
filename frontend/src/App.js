import React, { useState } from 'react';
import './App.css';

function App() {
  const [message, setMessage] = useState('Loading...');

  React.useEffect(() => {
    // Try to fetch from backend
    fetch('http://localhost:8000/health')
      .then(res => res.json())
      .then(data => setMessage('✅ Backend connected!'))
      .catch(err => setMessage('⚠️ Backend not connected yet'));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>🤖 AI Job Matcher</h1>
        <p>CV Filtering & Job Matching System</p>
        <p>{message}</p>
      </header>
      
      <main>
        <div className="container">
          <button className="btn btn-primary">Upload CV</button>
          <button className="btn btn-secondary">View Jobs</button>
          <button className="btn btn-success">Dashboard</button>
        </div>
      </main>
    </div>
  );
}

export default App;
