import entitiesReducer from './entities_reducer';
import { combineReducers } from 'redux';

export default () => {
    combineReducers({
    entities: entitiesReducer
  });
};
