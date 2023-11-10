package com.delivery.web.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StoreService {
	
	@Autowired
	private StoreDAO storeDAO;
	

	public List<StoreDTO> list(int mncate) {
		return storeDAO.list(mncate);
	}

	
	

	public StoreDTO detail(int sno) {
		
		StoreDTO storeDTO = storeDAO.detail(sno);
		List<MenuDTO> menulist = storeDAO.getMenuList(sno);
		
		storeDTO.setMenuList(menulist);
		
		return storeDTO;
	}


	public List<MenuDTO> getmenulist(int sno) {
		
		return storeDAO.getMenuList(sno);
	}


	public List<StoreDTO> storeinfo(int sno) {
		
		return storeDAO.storeinfo(sno);
	}


	public List<MenuDTO> menudetail(int mnno) {
		
		return storeDAO.menudetail(mnno);
	}
	
	

	@Transactional
	public boolean wishlist(String mid, Integer mno) {
		
		boolean addwishlist = storeDAO.wishlist(mno);
		
		return addwishlist;
	
	}


	@Transactional
	public boolean wishremove(String mid, Integer mno) {
		
		boolean removed = storeDAO.wishremove(mno);
		
		return removed;
	
	}



	public MenuDTO menuinfo(int mnno) {
		
		return storeDAO.menuinfo(mnno);
	}





	public List<MenuDTO> getMainMenu() {
		
		return storeDAO.getMainMenu();
	}


	public List<MenuDTO> getSideMenu() {
		
		return storeDAO.getSideMenu();
	}


	public void cartlist(Map<String, Object> map) {
		
		storeDAO.cartlist(map);
	}




}