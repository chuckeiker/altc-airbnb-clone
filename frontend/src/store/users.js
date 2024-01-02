import { RECEIVE_LISTING } from './listings'


export const getUser = userId => {

    return state => {
        if (state.users) return state.users[userId];
        return null;
    }
}


const usersReducer = (state = {}, action) => {
    const nextState = {...state}
    switch (action.type) {

        case RECEIVE_LISTING:
            nextState[action.data.host.id] = action.data.host;
            return nextState;
        default:
            return state;
    }
};

export default usersReducer;