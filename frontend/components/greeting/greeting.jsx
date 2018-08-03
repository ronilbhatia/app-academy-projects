import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { currentUser } = this.props;
    const display = currentUser ? (
      <div>
        {currentUser.username}
        <button onClick={this.props.logout}>Log Out!</button>
      </div>
    ) : (
      <div>
        <Link to="/signup">Sign Up!</Link>
        <Link to="/login">Log In!</Link>
      </div>
    );
    return (
      <div>
        {display}
      </div>
    );
  }
}

export default Greeting;
