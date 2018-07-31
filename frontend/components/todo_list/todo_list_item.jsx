import React from 'react';

const TodoListItem = (({todo, removeTodo}) => (

  <li>
    {todo.title}
    <button onClick={()=>removeTodo(todo)}>Delete</button>
  </li>
));

export default TodoListItem;
