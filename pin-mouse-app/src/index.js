import React from 'react';
import ReactDOM from 'react-dom';
import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import AppReducer from './reducers/AppReducer';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

const store = createStore(AppReducer, applyMiddleware(logger));

ReactDOM.render(<App store={store} />, document.getElementById('root'));
registerServiceWorker();
