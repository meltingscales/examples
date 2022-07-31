import React from 'react';
import ReactDOM from 'react-dom/client';
import Homepage from './Homepage';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);

function About() {
    return <div>about</div>;
}

root.render(
  <React.StrictMode>
    <About />
  </React.StrictMode>
);

