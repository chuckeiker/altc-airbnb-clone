import csrfFetch from './csrf'

export const GET_SEARCH_RESULTS = 'search/searchResults';
export const CLEAR_SEARCH_RESULTS = 'search/clear/SearchResults';

export const receiveSearchResults = (searchResults, query) => ({
    type: GET_SEARCH_RESULTS,
    searchResults,
    query
});

export const clearSearchResults = () => ({
    type: CLEAR_SEARCH_RESULTS,
});

let lastSearchQuery = null;
export const fetchSearchResults = (query) => async dispatch => {
    lastSearchQuery = query;
    const res = await csrfFetch(`/api/listings/search?query=${query}`)
    const data = await res.json();

    dispatch(receiveSearchResults(data, query));
    
}

const  searchReducer = (state = {}, action) => {
    const newState = {...state};

    switch (action.type) {
        case GET_SEARCH_RESULTS:
            if (action.query === lastSearchQuery) {
                return {...action.searchResults.listings}
            }
            return newState;
        case CLEAR_SEARCH_RESULTS:
            return {};
        default:
            return newState;
    }
}

export default searchReducer;