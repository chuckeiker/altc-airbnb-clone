export const RECEIVE_LISTINGS = 'listings/RECEIVE_LISTINGS';
export const RECEIVE_LISTING = 'listings/RECEIVE_LISTING';
export const REMOVE_LISTING = 'listings/REMOVE_LISTING';

export const receiveListings = listings => {
    return {
        type: RECEIVE_LISTINGS,
        listings
    }
};

export const receiveListing = data => {
    return {
        type: RECEIVE_LISTING,
        data
    }
};

export const removeListing = listingId => {
    return {
        type: REMOVE_LISTING,
        listingId
    }
};

export const getListing = listingId => {

    return state => {

        if (state.listings) return state.listings[listingId];
        return null;
    }
}

export const getListings = state => {
    if (state.listings) return Object.values(state.listings);
    return [];
}

export const fetchListings = () => async dispatch => {
    const res = await fetch('/api/listings');

    if (res.ok) {

        const listings = await res.json();

        dispatch(receiveListings(listings));
    }
}

export const fetchListing = listingId => async dispatch => {
    const res = await fetch(`/api/listings/${listingId}`);

    if (res.ok) {

        const listing = await res.json();
        // debugger
        dispatch(receiveListing(listing));
    }
}

export const createListing = listing => async dispatch => {
    const res = await fetch('api/listings', {
        method: 'POST',
        body: JSON.stringify(listing),
        headers: {
            'Content-Type': 'application/json'
        }
    });

    if (res.ok) {
        const listing = await res.json();
        dispatch(receiveListing(listing));
    }
}

export const updateListing = listing => async dispatch => {
    const res = await fetch(`api/listings/${listing.id}`, {
        method: 'PATCH',
        body: JSON.stringify(listing),
        headers: {
            'Content-Type': 'application/json'
        }
    });

    if (res.ok) {
        const listing = await res.json();
        dispatch(receiveListing(listing));
    }
}

export const deleteListing = listingId => async dispatch => {
    const res = await fetch(`api/listings/${listingId}`, {
        method: 'DELETE'
    });

    if (res.ok) {

        dispatch(removeListing(listingId));
    }
}

const listingsReducer = (state = {}, action) => {
    const nextState = {...state}

    switch (action.type) {
        case RECEIVE_LISTINGS:
            return { ...action.listings };
        case RECEIVE_LISTING:
            // debugger
            nextState[action.data.listing.id] = action.data.listing;
            return nextState;
        case REMOVE_LISTING:
            delete nextState[action.listingId];
            return nextState;
        default:
            return state;
    }
};

export default listingsReducer;