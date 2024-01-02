import csrfFetch from './csrf';

export const RECEIVE_REVIEW = 'reviews/RECEIVE_REVIEW';
export const REMOVE_REVIEW = 'reviews/REMOVE_REVIEW';


export const receiveReview = review => {
    return {
        type: RECEIVE_REVIEW,
        review
    }
};

export const removeReview = (reservationId) => {
    return {
        type: REMOVE_REVIEW,
        reservationId
    }
};

export const createReview = review => async dispatch => {
    const res = await fetch('/api/reviews', {
        method: 'POST',
        body: JSON.stringify(review),
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': sessionStorage.getItem("X-CSRF-Token"),
        }
    });

    if (res.ok) {
        const review = await res.json();
        dispatch(receiveReview(review));
    }
}


export const updateReview = review => async dispatch => {
    const res = await fetch(`api/reviews/${review.id}`, {
        method: 'PATCH',
        body: JSON.stringify(review),
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': sessionStorage.getItem("X-CSRF-Token"),
        }
    });

    if (res.ok) {
        const review = await res.json();
        dispatch(receiveReview(review));
    }
}

export const deleteReview = (reviewId) => async dispatch => {
    const res = await fetch(`api/reviews/${reviewId}`, {
        method: 'DELETE',
        headers: {
            'X-CSRF-Token': sessionStorage.getItem("X-CSRF-Token"),
        }
    });

    if (res.ok) {
        const review = await res.json();
        dispatch(removeReview(review.reservationId));
    }
}
