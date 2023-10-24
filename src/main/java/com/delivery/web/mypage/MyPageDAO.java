package com.delivery.web.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {

	Map<String, Object> profile(String id);

	void updateProfileImg(Map<String, Object> map);

	Map<String, Object> follow(String id);

	List<Map<String, Object>> boardlist(String id);

}
