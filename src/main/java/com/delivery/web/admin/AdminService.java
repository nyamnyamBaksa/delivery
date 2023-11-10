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
	
	public List<Map<String, Object>> ownerList() {
		return adminDAO.ownerList();
	}

	public int gradeChange(Map<String, String> map) {
		return adminDAO.gradeChange(map);
	}

	public int gradeOwner(Map<String, String> map) {
		return adminDAO.gradeOwner(map);
	}
	
	public List<Map<String, Object>> post(Map<String, Object> map) {
		return adminDAO.post(map);
	}

	public int deleteMembers(List<Integer> mnoList) {
		return adminDAO.deleteMembers(mnoList);
	}

	public int deleteOwners(List<Integer> onoList) {
		return adminDAO.deleteOwners(onoList);
	}

	
	
	


}