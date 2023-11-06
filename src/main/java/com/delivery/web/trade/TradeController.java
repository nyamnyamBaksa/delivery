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
	public String trade(Model model, HttpSession session, Map<String, Object> map) {
		
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
	   
	    return "tradedetail";
	}

	@GetMapping("/review")
	public String review(@RequestParam(value = "sno", required = false) int sno, Model model) {

		List<Map<String, Object>> reviewgroup = tradeSerivce.reviewgroup(sno);
	    model.addAttribute("reviewgroup", reviewgroup);
	    
	    return "review";
	}
	

    @PostMapping("/review")
    public String saveReview(@RequestParam Map<String, Object> map, HttpSession session) {
    	
    	map.put("mno", (Integer) session.getAttribute("mno"));
    	
    	 int rating = Integer.parseInt((String) map.get("rating"));
    	
    	 map.put("rscore",rating);
    	 
    	int result = tradeSerivce.saveReview(map);
    	
    	if(result == 1) {
    		return "redirect:/food/review?sno="+ map.get("sno");
    	} 
    	return "login";
    }

}
