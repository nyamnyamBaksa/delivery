package com.delivery.web.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delivery.web.store.MenuDTO;
import com.delivery.web.store.StoreDTO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;


	public List<HomeDTO> list() {
		
		return homeDAO.list();
	}

	public List<HomeDTO> address() {
		
		return homeDAO.address();
	} 

	

	
	
	

}
