import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';
import homeImage from '../../Assets/airdnd-try-again.png'
import { useLocation } from 'react-router-dom';
import NavSearch from './NavSearch'

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
    const location = useLocation();

  const currentPathway = location.pathname;

  let catagories;
  let navBar;
  let socials;

  const segments = currentPathway.split('/');
  const id = segments[segments.length - 1];


  if (id) {
    catagories = undefined
    navBar = 'showTopDisplayBar'
    socials = 'controlling-the-socials2'

  } else {
    catagories = 'catagories'
    navBar = 'homeTopDisplayBar'
    socials = 'controlling-the-socials'
  }



  return (
    <div id='stickyContainer'>
      <ul id={navBar}>
        <li>
          <NavLink exact to="/">
            <img id='AirDnDHomeButton' src={homeImage} alt="Home" />
          </NavLink>
        </li>
        <NavSearch/>

        <div id={socials}>
        <ul className="social-media-list" id='top-profile-buttons'>
            <li>
                <a href="https://www.linkedin.com/in/avery-berry-6a562a253/" target="_blank">
                    <i id='socials-buttons' className="fab fa-linkedin"></i> 
                </a>
            </li>
            <li>
                <a href="https://github.com/AveryRBerry" target="_blank">
                    <i id='socials-buttons' className="fab fa-github"></i>
                </a>
            </li>
            <li>
                <a href="https://averyrberry.github.io/Portfolio/" target="_blank">
                    <i id='socials-buttons' className="fab fa-product-hunt"></i>
                </a>
            </li>
        </ul>
        </div>
        <li>
          <ProfileButton user={sessionUser} />
        </li>
      </ul>
      {catagories ? <ul  id='catagories'></ul> : null}
    </div>
  );
}

export default Navigation;