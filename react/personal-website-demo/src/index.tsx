import React from 'react';
import ReactDOM from 'react-dom/client';
import {BrowserRouter, Route, Routes} from "react-router-dom";
import Layout from "./Layout";
import Home from "./pages/Home";
import Blog from "./pages/Blog";
import Contact from "./pages/Contact";
import GithubApp from "./pages/GithubApp";
import {OWNER_NAME} from "./Config";
import About from "./pages/About";

function NoPage() {
    return <div>nopage!</div>;
}

export default function App() {
    return <>
        <BrowserRouter>
            <Routes>
                <Route path={"/"}
                       element={<Layout/>}>
                    <Route index
                           element={<Home/>}/>
                    <Route path={"blog"}
                           element={<Blog/>}/>
                    <Route path={"contact"}
                           element={<Contact/>}/>
                    <Route path={"about"}
                           element={<About/>}/>
                    <Route path={"demoApps/githubApp"}
                           element={<GithubApp/>}/>
                    <Route
                        element={<NoPage/>}/>
                </Route>
            </Routes>
        </BrowserRouter>
    </>
}

const root = ReactDOM.createRoot(
    document.getElementById('root') as HTMLElement
);

document.title = OWNER_NAME

root.render(
    <React.StrictMode>
        <App/>
    </React.StrictMode>
);

