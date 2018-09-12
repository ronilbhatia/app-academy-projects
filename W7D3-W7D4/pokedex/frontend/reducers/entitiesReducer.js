import { combineReducers } from 'redux';
import pokemonReducer from './pokemonReducer';

const entitiesReducer = () => {
  combineReducers({
    pokemon: pokemonReducer
  });
};

export default entitiesReducer;
