// components/MenuItem.js
const MenuItem = ({menu, onChecked}) => {
	return <span
		className={`menu-list__item ${menu.checked ? 'menu-list__item--active' : ''}`}
		onClick={onChecked(menu)}
	>{menu.name}</span>
}