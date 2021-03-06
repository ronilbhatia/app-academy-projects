import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: ""
    };

    // this.updateTitle = this.updateTitle.bind(this);
    // this.updateBody = this.updateBody.bind(this);
    this.addTodo = this.addTodo.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  // updateTitle(e) {
  //   this.setState( {title: e.target.value} );
  // }
  //
  // updateBody(e) {
  //   this.setState( {body: e.target.value} );
  // }
  handleChange(field) {
    return (e) => {
      this.setState({ [field]: e.target.value });
    };
  }

  addTodo(e) {
    e.preventDefault();
    let newTodo = {
      id: new Date().getTime(),
      title: this.state.title,
      body: this.state.body
    };
<<<<<<< HEAD
    this.props.receiveTodo(newTodo);
=======
    this.props.createTodo(newTodo);
>>>>>>> W7D2/master
    this.setState({title: "", body: ""});
  }

  render() {
    return (
      <form onSubmit={this.addTodo}>
<<<<<<< HEAD
        <input type="text" value={this.state.title} onChange={this.handleChange("title")} />
        <input type="text" value={this.state.body} onChange={this.handleChange("body")} />
        <input type="submit" value="Add Todo" />
=======
        <label>Title:
          <input type="text" value={this.state.title} onChange={this.handleChange("title")} />
        </label>
        <br />
        <label>Body:
          <input type="text" value={this.state.body} onChange={this.handleChange("body")} />
        </label>
        <br />
        <input type="submit" value="Add Todo" />

>>>>>>> W7D2/master
      </form>
    );
  }
}

export default TodoForm;
