package com.delivery.web.trade;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TradeDAO {

	List<Map<String, Object>> trade(Map<String, Object> map);

	List<Map<String, Object>> tradegroup(Map<String, Object> map);

	List<Map<String, Object>> tradedetail(String tgroup);

	Map<String, Object> tradecp(String tgroup);

	List<Map<String, Object>> reviewWhether(Map<String, Object> map);

}
