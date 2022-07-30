import React from 'react';
import './App.css';

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
            <h2>Age: 24</h2>
        </>
    )
}

const App = () => {

    const name = 'Henry'
    const lname = 'Post'

    const randFloat = Math.random()

    const isNameHidden = randFloat >= 0.5;

    const personProps = {
        name: name,
        lastName: lname,
        nameHidden: isNameHidden
    }

    return (
        <div className="App">
            <p>randFloat={("" + randFloat).slice(0, 4)}</p>
            <h1>hello react :3c</h1>
            <Person {...personProps}/>
        </div>
    );
}

export default App;
