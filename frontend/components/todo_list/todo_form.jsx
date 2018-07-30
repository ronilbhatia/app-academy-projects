import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: ""
    };

    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.addTodo = this.addTodo.bind(this);
  }

  updateTitle(e) {
    this.setState( {title: e.target.value} );
  }

  updateBody(e) {
    this.setState( {body: e.target.value} );
  }

  addTodo() {
    let newTodo = {
      id: new Date().getTime(),
      title: this.state.title,
      body: this.state.body
    };
    this.props.receiveTodo(newTodo);
    this.setState({title: "", body: ""});
  }

  render() {
    return (
      <div>
        <input type="text" value={this.state.title} onChange={this.updateTitle}></input>
        <input type="text" value={this.state.body} onChange={this.updateBody}></input>
        <button onClick={this.addTodo}>Add Todo</button>
      </div>
    );
  }
}

export default TodoForm;
