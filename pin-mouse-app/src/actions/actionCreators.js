import axios from 'axios';
import {
  ADD_TODO,
  FETCH_ITEMS_IS_LOADING,
  FETCH_ITEMS_SUCCESS,
  FETCH_ITEMS_HAS_ERROR,
} from './actionConstants';

export const addTodo = text => ({
  type: ADD_TODO,
  text,
});

export const fetchItemsIsLoading = bool => ({
  type: FETCH_ITEMS_IS_LOADING,
  isLoading: bool,
});

export const fetchItemsHasError = bool => ({
  type: FETCH_ITEMS_HAS_ERROR,
  hasError: bool,
});

export const fetchItemsSuccess = items => ({
  type: FETCH_ITEMS_SUCCESS,
  items,
});

export const fetchItems = url => {
  return dispatch => {
    dispatch(fetchItemsIsLoading(true));

    // TODO: move to service
    axios
      .get(url)
      .then(response => {
        // console.log(response);
        if (response.status !== 200) {
          throw Error(response.statusText);
        }

        dispatch(fetchItemsIsLoading(false));

        return response;
      })
      .then(response => dispatch(fetchItemsSuccess(response.data)))
      .catch(() => dispatch(fetchItemsHasError(true)));
  };
};
