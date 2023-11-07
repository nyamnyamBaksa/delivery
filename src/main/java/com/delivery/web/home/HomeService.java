package com.delivery.web.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;


	public List<HomeDTO> list(Integer sno) {
		// TODO Auto-generated method stub
		return homeDAO.list(sno);
	}

	

	
	
	

}
