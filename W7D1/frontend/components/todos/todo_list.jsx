import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

const TodoList = (({todos, receiveTodo}) => (
  <div>
    <ul>
      {todos.map(TodoListItem)}
    </ul>
    <TodoForm receiveTodo={receiveTodo}/>
  </div>
));

export default TodoList;
