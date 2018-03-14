import React, {
  Component
} from 'react'
import './AppContainer.css';
import Clock from './Clock';

class AppContainer extends Component {
  // constructor(props) {
  //   super(props)
  // }

  render() {
    return (
      <div className="AppContainer">
        <div>
          <Clock />
        </div>
        <div>fff</div>
        <div>fff</div>
        <div>fff</div>
        <div className="inner">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
        <div>fff</div>
      </div>
    )
  }
}

export default AppContainer
