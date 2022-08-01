import {Container} from "react-bootstrap";
import GithubHealthAlert from "../component/GithubHealthAlert";
import GithubProfileCard from "../component/GithubProfileCard";

function GithubBlogFiles() {
    return <>
        <Container>
            todo lol. {GithubBlogFiles.name}
        </Container>
    </>
}

const GithubApp = () => {

    return <>
        {/*<GithubHealthAlert/>*/}
        <GithubProfileCard/>
        <h1>{GithubApp.name} wip</h1>
        <GithubBlogFiles/>
    </>;
}

export default GithubApp

