import MovieCard from "./MovieCard";
import React from "react";

const MovieGallery = (props: any) => {

    console.log(props)

    if (props.movies?.length <= 0 || (!(props.movies))) {
        return <div className={'empty'}>
            <h2>No movies found</h2>
        </div>
    }

    return <div className={'container'}>
        {
            props.movies.map((movie: any) => (
                <MovieCard {...movie}/>
            ))
        }
    </div>


}
export default MovieGallery