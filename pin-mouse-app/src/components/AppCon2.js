import React, { Component } from 'react';
import { connect } from 'react-redux';

class AppCon2 extends Component {
  // constructor(props) {
  //   super(props);
  // }

  clickForAButton() {
    console.log('wtf...');
  }

  render() {
    return (
      <div>
        <div>yyyyyyyy</div>
        <div>{JSON.stringify(this.props)}</div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    todos: state.todoList,
  };
}

// export default Menu;
export default connect(mapStateToProps)(AppCon2);
