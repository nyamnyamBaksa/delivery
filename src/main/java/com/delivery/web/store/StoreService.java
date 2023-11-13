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
	
	
	//찜버튼 누르기
	@Transactional
	public boolean wishlist(Integer mno, int sno) {
	    
		boolean addwishlist = storeDAO.addwishlist(mno, sno);
	    
		return addwishlist;
	
	}

	//찜버튼 취소하기
	@Transactional
	public boolean wishremove(Integer mno, int sno) {
		
		 boolean wishremoved = storeDAO.wishremoved(mno, sno);
		
		return wishremoved;
	
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




	public boolean wishlist(String mid, int sno) {
		
		return false;
	}




}