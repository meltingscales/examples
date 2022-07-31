import React from 'react';
import ReactDOM from 'react-dom/client';
import Homepage from './Homepage';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
    <Homepage />
  </React.StrictMode>
);

