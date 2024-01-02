import { useEffect, useState } from 'react';
import { useParams, useHistory } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getListing, fetchListing} from '../../store/listings';
import './ListingShow.css'
import { getUser } from '../../store/users'
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import { createReservation } from '../../store/reservations'
import LoginForm from '../LoginFormModal/LoginForm';
import SignUpForm from '../SignUpFormModal/SignUpForm';
import { Modal } from '../../context/Modal';




const ListingShow = () => {

    const {listingId} = useParams();
    const listing = useSelector(getListing(listingId));
    const host = useSelector(getUser(listing?.hostId));
    const [startDate, setStartDate] = useState(null);
    const [endDate, setEndDate] = useState(null);
    const [numGuests, setNumGuests] = useState(0);
    const user = useSelector(state => state.session.user);
    const dispatch = useDispatch();
    const history = useHistory();
    const [LoginshowModal, setLoginShowModal] = useState(false);
    const [SignUpshowModal, setSignUpShowModal] = useState(false);


    useEffect(() => {
        dispatch(fetchListing(listingId));
    }, [listingId, dispatch]);

    useEffect(() => {
        setSignUpShowModal(false)
        setLoginShowModal(false)
    }, [user]);

    function CustomDatePickerInput({ value, onClick, side }) {
    return (
        <input
        type="text"
        value={value}
        onClick={onClick}
        readOnly
        placeholder={(side === 'bookingFormDropDownButtons1') ? 'Start Date' : 'End Date'}
        className={side}
        />
    );
    }

    const calculateTotalPrice = () => {
        return listing.price * Math.floor((endDate.getTime() - startDate.getTime())/86400000 + 1)
    }

    const handleReserveSubmit = (e) => {
        e.preventDefault();
        if (startDate && endDate && numGuests){

            const reservationData = {
            listing_id: listingId,
            guest_id: user.id,
            num_guests: numGuests,
            total_price: calculateTotalPrice(startDate, endDate),
            start_date: startDate.toISOString(),
            end_date: endDate.toISOString(),
            };
            dispatch(createReservation(reservationData))
            history.push('/reservations')
        }
    }


    const handleLogIn = (e) => {
        e.preventDefault();
        setLoginShowModal(true)
    }

    const handleSignIn = (e) => {
        e.preventDefault();
        setSignUpShowModal(true)
    }

    

    if (!listing || !host || !listing.reviews ) return null
    // console.log(listing.reviews)

    return (
        <>
            <div id='showContainer'>
                <div id='showPageTitle'>{listing.title}</div>
                <div id='miniNavBarShowPage'>Stars...   Reviews...   {listing.address}</div>
                <div id='showImgContainer' >
                    <img id='bigShowImg' src={listing.photos[0].photoUrl} alt='Listing img' />
                    <div id='smallShowImgContainer'>
                        <img id='smallShowImg' src={listing.photos[1].photoUrl} alt='Listing img' />
                        <img id='smallShowImg' src={listing.photos[2].photoUrl} alt='Listing img' />
                        <img id='smallShowImg' src={listing.photos[3].photoUrl} alt='Listing img' />
                        <img id='smallShowImg' src={listing.photos[4].photoUrl} alt='Listing img' />
                    </div>
                </div>

                <div id='firstHalfShowInformationBox'>
                    <div id='listingInformation'>
                        <div id='hostedByUsername'>Hosted by {host.firstName} {host.lastName}</div>
                        <div>{listing.numBedrooms} bedrooms : {listing.numBeds} beds : {listing.numberBathrooms} : baths</div>
                        <div id='showDescription'>{listing.description}</div>
                    </div>
                    <form id='tempBookingForm'>
                        <div id='topBookingFormInfo'>
                            <div>${listing.price} night</div>
                            <div>Reviews...</div>
                        </div>
                        {user && 
                        <>
                        <div id='bookingFormDropDownButtonsContainer'>
                            <DatePicker
                                selected={startDate}
                                onChange={date => setStartDate(date)}
                                selectsStart
                                startDate={startDate}
                                endDate={endDate}
                                customInput={<CustomDatePickerInput side='bookingFormDropDownButtons1' />}
                                minDate={new Date()}
                                maxDate={endDate}
                            />
                            <DatePicker
                                selected={endDate}
                                onChange={date => setEndDate(date)}
                                selectsEnd
                                startDate={startDate}
                                endDate={endDate}
                                customInput={<CustomDatePickerInput side='bookingFormDropDownButtons2' />}
                                minDate={startDate ? startDate : new Date()}
                            />
                        </div>
                        <input 
                            className='bigBookingFormDropDownButton'
                            type="number"
                            max={999}
                            min={1}
                            placeholder="Number of Guests"
                            onChange={(e) => setNumGuests(e.target.value)}
                        />
                        <button onClick={handleReserveSubmit} id='bigRedBookingReserveFormButton'>Reserve</button>
                        </>
                        }
                        {!user && 
                        <>
                            <button onClick={handleLogIn} id='bigRedBookingReserveFormButton2'>Log In</button>
                            <button onClick={handleSignIn} id='bigRedBookingReserveFormButton'>Sign Up</button>
                        </>
                        }
                    </form>
                </div>
                <div>
                    <div id='amenitiesTitle'>What this place offers</div>
                    <ul id='amenities'>
                        <li><i className="fa fa-snowflake-o"></i> {listing.hasAc ? 'AC : YES' : 'AC : NO'}</li>
                        <li><i className="fa fa-wifi"></i> {listing.hasWifi ? 'WiFi : YES' : 'WiFi : NO'}</li>
                        <li><i className="fa fa-paw"></i> {listing.hasPetsAllowed ? 'Pets allowed : YES' : 'Pets allowed : NO'}</li>
                        <li><i className="fas fa-tshirt"></i> {listing.hasWasherDryer ? 'Washer and Dryer : YES' : 'Washer and Dryer : NO'}</li>
                    </ul>
                </div>
                {listing.reviews && (
                <div className="listing-review-container">
                    {listing.reviews.map((review, index) => (
                    <div key={index} className="single-review">
                        <i className="fa fa-user-circle" style={{ color: 'red', fontSize: '30px' }}></i>
                        <div style={{ fontWeight: 'bold' }}>{review.reviewer.firstName} {review.reviewer.lastName}</div>
                        <div>{review.rating}</div>
                        <div>{review.body}</div>
                    </div>
                    ))}
                </div>
                )}
            </div>
            {LoginshowModal && (
                <Modal id='logInModal' onClose={() => setLoginShowModal(false)}>
                    <button className='xFormButton' onClick={() => setLoginShowModal(false)} >
                        <i className="fa-solid fa-times"></i>
                    </button>
                    <LoginForm />
                </Modal> 
            )}
            {SignUpshowModal && (
                <Modal id='signUpModal' onClose={() => setSignUpShowModal(false)}>
                    <button className='xFormButton' onClick={() => setSignUpShowModal(false)} >
                        <i className="fa-solid fa-times"></i>
                    </button>
                    <SignUpForm />
                </Modal> 
            )}
        </>
    );
}

export default ListingShow;