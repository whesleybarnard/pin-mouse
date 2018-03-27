import React from 'react';
import PropTypes from 'prop-types';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import { Provider } from 'react-redux';
// import logo from './mouse.svg';
import './App.css';
import AppContainer from './components/AppContainer';
import Menu from './components/Menu';
// import AppCon2 from './components/AppCon2';

const App = ({ store }) => (
  <Provider store={store}>
    <BrowserRouter>
      <div className="App">
        {/* <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to Pin-Mouse</h1>
        </header> */}
        <Menu />
        <main>
          <Switch>
            <Route exact path="/" component={AppContainer} />
          </Switch>
          {/* <AppCon2 /> */}
        </main>
      </div>
    </BrowserRouter>
  </Provider>
);

App.propTypes = {
  store: PropTypes.object.isRequired, // eslint-disable-line react/forbid-prop-types
};

export default App;
