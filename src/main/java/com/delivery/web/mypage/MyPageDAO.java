package com.delivery.web.mypage;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {

	Map<String, Object> profile(String id);

	void updateProfileImg(Map<String, Object> map);

}
