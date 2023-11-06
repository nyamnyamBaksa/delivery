package com.delivery.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delivery.web.dao.HomeDAO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;

	public List<String> storelist(String category) {
		
		return homeDAO.storelist(category);
	}

	

	
	
	

}
