import {fetchGithubProfile, GithubService} from "../service/GithubService";
import {OWNER_GH_USERNAME} from "../Config";
import {useEffect, useState} from "react";

const GithubProfileCard = () => {

    var data = fetchGithubProfile(OWNER_GH_USERNAME)

    const [someData, setSomeData] = useState<any | null>(null)

    useEffect(() => {

            const fetchThing = async () => {
                const resp = await GithubService.fetchGithubProfile('henryfbp')

                const json:Object = await resp.json()

                console.log(json)

                setSomeData(json)
            }

            fetchThing()

        },
        [])

    return <>
        <div>
            <p>asdfasdafdfasd</p>
            <p>{someData?.message}</p>
        </div>
    </>
}

export default GithubProfileCard