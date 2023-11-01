package com.delivery.web.store;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	@GetMapping("/food/{mncate}")
	public String storelist(@PathVariable int mncate, Model model) {

		List<StoreDTO> list = storeService.list(mncate);

		model.addAttribute("list", list);
		return "storelist";
	}

	@GetMapping("/food/storedetail")
	public String storedetail(@RequestParam(value = "sno", required = false) int sno, Model model) {

		StoreDTO detail = storeService.detail(sno);
		List<MenuDTO> menulist = storeService.getmenulist(sno);

		model.addAttribute("detail", detail);
		model.addAttribute("menulist", menulist);

		System.out.println(menulist);
		return "storedetail";
	}

	@GetMapping("/food/storeinfo")
	public String storeinfo(@RequestParam(value = "sno", required = false) int sno, Model model) {

		List<StoreDTO> storeinfo = storeService.storeinfo(sno);
		
		model.addAttribute("storeinfo", storeinfo);

		return "storeinfo";
	}
	
	
	@GetMapping("/food/menudetail")
	public String menudatail(@RequestParam(value = "mnno", required = false) int mnno, Model model) {
		
		 List<MenuDTO> menudetail = storeService.menudetail(mnno);

		model.addAttribute("menudetail", menudetail);

		//System.out.println(menudetail);
		
		return "menudetail";
	}
	

}
