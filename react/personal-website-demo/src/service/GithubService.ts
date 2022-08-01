import GithubZenResponse from "../model/GithubZenResponse";
import exp from "constants";

const SAMPLE_URL = 'https://github.com/HenryFBP/henryfbp.github.io/tree/master/content/posts'
const GH_BASE_API_URL = 'https://api.github.com'


export async function fetchGithubZenResponse(): Promise<GithubZenResponse> {
    const response = await fetch(GH_BASE_API_URL + '/zen')
    const data = await response.text()

    console.log(data)

    return new GithubZenResponse(response, data)
}



export * as GithubService from './GithubService';