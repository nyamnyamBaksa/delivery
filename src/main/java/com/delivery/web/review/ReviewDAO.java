package com.delivery.web.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {

	List<Map<String, Object>> reviewgroup(int sno);

	int saveReview(Map<String, Object> map);

	List<Map<String, Object>> revivew(int sno);

	Map<String, Object> countrscore(int sno);

	void img(String reviewImg);
}
