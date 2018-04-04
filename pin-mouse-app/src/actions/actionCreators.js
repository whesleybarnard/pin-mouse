import axios from 'axios';
import {
  ADD_TODO,
  FETCH_ITEMS_IS_LOADING,
  FETCH_ITEMS_SUCCESS,
  FETCH_ITEMS_HAS_ERROR,
  FETCH_REPOS_IS_LOADING,
  FETCH_REPOS_SUCCESS,
  FETCH_REPOS_HAS_ERROR,
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

// repos
export const fetchReposIsLoading = bool => ({
  type: FETCH_REPOS_IS_LOADING,
  isLoading: bool,
});

export const fetchReposHasError = bool => ({
  type: FETCH_REPOS_HAS_ERROR,
  hasError: bool,
});

export const fetchReposSuccess = repos => ({
  type: FETCH_REPOS_SUCCESS,
  repos,
});

export const fetchRepos = () => dispatch => {
  dispatch(fetchReposIsLoading(true));

  axios
    .get('http://localhost:4000/repos')
    .then(response => {
      if (response.status !== 200) {
        throw Error(response.statusText);
      }

      return response.data;
    })
    .then(data => {
      dispatch(fetchReposSuccess(data));
    })
    .catch(() => {
      dispatch(fetchReposHasError(true));
    });
};

export const fetchItems = url => {
  return dispatch => {
    dispatch(fetchItemsIsLoading(true));

    // TODO: move to service
    return axios
      .get(url)
      .then(response => {
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
