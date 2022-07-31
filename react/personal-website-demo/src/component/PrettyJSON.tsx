import {Container} from "react-bootstrap";
import exp from "constants";

const PrettyJSON = (props: { data: {} }) => {

    return (
        <>
            <pre><code>{JSON.stringify(props.data)}</code></pre>
        </>
    )
}
export default PrettyJSON;