package com.delivery.web.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


	


}
