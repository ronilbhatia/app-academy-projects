import React from 'react';

const TodoListItem = (({todo, removeTodo, key}) => (

  <li key={key}>
    {todo.title}
    <button onClick={()=>removeTodo(todo)}>Delete</button>
  </li>
));

export default TodoListItem;
