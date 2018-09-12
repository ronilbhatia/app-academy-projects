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
    this.setState({ time });
  }

  componentDidMount() {
    this.id = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.id);
  }

  render() {
    const hours = this.state.time.getHours() < 10 ? '0' + this.state.time.getHours() : this.state.time.getHours();
    const minutes = this.state.time.getMinutes() < 10 ? '0' + this.state.time.getMinutes() : this.state.time.getMinutes();
    const seconds = this.state.time.getSeconds() < 10 ? '0' + this.state.time.getSeconds() : this.state.time.getSeconds();

    return (
      <div className="clock">
        <h1>Clock</h1>
        <div className="date-time">
          <div className="time">
            <h2>Time:</h2>
            <h2>{hours}:{minutes}:{seconds} PDT</h2>
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
