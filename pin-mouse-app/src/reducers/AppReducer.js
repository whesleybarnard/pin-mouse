const defState = {
  todoList: ['todo 1', 'todo 2', 'todo 3'],
};

export default (state = defState, action) => {
  switch (action.type) {
    case 'DO_IT':
      return Object.assign({}, state, {
        text: 'this is the new text...',
      });
    default:
      return state;
  }
};
