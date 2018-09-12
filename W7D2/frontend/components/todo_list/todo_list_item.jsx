import React from 'react';

<<<<<<< HEAD
export default (todo) => <li key={todo.id}>{todo.title}</li>;
=======
const TodoListItem = (({todo, removeTodo}) => (

  <li>
    {todo.title}
    <button onClick={()=>removeTodo(todo)}>Delete</button>
  </li>
));

export default TodoListItem;
>>>>>>> W7D2/master
