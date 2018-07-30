import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';

const TodoList = (({todos, receiveTodo}) => (
  <ul>
    {todos.map(TodoListItem)}
  </ul>
));

export default TodoList;
