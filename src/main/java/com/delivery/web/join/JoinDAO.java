package com.delivery.web.join;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface JoinDAO {

	public Map<String, Object> join(Map<String, Object> map);
	

}
