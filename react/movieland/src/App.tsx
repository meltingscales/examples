import React, {useEffect, useState} from "react";
import './App.css'
import SearchIcon from './search.svg'
import MovieGallery from "./MovieGallery";

const REACT_APP_OMDB_API_KEY = process.env.REACT_APP_OMDB_API_KEY

console.log('REACT_APP_OMDB_API_KEY=' + REACT_APP_OMDB_API_KEY)

if (!REACT_APP_OMDB_API_KEY) {
    throw "Error! You must create a file called `.env` and populate it with REACT_APP_OMDB_API_KEY"
}

const sampleMovie = {
    "Title": "Iron Man 3",
    "Year": "2013",
    "imdbID": "tt1300854",
    "Type": "movie",
    "Poster": "https://m.media-amazon.com/images/M/MV5BMjE5MzcyNjk1M15BMl5BanBnXkFtZTcwMjQ4MjcxOQ@@._V1_SX300.jpg"
}

const API_URL = `https://www.omdbapi.com/?apikey=${REACT_APP_OMDB_API_KEY}`

const CodeBlock = (props: any) => {
    return <>
        <pre><code>{props.data}</code></pre>
    </>
}

const App = () => {

    const defaultSearch = 'iron man'

    const [moviesResponse, setMoviesResponse] = useState<any>([])
    const [searchTerm, setSearchTerm] = useState<string>(defaultSearch)


    const searchMovies = async (title: string) => {
        const response = await fetch(`${API_URL}&s=${title}`)
        const data = await response.json()

        console.log(data)

        setMoviesResponse(data)
    }

    useEffect(() => {
        var movieResponse = searchMovies(defaultSearch)
    }, [])

    return (
        <div className='app'>
            <h1>MovieLand</h1>
            <div className={"search"}>
                <input
                    placeholder={'Search for movies'}
                    value={searchTerm}
                    onChange={(event) => setSearchTerm(event.target.value)}
                    onSubmit={(event) => searchMovies(searchTerm)}
                />
                <img
                    src={SearchIcon}
                    alt={"Search for movies"}
                    onClick={() => searchMovies(searchTerm)}
                />
            </div>

            <MovieGallery movies={moviesResponse.Search}/>

        </div>
    )
}

export default App;