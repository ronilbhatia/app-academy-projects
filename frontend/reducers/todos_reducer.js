import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  let nextState = merge({}, state);
  switch(action.type) {
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach((todo) => newState[todo.id] = todo);
      return newState;
    case REMOVE_TODO:
      delete(nextState[action.todo.id]);
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;
