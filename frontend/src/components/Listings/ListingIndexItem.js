import React from 'react';
import { Link } from 'react-router-dom';
import hobbitHouse1 from '../../Assets/hobbitHouse1.webp'
import hobbitHouse2 from '../../Assets/hobbitHouse2.png'
import hobbitHouse3 from '../../Assets/hobbitHouse3.jpeg'
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
import 'font-awesome/css/font-awesome.min.css';

const ListingIndexItem = ({ listing }) => {


    let images =[hobbitHouse1, hobbitHouse2, hobbitHouse3]
    if (listing.photos[0].photoUrl) images = [listing.photos[0].photoUrl, listing.photos[1].photoUrl, listing.photos[2].photoUrl, listing.photos[3].photoUrl, listing.photos[4].photoUrl]
    // '********')

    const sliderSettings = {
        dots: false,
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
    };


    const goToPrevious = (e) => {
        e.preventDefault()
        e.stopPropagation()
        slider.slickPrev();
    };

    const goToNext = (e) => {
        e.preventDefault()
        e.stopPropagation()
        slider.slickNext();
    };


    let slider;

    return (
        <Link className='listingItem' to={`/listings/${listing.id}`} >
            <div className='custom-carousel'>
                <Slider ref={(c) => (slider = c)} {...sliderSettings}>
                {images.map((image, index) => (
                    <div id='carouselImgContainer' key={index}>
                    <img
                        className='listingItemImg'
                        src={image}
                        alt={listing.title}
                    />
                    </div>
                ))}
                </Slider>
                <div className='carousel-buttons-container'>
                    <button className='carousel-buttons' onClick={goToPrevious}>
                        <i className="fa fa-chevron-left"></i>
                    </button>
                    <button className='carousel-buttons' onClick={goToNext}>
                        <i className="fa fa-chevron-right"></i>
                    </button>
                </div>
            </div>
            <li style={{ fontWeight: 'bold' }}>{listing.title}</li>
            <li>{listing.address}</li>
            <li style={{ fontWeight: 'bold' }}>${listing.price} night</li>
        </Link>
    )
}
    export default ListingIndexItem
