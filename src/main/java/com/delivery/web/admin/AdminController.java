package com.delivery.web.admin;


import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/admin")
public class AdminController {
	// AdminService / AdminDAO / adminMapper

	@Autowired
	private AdminService adminService;


	@GetMapping("/")
	public String adminIndex2() {
		return "forward:/admin/admin";
	}

	@GetMapping("/admin")
	public String adminIndex() {
		return "admin/index";
	}

	

	@GetMapping("/main")
	public String main() {
		return "admin/main";
	}

	

	// member
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public ModelAndView member() {
		ModelAndView mv = new ModelAndView("admin/member");
		mv.addObject("memberList", adminService.memberList());
		return mv;
	}

	// gradeChange
	@RequestMapping(value = "/gradeChange", method = RequestMethod.GET)
	public String gradeChange(@RequestParam Map<String, String> map) {
		int result = adminService.gradeChange(map);
		System.out.println(result);
		return "redirect:/admin/member";
	}

}