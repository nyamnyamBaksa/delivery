package com.delivery.web.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

	List<Map<String, Object>> list();

	List<Map<String, Object>> memberList();
	
	List<Map<String, Object>> ownerList();

	int gradeChange(Map<String, String> map);

	int gradeOwner(Map<String, String> map);
	
	List<Map<String, Object>> post(Map<String, Object> map);

	int deleteMembers(List<Integer> mnoList);

	int deleteOwners(List<Integer> onoList);

	List<Map<String, Object>> searchMembers(String keyword);

	List<Map<String, Object>> searchOwners(String keyword);

	int deleteStores(List<Integer> onoList1);



}
