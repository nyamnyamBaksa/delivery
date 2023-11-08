package com.delivery.web.home;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HomeDAO {

	List<HomeDTO> list(Integer sno);
    
	
}
