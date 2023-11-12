package com.delivery.web.trade;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TradeService {

	@Autowired
	private TradeDAO tradeDAO;

	public List<Map<String, Object>> trade(Map<String, Object> map) {
		return tradeDAO.trade(map);
	}

	public List<Map<String, Object>> tradegroup(Map<String, Object> map) {
		return tradeDAO.tradegroup(map);
	}

	public List<Map<String, Object>> tradedetail(String tgroup) {
		return tradeDAO.tradedetail(tgroup);
	}


	public Map<String, Object> tradecp(String tgroup) {
		return tradeDAO.tradecp(tgroup);
	}

	public List<Map<String, Object>> reviewWhether(Map<String, Object> map) {
		return tradeDAO.reviewWhether(map);
	}






}
