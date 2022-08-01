import {Container} from "react-bootstrap";
import GithubHealthAlert from "../component/GithubHealthAlert";

function GithubBlogFiles() {
    return <>
        <Container>
            todo lol. {GithubBlogFiles.name}
        </Container>
    </>
}

const GithubApp = () => {

    return <>
        <GithubHealthAlert/>
        <h1>{GithubApp.name} wip</h1>
        <GithubBlogFiles/>
    </>;
}

export default GithubApp

