package com.delivery.web.pay;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;

	public List<Map<String, Object>> cartlist(String mid) {
		return payDAO.cartlist(mid);
	}

	public void updateQty(Map<String, Object> map) {
		payDAO.updateQty(map);
	}

	public void cartdel(int cno) {
		payDAO.cartdel(cno);
	}

	public List<Map<String, Object>> coupon(String mid) {
		return payDAO.coupon(mid);
	}

	public int findByCpno(int cpno) {
		return payDAO.findByCpno(cpno);
	}

	public int point(String mid) {
		return payDAO.point(mid);
	}

	public void purchase(Map<String, Object> map) {
		payDAO.purchase(map);
	}

	public String tgroup(Map<String, Object> map) {
		return payDAO.tgroup(map);
	}

	public List<Map<String, Object>> wishlist(Map<String, Object> map) {
		return payDAO.wishlist(map);
	}

	public List<Map<String, Object>> mnname(String sname) {
		return payDAO.mnname(sname);
	}

	public int wdelete(Map<String, Object> map) {
		return payDAO.wdelete(map);
	}

	public List<Map<String, Object>> recommend(String id) {
		return payDAO.recommend(id);
	}

	public List<Map<String, Object>> recommend2() {
		return payDAO.recommend2();
	}

	public List<Map<String, Object>> search(Map<String, Object> map) {
		return payDAO.search(map);
	}

	public List<Map<String, Object>> mnwishlist(Map<String, Object> map) {
		return payDAO.mnwishlist(map);
	}

	public List<Map<String, Object>> mnsearch(Map<String, Object> map) {
		return payDAO.mnsearch(map);
	}

	public int searchcount(Map<String, Object> map) {
		return payDAO.searchcount(map);
	}

	public List<Map<String, Object>> recommend3() {
		return payDAO.recommend3();
	}

}
