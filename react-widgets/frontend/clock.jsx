import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  tick() {
    const time = new Date();
    this.setState( {time: new Date()} );
  }

  componentDidMount() {
    this.id = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.id);
  }

  render() {
    return (
      <div>
        <h1>Clock</h1>
        <div className="date-time">
          <div className="time">
            <h2>Time:</h2>
            <h2>{this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()} PDT</h2>
          </div>
          <div className="date">
            <h2>Date: </h2>
            <h2>{this.state.time.toDateString()}</h2>
          </div>
        </div>
      </div>

    );
  }

}

export default Clock;
