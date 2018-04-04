import React, { Component } from 'react';
import { connect } from 'react-redux';
// import PropTypes from 'prop-types';
import { fetchItems, fetchRepos } from '../actions/actionCreators';
import './AppContainer.css';
import Clock from './Clock';

class AppContainer extends Component {
  constructor(props) {
    super(props);
    // this.state = { date: new Date() };
    // this.doSomeClick = this.doSomeClick.bind(this);
  }

  componentWillMount() {
    // console.log('componentWillMount');
    // console.log(this);
  }

  componentWillUnmount() {
    console.log('AppContainer will now unmount.');
  }

  componentDidMount() {
    console.log(this.props);
    this.props.fetchRepos();
  }

  render() {
    const { repos } = this.props;
    return (
      <div className="AppContainer">
        <div>
          <Clock />
        </div>
        <div>
          <button>woo</button>
        </div>
        <div>fff</div>
        <div>
          {repos.length > 0 &&
            repos.map(item => (
              <div key={item.id}>
                <div>{item.name}</div>
                <div>{item.full_name}</div>
                <div>{item.description}</div>
                <hr />
              </div>
            ))}
          {repos.length === 0 && <div>There are no repos loaded...</div>}
        </div>
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
    repos: state.repos,
  };
}

const mapDispatchToProps = dispatch => ({
  fetchData: url => dispatch(fetchItems(url)),
  fetchRepos: () => {
    dispatch(fetchRepos());
  },
});

export default connect(mapStateToProps, mapDispatchToProps)(AppContainer);
