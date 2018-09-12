import merge from 'lodash/merge';

export default pokemonReducer = (state, action) => {
  Object.freeze(state);
  let nextState = merge({}, state);
  switch (action.type) {
    default:
    return nextState;
  }
};
