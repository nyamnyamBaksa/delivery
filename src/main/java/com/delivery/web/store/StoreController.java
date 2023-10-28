package com.delivery.web.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	
	@GetMapping("/storelist")
	public String storelist(Model model) {
		
		List<StoreDTO> list = storeService.list();
		
		model.addAttribute("list", list);
		return "storelist";
	}
	
	@GetMapping("/storedetail")
	public String storedetail(@RequestParam(value = "sno", required=false) int sno, Model model) {
		Map<String, Object> detail = storeService.detail(sno);
		model.addAttribute("detail", detail);
		return "storedetail";
	}
	
	
}
