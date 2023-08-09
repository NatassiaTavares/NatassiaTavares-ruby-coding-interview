// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
import "./controllers"
import SearchBar from './components/SearchBar';
import * as React from 'react'
import { createRoot } from 'react-dom/client'

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('search-bar-js')){
    const root = createRoot(document.getElementById('search-bar-js'));
    root.render(<SearchBar/>);
  }
});


