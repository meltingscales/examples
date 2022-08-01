import {Container} from "react-bootstrap";
import GithubHealthAlert from "../component/GithubHealthAlert";
import GithubProfileApplet from "../component/GithubProfileApplet";

function GithubBlogFiles() {
    return <>
        <Container>
            todo lol. {GithubBlogFiles.name}
        </Container>
    </>
}

const GithubApp = () => {

    return <>
        <h1>{GithubApp.name} wip</h1>
        <GithubHealthAlert/>
        <GithubProfileApplet username={'henryfbp'}/>
        <GithubBlogFiles/>
    </>;
}

export default GithubApp

