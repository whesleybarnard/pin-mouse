import shortid from 'shortid';
import { ADD_TODO, FETCH_ITEMS_IS_LOADING, FETCH_ITEMS_SUCCESS } from '../actions/actionConstants';

// const defState = {
//   todoList: ['todo 1', 'todo 2', 'todo 3'].map(obj => ({
//     _id: shortid.generate(),
//     value: obj,
//   })),
// };

// export default (state = defState, action) => {
//   // console.log(action);
//   // console.log(state);
//   switch (action.type) {
//     case ADD_TODO:
//       return Object.assign(...state, {
//         text: 'this is the new text...',
//         todoList: [
//           ...state.todoList,
//           { _id: shortid.generate(), value: action.text },
//         ],
//       });
//     default:
//       return state;
//   }
// };

export function itemsAreLoading(state = false, action) {
  switch (action.type) {
    case FETCH_ITEMS_IS_LOADING:
      return action.isLoading;
    default:
      return state;
  }
}

export function itemsAreLoaded(state = [], action) {
  switch (action.type) {
    case FETCH_ITEMS_SUCCESS:
      return action.items;
    default:
      return state;
  }
}
