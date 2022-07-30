import React, {useEffect} from "react";
import './App.css'
import SearchIcon from './search.svg'
import MovieCard from "./MovieCard";

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


    const searchMovies = async (title: string) => {
        const response = await fetch(`${API_URL}&s=${title}`)
        const data = await response.json()

        console.log(data)

        return 'todo lol'
    }

    useEffect(() => {
        // var movieResponse = searchMovies('iron man')
    }, [])

    return (
        <div className='app'>
            <h1>MovieLand</h1>
            <div className={"search"}>
                <input
                    placeholder={'search for movies'}
                    value={'Iron man'}
                    onChange={() => {
                    }}/>
                <img
                    src={SearchIcon}
                    alt={"Search for a movie"}
                    onClick={() => {
                    }}
                />
            </div>
            <div className={'container'}>
                <MovieCard {...sampleMovie}/>
                <MovieCard {...sampleMovie}/>
                <MovieCard {...sampleMovie}/>
                <MovieCard {...sampleMovie}/>
            </div>
        </div>
    )
}

export default App;