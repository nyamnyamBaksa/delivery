package com.delivery.web.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface StoreDAO {

	List<StoreDTO> list(int mncate);

	StoreDTO detail(int sno);

	List<MenuDTO> getMenuList(int sno);

	List<StoreDTO> storeinfo(int sno);

	List<Map<String, Object>> category(int mncate);

	List<Map<String, Object>> foodcategory();

	List<Map<String, Object>> foodlist();

	List<MenuDTO> menudetail(int mnno);

	MenuDTO menuinfo(int mnno);

	void cartname(Map<String, Object> map);

	List<MenuDTO> getMainMenu();

	List<MenuDTO> getSideMenu();

	boolean addwishlist(@Param("mno") Integer mno, @Param("sno") int sno);

	boolean wishremoved(@Param("mno")Integer mno,@Param("sno") int sno);

	int cartlist(String mid);

	

}