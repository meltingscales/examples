const PrettyJSON = (props:
                        {
                            name: string,
                            data: ({} | string)
                        }
) => {

    var theObj = props.data

    if (typeof (theObj) === 'string') {
        theObj = JSON.parse(theObj)
    }

    var prettyString = JSON.stringify(theObj, null, 2)

    return (
        <details>
            <summary>
                {PrettyJSON.name}: {props.name}
            </summary>
            <pre><code>{prettyString}</code></pre>
        </details>
    )
}
export default PrettyJSON;