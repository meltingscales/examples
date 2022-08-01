import Navigation from "./Navigation";
import {Outlet} from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import {Container} from "react-bootstrap";

const Layout = () => {
    return <>
        <Container>
            <Navigation/>
            <Container>
                <Outlet/>
            </Container>
        </Container>
    </>
}
export default Layout