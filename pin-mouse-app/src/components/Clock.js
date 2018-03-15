import React, { Component } from 'react';
import './AppContainer.css';

class Clock extends Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date() };

    this.toggleClick = this.toggleClick.bind(this);
  }

  componentDidMount() {
    this.timerID = setInterval(() => this.tick(), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  toggleClick() {
    this.setState({
      isClicked: true,
    });
  }

  tick() {
    this.setState({
      date: new Date(),
    });
  }

  render() {
    return (
      <div>
        <h3>{this.state.date.toLocaleTimeString()}</h3>
        <button onClick={this.toggleClick}>Test</button>
        <div>{this.state.isClicked}</div>
      </div>
    );
  }
}

export default Clock;
