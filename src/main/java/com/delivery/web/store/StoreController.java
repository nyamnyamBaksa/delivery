package com.delivery.web.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@GetMapping("/storelist")
	public String storelist(Model model) {
		
		List<StoreDTO> list = storeService.list();
		System.out.println(list);
		
		model.addAttribute("list", list);
		return "storelist";
	}
}
