import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
// import './SignupForm.css';

function SignUpForm() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [errors, setErrors] = useState([]);

  // if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    if (password === confirmPassword) {
      setErrors([]);
      return dispatch(sessionActions.signup({ email, password, firstName, lastName }))
        .catch(async (res) => {
        let data;
        try {
          // .clone() essentially allows you to read the response body twice
          data = await res.clone().json();
        } catch {
          data = await res.text(); // Will hit this case if, e.g., server is down
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
    }
    return setErrors(['Confirm Password field must be the same as the Password field']);
  };

  return (
    <>
      <div id='headerOne' >
        <h1>Sign Up</h1>
      </div>
      <form id='SignUpForm' onSubmit={handleSubmit}>
        <h2>Welcome to Airdnd</h2>
        <label>
          <input
            className='topInputForRoundedCorners'
            type="text"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
            placeholder="Email"
          />
        </label>
        <label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            placeholder="Password"
          />
        </label>
        <label>
          <input
            type="password"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            required
            placeholder="Confirm password"
          />
        </label>
        <label>
          <input
            
            type="text"
            value={firstName}
            onChange={(e) => setFirstName(e.target.value)}
            required
            placeholder="First name"
          />
        </label>
        <label>
          <input
            className='bottomInputForRoundedCorners'
            type="text"
            value={lastName}
            onChange={(e) => setLastName(e.target.value)}
            required
            placeholder="Last name"
          />
        </label>
        <ul className='listOfErrors'>
          
          {errors.map((error) => <li key={error}><i className="fas fa-exclamation-circle" /> {error}</li>)}
          
        </ul>
        <button className='formButton' type="submit">Continue</button>
      <div id="or">or</div>
        <button
          id='demoUserButton' 
          className='formButton'
          onClick={(e) => {
            e.preventDefault();
            dispatch(sessionActions.login({ credential: 'demo@user.io', password: '!StrongPassword232305' }))
          }}
          >
          Demo User Log-In
        </button>
      </form>

    </>
  );
}

export default SignUpForm;