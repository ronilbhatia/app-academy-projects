<<<<<<< HEAD
=======
import * as Utils from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

>>>>>>> W7D2/master
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo
});
<<<<<<< HEAD
=======

export const fetchTodos = () => dispatch => (
  Utils.fetchTodos()
    .then(allTodos  => dispatch(receiveTodos(allTodos)))
);

export const createTodo = todo => dispatch => (
  Utils.createTodo(todo)
    .then(
      todo => dispatch(receiveTodo(todo)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
);
>>>>>>> W7D2/master
