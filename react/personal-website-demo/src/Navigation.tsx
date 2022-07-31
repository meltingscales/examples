import React from "react";
import {BrowserRouter, Route, Link} from "react-router-dom";

import {Container, Nav, Navbar} from "react-bootstrap";

const NavigationItem = (props: any) => (
    <>
        <Link replace={true} to={props.href} className={"nav-link"}>
            ~/{props.name}
        </Link>
    </>
)

const Navigation = () =>

    (
        <>
            <Navbar bg={'light'} expand={'sm'}>
                <Container>
                    <Navbar.Brand href={"/"}>/home/HenryPost</Navbar.Brand>
                    <Navbar.Toggle aria-controls={"basic-navbar-nav"}/>
                    <Navbar.Collapse id={'basic-navbar-nav'}>
                        <Nav className={'me-auto'}>
                            <NavigationItem href={"/"} name={"home"}/>
                            <NavigationItem href={"/blogs"} name={"blogs"}/>
                            <NavigationItem href={"/contact"} name={"contact"}/>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </>
    );

export default Navigation