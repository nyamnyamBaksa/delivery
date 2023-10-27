package com.delivery.web.join;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {
	
	@Autowired
	private JoinDAO joinDAO;

	public Map<String, Object> join(Map<String, Object> map) {
		return joinDAO.join(map);
	}
}
