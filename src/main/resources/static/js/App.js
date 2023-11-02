// App.js
const initalMenus = createMenuData(MENUS);
function App() {
	const [menus, setMenus] = useState(initalMenus);

	const onChecked = ({id, checked}) => (ev) => {
	 setMenus(menus => menus.map(menu => {
	  if(menu.id === id) menu.checked = !checked;
	  return menu;
	 }))
	}
	
	return <section>
	 <div className='menu-list'>
		{menus.map((menu, i) => <MenuItem key={`menu${i}` } menu={menu} onChecked={onChecked} />)}

	 </div>
	</section>
}