import React, { Component } from 'react';
import { connect } from 'react-redux';
// import PropTypes from 'prop-types';
import { fetchItems } from '../actions/actionCreators';
import './AppContainer.css';
import Clock from './Clock';

const tmpAction = {
  type: 'DO_IT',
};

class AppContainer extends Component {
  constructor(props) {
    super(props);
    // this.state = { date: new Date() };
    this.doSomeClick = this.doSomeClick.bind(this);
  }

  componentWillMount() {
    // console.log('componentWillMount');
    // console.log(this);
  }

  componentDidMount() {
    // this.timerID = setInterval(() => this.tick(), 1000);
    // console.log(this);
    console.log(this.props);
    // this.props.dispatch(tmpAction);
    // console.log(this);
    this.props.fetchData('http://localhost:4000/posts');
  }

  doSomeClick() {
    console.log('a click happened');
  }

  render() {
    return (
      <div className="AppContainer">
        <div>
          <Clock />
        </div>
        <div>
          <button onClick={this.props.doSomeClick2}>woo</button>
        </div>
        <div>fff</div>
        <div>{JSON.stringify(this.props.todos)}</div>
        <div className="inner">
          <div />
          <div />
          <div />
          <div />
          <div />
          <div />
          <div />
          <div />
          <div />
          <div />
          <div />
        </div>
        <div>
          {/* {this.props.todos.map(item => <div key={item._id}>{item.value}</div>)} */}
        </div>
      </div>
    );
  }
}

// AppContainer.propTypes = {
//   doSomeClick2: PropTypes.func.isRequired,
//   daText: PropTypes.string,
// };

function mapStateToProps(state) {
  return {
    todos: state.todoList,
    daText: state.text,
  };
}

// const mapDispatchToProps = dispatch => ({ t1: 123 });

const mapDispatchToProps = dispatch => ({
  doSomeClick2: () => {
    // dispatch(addTodo('testing action'));
    console.log('just some action...');
  },
  fetchData: url => dispatch(fetchItems(url)),
});

// const mapDispatchToProps2 = dispatch => {
//   const tt = 123;
//   return {
//     doSomeClick2: () => {
//       dispatch(tmpAction);
//     },
//   };
// };

export default connect(mapStateToProps, mapDispatchToProps)(AppContainer);
