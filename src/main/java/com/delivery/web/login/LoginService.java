package com.delivery.web.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public Map<String, Object> login(Map<String, Object> map) {
		return loginDAO.login(map);
	}

	public int autologinCheckbox(Map<String, Object> result) {
		return loginDAO.autologinCheckbox(result);
	}
}
