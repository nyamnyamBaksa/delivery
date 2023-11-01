package com.delivery.web.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	public Map<String, Object> login(Map<String, Object> map);

	public int autologinCheckbox(Map<String, Object> result);

	public int hasNaverUser(Map<String, Object> nUser);

}
