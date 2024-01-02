import { Link } from 'react-router-dom';
import { deleteReservation } from '../../store/reservations'
import { useDispatch, useSelector } from 'react-redux';
import React, { useState } from "react";
import DatePicker from 'react-datepicker';
import { updateReservation } from '../../store/reservations';
import ReviewsForm from '../Reviews/ReviewsForm';
import { deleteReview } from '../../store/reviews';

function getReservationTime (reservation) {
    const currentDate= new Date()

    const startDate = new Date(reservation.startDate);
    const endDate = new Date(reservation.endDate);
    // debugger

    if (endDate < currentDate) {
        return 'past'
    } else if (startDate <= currentDate && endDate >= currentDate) {
        return 'current'
    } else {
        return 'upcoming'
    }
}

const ReservationIndexItem = ({listing, reservation}) => {

    const dispatch = useDispatch()
    let image
    if (listing.photos[0].photoUrl) image = listing.photos[0].photoUrl
    const typeOfReservation = getReservationTime(reservation)
    const [showInfoModal, setShowInfoModal] = useState(false);
    const [startDate, setStartDate] = useState(new Date(reservation.startDate));
    const [endDate, setEndDate] = useState(new Date(reservation.endDate));
    const [numGuests, setNumGuests] = useState(reservation.numGuests);
    const user = useSelector(state => state.session.user);
    const [showReviewsForm, setShowReviewsForm] = useState(false);


    const handleDelete = (e) => {
        e.preventDefault()
        dispatch(deleteReservation(reservation.id))
    }


    const toggleInfoModal = (e) => {
        if (e) e.preventDefault()
        setShowInfoModal(!showInfoModal);
        setNumGuests(reservation.numGuests)
        setEndDate(new Date(reservation.endDate))
        setStartDate(new Date(reservation.startDate))
    };



    const calculateTotalPrice = () => {
        return listing.price * Math.floor((endDate.getTime() - startDate.getTime())/86400000 + 1)
    }

    const handleReserveSubmit = (e) => {
        e.preventDefault();
        if (startDate && endDate && numGuests){

            const reservationData = {
            id: reservation.id,
            listing_id: reservation.listing.listingId,
            guest_id: user.id,
            num_guests: numGuests,
            total_price: calculateTotalPrice(startDate, endDate),
            start_date: startDate.toISOString(),
            end_date: endDate.toISOString(),
            };
            dispatch(updateReservation(reservationData))
            toggleInfoModal()
        }
    }





    function CustomDatePickerInput({ value, onClick, side }) {
    return (
        <input
        type="text"
        value={value}
        onClick={onClick}
        readOnly
        placeholder={(side === 'bookingFormDropDownButtons1update') ? 'Select Start Date' : 'Select End Date' }
        className={side}
        />
    );
    }

    const handleReviewForm = (e) => {
        e.preventDefault();
        setShowReviewsForm(!showReviewsForm);
    }
    
    const handleDeleteReview = (e) => {
        e.preventDefault();
        dispatch(deleteReview(reservation.reviews.id))
    }


    return (
        <>
        {showInfoModal && (
                <div id="info-modal">
                    <div id="info-modal-content">
                        <button id='info-modal-content-x-button' onClick={toggleInfoModal}>X</button>
                        <div id='update-modal-divider'></div>
                        <div id='listing-date-update-form'>From {reservation.startDate} to {reservation.endDate}</div>
                        <div id='listing-title-update-form'>{reservation.listing.title}</div>
                        <div id='listing-address-update-form'>{reservation.listing.address}</div>
                        <div id='listing-guests-update-form'>Guests: {reservation.numGuests}</div>
                        <img
                            className='reservationItemImgUpdate'
                            src={reservation.listing.photos[0].photoUrl}
                            alt={reservation.listing.title}
                        />
                        <div id='calendar-update-container'>
                            <DatePicker
                                selected={startDate}
                                onChange={date => setStartDate(date)}
                                selectsStart
                                startDate={startDate}
                                endDate={endDate}
                                customInput={<CustomDatePickerInput side='bookingFormDropDownButtons1update' />}
                                minDate={new Date()}
                                maxDate={endDate}
                                open
                                popperPlacement="bottom"
                            />
                            <DatePicker
                                selected={endDate}
                                onChange={date => setEndDate(date)}
                                selectsEnd
                                startDate={startDate}
                                endDate={endDate}
                                customInput={<CustomDatePickerInput side='bookingFormDropDownButtons2update' />}
                                minDate={startDate ? startDate : new Date()}
                                open
                                popperPlacement="bottom"
                            />
                        </div>
                        <input 
                            className='bigBookingFormDropDownButtonUpdate'
                            type="number"
                            max={999}
                            min={1}
                            placeholder={`Number of Guests ${numGuests}`}
                            onChange={(e) => setNumGuests(e.target.value)}
                        />
                        <button onClick={handleReserveSubmit} id='submit-update-reservation-button'>Update</button>
                    </div>
                </div>
        )}
        <Link className='reservationItem' to={`/listings/${listing.id}`} >
                <img
                    className='reservationItemImg'
                    src={image}
                    alt={listing.title}
                />
            <ul id='reservation-text-box'>
                <li>{listing.title}</li>
                <li>{listing.address}</li>
                <li>{reservation.startDate} to {reservation.endDate}</li>
                <li>Guests: {reservation.numGuests}</li>
                <li>${listing.price} night</li>
                {typeOfReservation === 'current' && (
                    reservation.reviews ? (
                        <>
                        <button className='reservations-listing-buttons' onClick={handleReviewForm}>Update Review</button>
                        <button className='reservations-listing-buttons' onClick={handleDeleteReview}>Remove Review</button>
                        </>
                    ) : (
                        <button className='reservations-listing-buttons' onClick={handleReviewForm}>Write Review</button>
                    )
                )}

                {typeOfReservation === 'upcoming' && (
                    <>
                        <button onClick={toggleInfoModal} className='reservations-listing-buttons'>Update</button>
                        <button onClick={handleDelete} className='reservations-listing-buttons'>Cancel</button>
                    </>
                )}

                {typeOfReservation === 'past' && (
                    reservation.reviews ? (
                        <>
                        <button className='reservations-listing-buttons' onClick={handleReviewForm}>Update Review</button>
                        <button className='reservations-listing-buttons' onClick={handleDeleteReview}>Remove Review</button>
                        </>
                    ) : (
                        <button className='reservations-listing-buttons' onClick={handleReviewForm}>Write Review</button>
                    )
                )}
            </ul>
        </Link>

        {showReviewsForm && (
            <ReviewsForm
            reservation={reservation}
            onClose={() => setShowReviewsForm(false)}
            />
        )}

        </>
    )

    }
    export default ReservationIndexItem