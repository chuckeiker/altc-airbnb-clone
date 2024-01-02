import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { createReview, updateReview } from '../../store/reviews'; // Replace with the actual action imports
import './ReviewsForm.css';
import StarRatings from 'react-star-ratings';
// import { getUser } from '../../store/users'
import { useEffect } from 'react';

const ReviewsForm = ({ reservation, onClose }) => {

    const dispatch = useDispatch();
    const user = useSelector(state => state.session.user);
    // const host = useSelector(getUser(reservation.listing?.hostId));
    const [rating, setRating] = useState({
        accuracy: 0,
        checkIn: 0,
        cleanliness: 0,
        communication: 0,
        location: 0,
        value: 0,
    });

    const [body, setBody] = useState('');

    useEffect(() => {
        if (reservation.reviews) {
            setRating({
                accuracy: reservation.reviews.accuracy || 0,
                checkIn: reservation.reviews.checkIn || 0,
                cleanliness: reservation.reviews.cleanliness || 0,
                communication: reservation.reviews.communication || 0,
                location: reservation.reviews.location || 0,
                value: reservation.reviews.value || 0,
            });
            setBody(reservation.reviews.body)
        }
    }, [reservation.reviews]);

    const handleReviewSubmit = (e) => {
        e.preventDefault();

        const reviewRatingAvg = Math.floor((rating.accuracy + rating.checkIn + rating.cleanliness + rating.communication + rating.location + rating.value)/6 * 10) / 10;

        let reviewData = {}
        if (reservation.reviews) {
            reviewData = {
            id: reservation.reviews.id,
            ...rating,
            body,
            rating: reviewRatingAvg,
        };
        } else {
            reviewData = {
            ...rating,
        listingId: reservation.listing.id,
        reviewerId: user.id,
        reservationId: reservation.id,
            body,
            rating: reviewRatingAvg,
            }
        }


        if (reservation.reviews) {
        reviewData.reviewId = reservation.reviews.id;
        dispatch(updateReview(reviewData));
        } else {
        dispatch(createReview(reviewData));
        }
        onClose();
    };


    const handleAccuracyRatingChange = (newRating) => {
        setRating((prevRating) => ({
            ...prevRating,
            accuracy: newRating,
        }));
    };

    const handleCheckInRatingChange = (newRating) => {
        setRating((prevRating) => ({
            ...prevRating,
            checkIn: newRating,
        }));
    };

    const handleCleanlinessRatingChange = (newRating) => {
        setRating((prevRating) => ({
            ...prevRating,
            cleanliness: newRating,
        }));
    };

    const handleCommunicationRatingChange = (newRating) => {
        setRating((prevRating) => ({
            ...prevRating,
            communication: newRating,
        }));
    };

    const handleLocationRatingChange = (newRating) => {
        setRating((prevRating) => ({
            ...prevRating,
            location: newRating,
        }));
    };

    const handleValueRatingChange = (newRating) => {
        setRating((prevRating) => ({
            ...prevRating,
            value: newRating,
        }));
    };

    return (
        <div className="reviews-form-modal-background">
        <div className="reviews-form-modal">
            <div id="above-divider-elements-review-form">
                <button onClick={onClose} className="close-button">X</button>
                <div>Write A New Review</div>
            </div>
            <div id='update-modal-divider'></div>
            
            <div className="trip-details">
                <div id='Trip-Details-container'>
                    <h2 id="Trip-Details-header">Trip Details:</h2>
                    <div className="trip-details-item">{reservation.listing.title}</div>
                    <div className="trip-details-item">{reservation.listing.address}</div>
                    {/* <div className="trip-details-item">Overall Rating: {"NA"}</div> */}
                    {/* <div className="trip-details-item">Hosted by: {"NA"}</div> */}
                    <div className="trip-details-item">From: {reservation.startDate} To: {reservation.endDate}</div>
                    <div className="trip-details-item">Guests: {reservation.numGuests}</div>
                </div>
                <img className="image-on-review-form" src={reservation.listing.photos[0].photoUrl} alt="Description" />
            </div>

            <div className="ratings-section">
                <div className="rating-row">
                    <div className="rating-category">Accuracy:</div>
                    <StarRatings
                        rating={rating.accuracy}
                        starRatedColor="black"
                        changeRating={(newRating) => handleAccuracyRatingChange(newRating)} 
                        numberOfStars={5} 
                        starDimension="20px" 
                        name="rating" 
                        starHoverColor="black"  
                    />
                    <select 
                    onChange={(e) => handleAccuracyRatingChange(parseInt(e.target.value))}
                    value={rating.accuracy}
                    className="rating-drop-down-menu"
                    >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        
                    </select>
                </div>
                <div className="rating-row">
                    <div className="rating-category">CheckIn:</div>
                    <StarRatings
                        rating={rating.checkIn}
                        starRatedColor="black"
                        changeRating={(newRating) => handleCheckInRatingChange(newRating)} 
                        numberOfStars={5} 
                        starDimension="20px" 
                        name="rating" 
                        starHoverColor="black"  
                    />
                    <select 
                    onChange={(e) => handleCheckInRatingChange(parseInt(e.target.value))}
                    value={rating.checkIn}
                    className="rating-drop-down-menu"
                    >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        
                    </select>
                </div>
                <div className="rating-row">
                    <div className="rating-category">Cleanliness:</div>
                    <StarRatings
                        rating={rating.cleanliness}
                        starRatedColor="black"
                        changeRating={(newRating) => handleCleanlinessRatingChange(newRating)} 
                        numberOfStars={5} 
                        starDimension="20px" 
                        name="rating" 
                        starHoverColor="black"  
                    />
                    <select 
                    onChange={(e) => handleCleanlinessRatingChange(parseInt(e.target.value))}
                    value={rating.cleanliness}
                    className="rating-drop-down-menu"
                    >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        
                    </select>
                </div>
                <div className="rating-row">
                    <div className="rating-category">Communication:</div>
                    <StarRatings
                        rating={rating.communication}
                        starRatedColor="black"
                        changeRating={(newRating) => handleCommunicationRatingChange(newRating)} 
                        numberOfStars={5} 
                        starDimension="20px" 
                        name="rating" 
                        starHoverColor="black"  
                    />
                    <select 
                    onChange={(e) => handleCommunicationRatingChange(parseInt(e.target.value))}
                    value={rating.communication}
                    className="rating-drop-down-menu"
                    >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        
                    </select>
                </div>
                <div className="rating-row">
                    <div className="rating-category">Location:</div>
                    <StarRatings
                        rating={rating.location}
                        starRatedColor="black"
                        changeRating={(newRating) => handleLocationRatingChange(newRating)} 
                        numberOfStars={5} 
                        starDimension="20px" 
                        name="rating" 
                        starHoverColor="black"  
                    />
                    <select 
                    onChange={(e) => handleLocationRatingChange(parseInt(e.target.value))}
                    value={rating.location}
                    className="rating-drop-down-menu"
                    >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        
                    </select>
                </div>
                <div className="rating-row">
                    <div className="rating-category">Value:</div>
                    <StarRatings
                        rating={rating.value}
                        starRatedColor="black"
                        changeRating={(newRating) => handleValueRatingChange(newRating)} 
                        numberOfStars={5} 
                        starDimension="20px" 
                        name="rating" 
                        starHoverColor="black"  
                    />
                    <select 
                    onChange={(e) => handleValueRatingChange(parseInt(e.target.value))}
                    value={rating.value}
                    className="rating-drop-down-menu"
                    >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        
                    </select>
                </div>
            </div>

            <form onSubmit={handleReviewSubmit}>
                <div className="review-text">
                <textarea
                className="review-text-textarea"
                    style={{ resize: 'none' }}
                    value={body}
                    onChange={(e) => setBody(e.target.value)}
                    placeholder='Write your review here ...'
                />
                </div>
                <div id='review-form-bottom-buttons'>
                    <button id='review-submit-button' onClick={handleReviewSubmit} type="submit">{reservation.reviews ? 'Update Review' : 'Post Review'}</button>
                    <button id='review-cancel-button' onClick={onClose}>Cancel</button>
                </div>
            </form>
        </div>
        </div>
    );
};

export default ReviewsForm;

