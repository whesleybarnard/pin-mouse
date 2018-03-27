import { ADD_TODO } from './actionConstants';

export const addTodo = text => ({
  type: ADD_TODO,
  text,
});
