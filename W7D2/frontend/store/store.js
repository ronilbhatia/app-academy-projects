<<<<<<< HEAD
import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(rootReducer);
=======
import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunk from '../middleware/thunk';

const configureStore = () => {
  return createStore(rootReducer, applyMiddleware(thunk));
>>>>>>> W7D2/master
};

export default configureStore;
