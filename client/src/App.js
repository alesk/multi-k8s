import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link} from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';


class App extends Component {
  render() {
    return (
      <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React Version 5</h1>
          <Link to="/">Home</Link>
          <Link to="/otherPage">otherPage</Link>
        </header>
        <div>
          <Route exact path="/" component={Fib}></Route>
          <Route exact path="/otherPage" component={OtherPage}></Route>
        </div>
      </div>
      </Router>
    );
  }
}

export default App;
