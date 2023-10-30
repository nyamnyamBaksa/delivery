package com.delivery.web.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreService {
	
	@Autowired
	private StoreDAO categorylistDAO;

	public List<StoreDTO> list() {
		
		return categorylistDAO.list();
	}

	

}
