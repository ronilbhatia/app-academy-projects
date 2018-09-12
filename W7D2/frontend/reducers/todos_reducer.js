<<<<<<< HEAD
import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';
=======
import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO, fetchTodos } from '../actions/todo_actions';
>>>>>>> W7D2/master
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
<<<<<<< HEAD
=======
  Object.freeze(state);
>>>>>>> W7D2/master
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
<<<<<<< HEAD
      delete(nextState.action.todo.id);
=======
      delete(nextState[action.todo.id]);
>>>>>>> W7D2/master
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;
