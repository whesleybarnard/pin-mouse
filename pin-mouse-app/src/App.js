import React, { Component } from 'react';
import logo from './mouse.svg';
import './App.css';
import AppContainer from './components/AppContainer';
import Menu from './components/Menu';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to Pin-Mouse</h1>
        </header>
        <Menu />
        <AppContainer />
      </div>
    );
  }
}

export default App;
