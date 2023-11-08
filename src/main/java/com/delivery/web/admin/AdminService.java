package com.delivery.web.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delivery.web.admin.AdminDAO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	public List<Map<String, Object>> list() {
		return adminDAO.list();
	}
	
	public List<Map<String, Object>> memberList() {
		return adminDAO.memberList();
	}

	public int gradeChange(Map<String, String> map) {
		return adminDAO.gradeChange(map);
	}

	public List<Map<String, Object>> post(Map<String, Object> map) {
		return adminDAO.post(map);
	}

}