package com.delivery.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HomeDAO {

	List<String> storelist(String category);
    
	
}
