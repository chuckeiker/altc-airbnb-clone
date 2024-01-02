import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getListings, fetchListings } from '../../store/listings';
import ListingIndexItem from './ListingIndexItem';
import './ListingIndex.css'


const ListingIndex = ({searchResults}) => {
    let listings = useSelector(getListings);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchListings());
    }, [dispatch]);

    if (searchResults) listings = searchResults

    return (
        <>
            <ul id='listingsIndexPage'>
                {listings.slice(0, -1).map(listing => {
                    return <ListingIndexItem key={listing.id} listing={listing} />
                })}
            </ul>
        </>
    );
};

export default ListingIndex;