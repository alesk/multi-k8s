import React from 'react';
import { Link } from 'react-router-dom';

export default() => {
    return (
        <dov>
            Im some other page!
            <Link to='/'>Go back home</Link>
        </dov>
    );
};