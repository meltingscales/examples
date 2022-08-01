import React from 'react';
import {Container} from "react-bootstrap";
import {OWNER_NAME} from "../Config";

const Home = () => {
    return <>
        <h1>{OWNER_NAME}</h1>
        <Container>
            <p>Hello, welcome to {OWNER_NAME}'s website.</p>
            <p>I am learning ReactJS :3c</p>
        </Container>
    </>;
}

export default Home;
