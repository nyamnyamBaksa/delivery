package com.delivery.web.review;

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
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/reviewwrite")
	public String reviewwrite(@RequestParam(value = "sno", required = false) int sno, Model model) {

		List<Map<String, Object>> reviewgroup = reviewService.reviewgroup(sno);
		
	    model.addAttribute("reviewgroup", reviewgroup);
	    
	    return "reviewwrite";
	}
	

    @PostMapping("/reviewwrite")
    public String saveReview(@RequestParam Map<String, Object> map, HttpSession session) {
    	
    	map.put("mno", (Integer) session.getAttribute("mno"));
    	
    	int rating = Integer.parseInt((String) map.get("rating"));
    	
    	map.put("rscore",rating);
    	 
    	int result = reviewService.saveReview(map);
    	
    	if(result == 1) {
    		return "redirect:/food/review?sno="+ map.get("sno");
    	} 
    	return "login";
    }

    @GetMapping("/food/review")
    public String review(@RequestParam(value="sno", required = false) int sno , Model model) {
    	
    	List<Map<String, Object>> review = reviewService.review(sno);
    	System.out.println(review);
    	model.addAttribute("reviewview", review);
    	return "review";
    }
}
