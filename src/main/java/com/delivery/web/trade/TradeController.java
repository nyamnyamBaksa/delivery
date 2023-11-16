package com.delivery.web.trade;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TradeController {

	@Autowired
	private TradeService tradeSerivce;
	
	@GetMapping("/trade")
	public String trade(
		Model model, HttpSession session,@RequestParam Map<String, Object> map) {
		
		map.put("id", (String) session.getAttribute("mid"));
		
		List<Map<String, Object>> trade = tradeSerivce.trade(map);
		model.addAttribute("trade", trade);

		List<Map<String, Object>> tradegroup = tradeSerivce.tradegroup(map);
		//System.out.println(tradegroup);
		model.addAttribute("tradegroup", tradegroup);
	       
	    
	    return "trade";	
	}

	@GetMapping("/tradedetail")
	public String tradedetail(@RequestParam(value="tgroup", required = false) String tgroup, Model model) {
	  
		List<Map<String, Object>> tradedetail = tradeSerivce.tradedetail(tgroup);
	    model.addAttribute("tradedetail", tradedetail);
	    
	    Map<String, Object> tradecp = tradeSerivce.tradecp(tgroup);
	    model.addAttribute("tradecp", tradecp);
	   
	    return "tradedetail";
	}
	
	

}
