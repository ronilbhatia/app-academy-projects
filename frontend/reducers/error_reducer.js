import * as ErrorActions from '../actions/error_actions';
import union from 'lodash/union';

const errorReducer = (state = [], action) => {
  Object.freeze(state);
  let nextState = union([], state);
  switch(action.type) {
    case ErrorActions.RECEIVE_ERRORS:
      return nextState.concat(action.errors);
    case ErrorActions.CLEAR_ERRORS:
      return [];
    default:
      return state;
  }
};

export default errorReducer;
