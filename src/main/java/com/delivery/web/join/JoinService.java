package com.delivery.web.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delivery.web.login.LoginDAO;

@Service
public class JoinService {
	
	@Autowired
	private JoinDAO joinDAO;
}
