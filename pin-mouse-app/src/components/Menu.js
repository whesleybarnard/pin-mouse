import React from 'react';
import './Menu.css';

const Menu = props => {
  return (
    <div className="menu-holder">
      <ul>
        <li><a href="#">Menu Item 1</a></li>
        <li><a href="#">Menu Item 2</a></li>
        <li><a href="#">Menu Item 3</a></li>
        <li><a href="#">Menu Item 4</a></li>
      </ul>
    </div>
  );
};

export default Menu;
