import React from 'react';
import { Link } from 'react-router-dom';
import block from 'bem-cn-lite';
import './Menu.css';

block.setup({
  ns: 'c-',
  el: '__',
  mod: '--',
  modValue: '-',
});

const b = block('menu');
const bi = b('item', { hover: true });

const Menu = () => (
  <nav className={b()}>
    <Link className={bi} to="/">
      Home
    </Link>
    <Link className={bi} to="/pins">
      Pins
    </Link>
    <Link className={bi} to="/logout">
      Logout
    </Link>
  </nav>
);

export default Menu;
