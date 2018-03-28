import { fetchItemsIsLoading, fetchItems } from '../actions/actionCreators';

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
  it('fetchItems should load', () => {
    expect.assertions(2);
    const val = fetchItems('sss');

    expect(val).toEqual({});
  });
});
