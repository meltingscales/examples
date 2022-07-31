import {Container} from "react-bootstrap";
import PrettyJSON from "../component/PrettyJSON";

class GithubZenResponse {
    response: Response
    statusCode: number;
    responseText: string;
    timestamp: Date;

    constructor(response: Response, responseText: string) {
        this.response = response
        this.statusCode = response.status
        this.responseText = responseText
        this.timestamp = new Date()
    }

    healthy() {
        return this.statusCode === 200
    }

    asErrorElt() {

        var respText = this.responseText

        return <Container>
            <p>Status code: {this.statusCode}</p>
            <PrettyJSON data={respText}/>
        </Container>
    }

    asSuccessElt() {
        return <Container>
            <p>Github is online at {this.timestamp.toString()}!</p>
            <br/>
            <span>Quote: "{this.responseText}"</span>
        </Container>
    }


}


export default GithubZenResponse;