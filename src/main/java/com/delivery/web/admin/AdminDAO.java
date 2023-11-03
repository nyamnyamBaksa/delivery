package com.delivery.web.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

	List<Map<String, Object>> list();

	List<Map<String, Object>> memberList();

	int gradeChange(Map<String, String> map);

	List<Map<String, Object>> post(Map<String, Object> map);



}
