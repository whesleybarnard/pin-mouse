import { combineReducers } from 'redux';
import { itemsAreLoading, itemsAreLoaded } from './AppReducer';

export default combineReducers({
  itemsAreLoading,
  itemsAreLoaded,
});
