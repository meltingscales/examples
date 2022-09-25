import React, {useState} from 'react';
import logo from './logo.svg';
import './App.css';

function RandomNumberFetcher() {
    // Declare a new state variable, which we'll call "numbersData"
    const [numbersData, setNumbersData] = useState(
        {
            message: "No numbersData fetched",
            numbers: null,
        });


    function fetchData() {

        setNumbersData({
                numbers: null,
                message: "Loading, please wait...",
            }
        )

        fetch('http://localhost:3001/randomNumbers')
            .then((it: Response) => {
                return it.json();
            })
            .then((it) => {
                console.log(it)
                setNumbersData(it);
            })
            .catch((err) => {
                setNumbersData(err.toString())
            })

    }

    var numbersElt = null
    if (numbersData.numbers) {
        // @ts-ignore
        numbersElt = <p>Your numbers: {numbersData.numbers.join(',')}</p>
    }

    return (
        <div className={'my-frontend-test'}>
            <button onClick={fetchData}>Get random numbers!</button>
            <div>
                <p>Message: {numbersData.message}</p>
                {numbersElt}
            </div>
        </div>
    )
}


function App() {

    return (
        <div className="App">

            <RandomNumberFetcher/>

            {/*<header className="App-header">*/}
            {/*    <img src={logo} className="App-logo" alt="logo"/>*/}
            {/*    <p>*/}
            {/*        Edit <code>src/App.tsx</code> and save to reload.*/}
            {/*    </p>*/}
            {/*    <a*/}
            {/*        className="App-link"*/}
            {/*        href="https://reactjs.org"*/}
            {/*        target="_blank"*/}
            {/*        rel="noopener noreferrer"*/}
            {/*    >*/}
            {/*        Learn React*/}
            {/*    </a>*/}
            {/*</header>*/}
        </div>
    );
}

export default App;
