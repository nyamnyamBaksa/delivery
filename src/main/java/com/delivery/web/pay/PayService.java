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

}
