import React from 'react';
import {Container} from "react-bootstrap";

function About() {
    return <>
        <h1>About Website</h1>
        <Container>
            <p>
                Made with ReactJS.
                </p>
            <a href={'https://github.com/HenryFBP/examples/tree/master/react/personal-website-demo'}>
                See this link for project files.</a>
        </Container>
    </>;
}

export default About
