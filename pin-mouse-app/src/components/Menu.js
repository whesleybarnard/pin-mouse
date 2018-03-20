import React from 'react';
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
    <button className={bi}>Menu Item 1</button>
    <button className={bi}>Menu Item 2</button>
    <button className={bi}>Menu Item 3</button>
    <button className={bi}>Menu Item 4</button>
  </nav>
);

export default Menu;
