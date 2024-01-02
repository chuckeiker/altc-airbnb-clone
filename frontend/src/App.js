import React from "react";
import { Route, Switch } from 'react-router-dom';
import Navigation from "./components/Navigation";
import ListingIndex from './components/Listings/ListingIndex';
import ListingShow from './components/Listings/ListingShow'
import Footer from './components/Navigation/Footer'
import Search from './components/Navigation/Search'
import ReservationIndex from './components/Reservations/Reservations'



function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route path='/search'>
          <Search/>
        </Route>
        <Route exact path="/" component={ListingIndex} />
        <Route exact path="/listings/:listingId" component={ListingShow} />
        <Route exact path="/reservations" component={ReservationIndex} />
      </Switch>
      <Footer/>
    </>
  );
}

export default App;