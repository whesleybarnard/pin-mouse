import shortid from 'shortid';
import { ADD_TODO } from '../actions/actionConstants';

const defState = {
  todoList: ['todo 1', 'todo 2', 'todo 3'].map(obj => ({
    _id: shortid.generate(),
    value: obj,
  })),
};

export default (state = defState, action) => {
  // console.log(action);
  // console.log(state);
  switch (action.type) {
    case ADD_TODO:
      return Object.assign(...state, {
        text: 'this is the new text...',
        todoList: [
          ...state.todoList,
          { _id: shortid.generate(), value: action.text },
        ],
      });
    default:
      return state;
  }
};
