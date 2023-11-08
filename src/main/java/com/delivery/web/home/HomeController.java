package com.delivery.web.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.delivery.web.store.StoreDTO;


@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@GetMapping({ "/", "/home" })
	public String home(@RequestParam(value = "sno", required = false) Integer sno, Model model) {
		
		List<HomeDTO> list = homeService.list(sno);

		model.addAttribute("list", list);
		return "home";
	}

	

}
