package com.delivery.web.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.delivery.web.store.MenuDTO;
import com.delivery.web.store.StoreDTO;


@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@GetMapping({ "/", "/home" })
	public String home(Model model, HttpSession session) {
		
		List<HomeDTO> list = homeService.list();
		model.addAttribute("list", list);
		
		
		if(session.getAttribute("mid") != null) {
			int mno = (int) session.getAttribute("mno");
			List<HomeDTO> address = homeService.address(mno);
			model.addAttribute("address", address);
		}
		
		return "home";
	}


	

}
