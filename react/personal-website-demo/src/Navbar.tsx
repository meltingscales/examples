import React from "react";
import {BrowserRouter,Route,Link} from "react-router-dom";
const Navbar = () => <nav>
    <ul>
        <li>
            <Link to={'/'}>home</Link>
        </li>
        <li>
            <Link to={'/blogs'}>blogs</Link>
        </li>
        <li>
            <Link to={'/contact'}>contact</Link>
        </li>
    </ul>
</nav>;

export default Navbar