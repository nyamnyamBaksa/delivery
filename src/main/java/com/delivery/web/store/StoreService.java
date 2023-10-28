package com.delivery.web.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreService {
	
	@Autowired
	private StoreDAO storeDAO;

	public List<StoreDTO> list() {
		return storeDAO.list();
	}


	public Map<String, Object> detail(int sno) {
		return storeDAO.detail(sno);
	}

	

}
