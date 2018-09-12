import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
<<<<<<< HEAD

const rootReducer = combineReducers({
  todos: todosReducer
=======
import errorReducer from './error_reducer';

const rootReducer = combineReducers({
  todos: todosReducer,
  errors: errorReducer
>>>>>>> W7D2/master
});

export default rootReducer;
