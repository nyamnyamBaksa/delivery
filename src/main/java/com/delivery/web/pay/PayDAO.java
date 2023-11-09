package com.delivery.web.pay;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayDAO {

	List<Map<String, Object>> cartlist(String mid);

	void updateQty(Map<String, Object> map);

	void cartdel(int cno);

	List<Map<String, Object>> coupon(String mid);

	int findByCpno(int cpno);

	int point(String mid);

	void purchase(Map<String, Object> map);

	String tgroup(Map<String, Object> map);

	List<Map<String, Object>> wishlist(String id);

	List<Map<String, Object>> mnname(String sname);

	int wdelete(Map<String, Object> map);

	List<Map<String, Object>> recommend(String id);

	List<Map<String, Object>> recommend2();

	List<Map<String, Object>> search(Map<String, Object> map);

}
