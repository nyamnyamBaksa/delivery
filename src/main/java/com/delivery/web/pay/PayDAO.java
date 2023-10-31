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

}
