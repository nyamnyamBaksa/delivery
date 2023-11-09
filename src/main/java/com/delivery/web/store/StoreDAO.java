package com.delivery.web.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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

	boolean wishlist(Integer mno);

	boolean wishlist(String mid, int sno);

	boolean wishremove(Integer mno);

	List<MenuDTO> cartlist(Map<String, Object> map);

	

}