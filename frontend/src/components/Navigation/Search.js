import { useSelector } from 'react-redux';
import { fetchSearchResults } from '../../store/search'
import { useDispatch } from 'react-redux';
import { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom/cjs/react-router-dom.min';
import ListingIndex from '../Listings/ListingIndex';


const Search = () => {
    
    const dispatch = useDispatch();
    const location = useLocation();
    const searchResults = useSelector((state) => state.search);///this could also be a source of fixing prb
    const searchParams = new URLSearchParams(location.search);
    const query = searchParams.get("query");
    const noResults = Object.keys(searchResults).length === 0;

    


    const [cachedSearchResults, setCachedSearchResults] = useState({});
    useEffect(() => {
        if (query) {
            dispatch(fetchSearchResults(query));
        }
        setCachedSearchResults(searchResults);
    }, [query,dispatch]);




    return(
        <>
            {noResults && 
                <div id='no-search-results-found-text'><i className="far fa-frown"></i> No results containing "{query}"</div>
            }
            <ListingIndex searchResults={Object.values({...cachedSearchResults, 999: {id: 'host'}})}/>
        </>
    );
}

export default Search