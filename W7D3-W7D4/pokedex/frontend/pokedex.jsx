import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { requestAllPokemon } from './actions/pokemon_actions';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  window.requestAllPokemon = requestAllPokemon;
  ReactDOM.render(<h1>Pokedex</h1>, root);
});
