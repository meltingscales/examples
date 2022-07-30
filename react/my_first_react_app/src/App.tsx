import React, {useEffect, useState} from 'react';
import './App.css';

const Counter = () => {

    var initialNumber = 0

    //lets us have state
    const [counter, setCounter] = useState(initialNumber)

    //run on counter change
    useEffect(() => {
            console.log("counter is now " + counter)

            if ((Math.abs(counter) % 10 == 0) && (counter !== 0)) {
                alert("wow! big number! its divisible by 10!")
            }
        },
        [counter]
    );

    return (
        <>

            <button onClick={() => {
                setCounter(counter - 1)
            }}>
                -
            </button>
            <h1>{counter}</h1>
            <button onClick={() => {
                setCounter(counter + 1)
            }}>
                +
            </button>
            <br/>
            <button onClick={() => {
                setCounter(initialNumber)
            }}>
                Reset
            </button>

        </>
    )
}

const Person = (props: any) => {


    let eltName = <h1>Name: {props.name}</h1>;
    let eltLastName = <h2>Last Name: {props.lastName}</h2>;


    if (props.nameHidden) {
        eltName = <h1>Name is hidden :)</h1>
        eltLastName = <h2>Last name is hidden :)</h2>
    }


    return (
        <>
            {eltName}
            {eltLastName}
            <h2>Age: {props.age}</h2>
        </>
    )
}

const App = () => {

    const name = 'Henry'
    const lname = 'Post'
    const age = 24

    const randFloat = Math.random()

    const isNameHidden = randFloat >= 0.5;

    const personProps = {
        name: name,
        lastName: lname,
        nameHidden: isNameHidden,
        age: age
    }

    return (
        <div className="App">
            <Counter></Counter>
            <p>randFloat={("" + randFloat).slice(0, 4)}</p>
            <h1>hello react :3c</h1>
            <Person {...personProps}/>
            <Person
                name={'Jane'}
                lastName={'Doe'}
                age={29 + 1}
            />
        </div>
    );
}

export default App;
