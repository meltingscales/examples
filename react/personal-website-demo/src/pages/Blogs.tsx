import GithubHealthAlert from "../component/GithubHealthAlert";
import {Container} from "react-bootstrap";


function GithubBlogFiles() {
    return <>
        <Container>
            todo lol. {GithubBlogFiles.name}
        </Container>
    </>
}

const Blogs = () => {

    return <>
        <GithubHealthAlert/>
        <h1>blogs</h1>
        <GithubBlogFiles/>
    </>;
}

export default Blogs

