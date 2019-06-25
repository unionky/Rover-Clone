import React from 'react';
import GreetingContainer from './greeting/greeting_container';
import LoginFormContainer from './session_form/login_form_container';
import SignupFormContainer from './session_form/signup_form_container';
import { AuthRoute } from '../util/route_util';

const App = () => (
    <div>
        <header>
            <h3 class='left-bar-nav'>Pawsitters!!! from app.jsx</h3>
            <GreetingContainer />
        </header>

        <AuthRoute path="/login" component={ LoginFormContainer } />
        <AuthRoute path="/signup" component={ SignupFormContainer } />
    </div>
);

export default App;