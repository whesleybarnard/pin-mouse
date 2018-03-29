import confMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import axios from 'axios';
import { fetchItemsIsLoading, fetchItems } from '../actions/actionCreators';

const middlewares = [thunk];
const mockStore = confMockStore(middlewares);

const mockData = [
  {
    id: 1,
    title: 'json-server',
    author: 'typicode',
  },
  {
    id: 2,
    title: 'json-server22',
    author: 'typicode22',
  },
];

// jest.mock('axios', () => jest.fn());
// console.log(axios);
// jest.mock('axios', () => ({
//   get: jest.fn(),
// }));
jest.mock('axios', () => ({
  get: jest.fn(() => Promise.resolve({ status: 200, data: mockData })),
}));

// axios.mockImplementation(() => ({
//   get: jest.fn(() => Promise.resolve({ status: 200, data })),
// }));

let store;

beforeEach(() => {
  store = mockStore({});
  jest.clearAllMocks();
});

describe('fetchItemsIsLoading', () => {
  it('fetchItemsIsLoading should change to true', () => {
    const expectedVal = {
      type: 'FETCH_ITEMS_IS_LOADING',
      isLoading: true,
    };

    const val = fetchItemsIsLoading(true);

    expect(val).toEqual(expectedVal);
  });

  it('fetchItemsIsLoading should change to false', () => {
    const expectedVal = {
      type: 'FETCH_ITEMS_IS_LOADING',
      isLoading: false,
    };

    const val = fetchItemsIsLoading(false);

    expect(val).toEqual(expectedVal);
  });
});

describe('fetchItems', () => {
  it('fetchItems should load items', () => {
    return store.dispatch(fetchItems('lalala')).then(() => {
      expect(axios.get.mock.calls.length).toBe(1);

      const actions = store.getActions();
      expect(actions.length).toBe(3);
      expect(actions[0].type).toBe('FETCH_ITEMS_IS_LOADING');
      expect(actions[1].type).toBe('FETCH_ITEMS_IS_LOADING');
      expect(actions[2].type).toBe('FETCH_ITEMS_SUCCESS');

      expect(store.getActions()).toEqual([
        {
          type: 'FETCH_ITEMS_IS_LOADING',
          isLoading: true,
        },
        {
          type: 'FETCH_ITEMS_IS_LOADING',
          isLoading: false,
        },
        {
          type: 'FETCH_ITEMS_SUCCESS',
          items: mockData,
        },
      ]);
    });
  });

  it('fetchItems should handle error', () => {
    axios.get.mockReturnValueOnce(Promise.resolve({ status: 400 }));

    return store.dispatch(fetchItems('lalala')).then(() => {
      expect(axios.get.mock.calls.length).toBe(1);

      const actions = store.getActions();
      expect(actions.length).toBe(2);
      expect(actions[0].type).toBe('FETCH_ITEMS_IS_LOADING');
      expect(actions[1].type).toBe('FETCH_ITEMS_HAS_ERROR');

      expect(store.getActions()).toEqual([
        {
          type: 'FETCH_ITEMS_IS_LOADING',
          isLoading: true,
        },
        {
          type: 'FETCH_ITEMS_HAS_ERROR',
          hasError: true,
        },
      ]);
    });
  });
});
