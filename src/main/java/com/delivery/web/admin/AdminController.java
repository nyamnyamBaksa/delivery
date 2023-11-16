package com.delivery.web.admin;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
	@RequestMapping(value = "/list-member", method = RequestMethod.GET)
	public ModelAndView member() {
		ModelAndView mv = new ModelAndView("admin/list-member");
		mv.addObject("memberList", adminService.memberList());
		return mv;
	}

	// owner
	@RequestMapping(value = "/list-owner", method = RequestMethod.GET)
	public ModelAndView owner() {
		ModelAndView mv = new ModelAndView("admin/list-owner");
		mv.addObject("ownerList", adminService.ownerList());
		return mv;
	}

	// gradeMember(gradeChange)
	@RequestMapping(value = "/gradeChange", method = RequestMethod.GET)
	public String gradeChange(@RequestParam Map<String, String> map) {
		int result = adminService.gradeChange(map);
		System.out.println(result);
		return "redirect:/admin/list-member";
	}
	
	// gradeOwner
		@RequestMapping(value = "/gradeOwner", method = RequestMethod.GET)
		public String gradeOwner(@RequestParam Map<String, String> map) {
			int result = adminService.gradeOwner(map);
			System.out.println(result);
			return "redirect:/admin/list-owner";
		}
		
		//deleteMembers
	@RequestMapping(value = "/deleteMembers", method = RequestMethod.GET)
	public String deleteMembers(@RequestParam("mnoList") String mnoList) {
		String[] mnoArray = mnoList.split(",");
		List<Integer> mnoList1 = Arrays.stream(mnoArray).map(Integer::parseInt).collect(Collectors.toList());

		int result = adminService.deleteMembers(mnoList1);
		System.out.println(result);
		return "redirect:/admin/list-member";
	}
		//deleteOwners
	@RequestMapping(value = "/deleteOwners", method = RequestMethod.GET)
	public String deleteOwners(@RequestParam("onoList") String onoList) {
		String[] onoArray = onoList.split(",");
		List<Integer> onoList1 = Arrays.stream(onoArray).map(Integer::parseInt).collect(Collectors.toList());

		int result = adminService.deleteOwners(onoList1);
		int result2 = adminService.deleteStores(onoList1);
		System.out.println(result);
		return "redirect:/admin/list-owner";
	}
	
	//search-member
	@GetMapping("/search-member")
	public ModelAndView searchMember(@RequestParam("keyword") String keyword) {
	    ModelAndView mv = new ModelAndView("admin/list-member");
	    mv.addObject("memberList", adminService.searchMembers(keyword));
	    return mv;
	}
	
	//search-owner
	@GetMapping("/search-owner")
	public ModelAndView searchOwner(@RequestParam("keyword") String keyword) {
	    ModelAndView mv = new ModelAndView("admin/list-owner");
	    mv.addObject("ownerList", adminService.searchOwners(keyword));
	    return mv;
	}
	
	

}