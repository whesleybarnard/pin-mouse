import { combineReducers } from 'redux';
import { itemsAreLoading, itemsAreLoaded, repoReducer } from './AppReducer';

export default combineReducers({
  itemsAreLoading,
  itemsAreLoaded,
  repos: repoReducer,
});
