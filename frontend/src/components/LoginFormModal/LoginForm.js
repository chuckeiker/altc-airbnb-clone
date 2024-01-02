import React, { useState } from "react";
import * as sessionActions from "../../store/session";
import { useDispatch } from "react-redux";

function LoginForm() {
  const dispatch = useDispatch();
  const [credential, setCredential] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({ credential, password }))
      .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });



  };

  return (
    <>
      <div id='headerOne' >
        <h1>Log in</h1>
      </div>
      <form id='loginForm' onSubmit={handleSubmit}>
        <h2>Welcome to Airdnd</h2>
        <label>
          <input
            className='topInputForRoundedCorners'
            type="text"
            value={credential}
            onChange={(e) => setCredential(e.target.value)}
            required
            placeholder="Email"
          />
        </label>
        <label>
          <input
            className='bottomInputForRoundedCorners'
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            placeholder="Password"
          />
        </label>
        <ul className='listOfErrors'>
          {errors.map(error => <li key={error}> <i className="fas fa-exclamation-circle" /> {error}</li>)}
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

export default LoginForm;