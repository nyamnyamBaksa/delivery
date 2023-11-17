package com.delivery.web.home;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.delivery.web.store.MenuDTO;
import com.delivery.web.store.StoreDTO;

@Mapper
public interface HomeDAO {

	List<HomeDTO> list();

	HomeDTO detail(int sno);

	List<HomeDTO> menulist(int sno);

	List<HomeDTO> address(int mno);
    
	
}
