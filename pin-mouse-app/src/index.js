import React from 'react';
import ReactDOM from 'react-dom';
import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import thunk from 'redux-thunk';
import rootReducer from './reducers';
import './index.css';
import App from './App';
// import registerServiceWorker, { unregister } from './registerServiceWorker';

const store = createStore(rootReducer, applyMiddleware(thunk, logger));

ReactDOM.render(<App store={store} />, document.getElementById('root'));

// registerServiceWorker();
// unregister();
