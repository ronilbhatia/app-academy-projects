import TodoList from './todo_list';
import { connect } from 'react-redux';
<<<<<<< HEAD
import {allTodos} from '../../reducers/selectors';
import {receiveTodo} from '../../actions/todo_actions';
=======
import { allTodos } from '../../reducers/selectors';
import { receiveTodo, removeTodo, fetchTodos, createTodo } from '../../actions/todo_actions';
>>>>>>> W7D2/master

const mapStateToProps = (state) => ({
  todos: allTodos(state)
});


const mapDispatchToProps = (dispatch) => ({
<<<<<<< HEAD
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
=======
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: (todo) => dispatch(createTodo(todo))
>>>>>>> W7D2/master
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
