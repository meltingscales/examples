import {GithubService} from "../service/GithubService";
import {useEffect, useState} from "react";
import {Card} from "react-bootstrap";

function GithubProfileCard(props: any) {

    return <>
        <Card style={{width: '200px'}}>
            <Card.Img src={props.avatar_url}></Card.Img>
            <p>{props.bio}</p>
        </Card>
    </>
}

const GithubProfileApplet = (props: { username: string }) => {

    const [ghProfileData, setGhProfileData] = useState<any | null>(null)

    useEffect(() => {

            const fetchData = async () => {
                const resp = await GithubService.fetchGithubProfile(props.username)

                const json: Object = await resp.json()

                console.log(json)

                setGhProfileData(json)
            }

            fetchData()

        },
        [props.username]
    )

    if (!ghProfileData) {
        return <div>{GithubProfileApplet.name} not loaded.</div>
    }

    return <>
        <GithubProfileCard {...ghProfileData}/>
    </>
}

export default GithubProfileApplet