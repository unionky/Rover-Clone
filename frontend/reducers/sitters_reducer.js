import { RECEIVE_SITTERS, RECEIVE_SITTER } from '../actions/sitter_actions'
import merge from "lodash/merge";

const sittersReducer = (state = {}, action) => {
    Object.freeze(state);
    switch(action.type) {
        case RECEIVE_SITTERS:
            return action.sitters
        case RECEIVE_SITTER:
            const newSitter = { [action.sitter.id]: action.sitter };
            return merge({}, state, newSitter);
        default:
            return state
    }
};

export default sittersReducer;