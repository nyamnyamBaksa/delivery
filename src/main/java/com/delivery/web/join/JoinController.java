package com.delivery.web.join;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	
	@PostMapping("/join")
	public String join(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		
		Map<String, Object> result = joinService.join(map);
		
		
		return "redirect:/login";
	}
	
	//아이디 중복검사
	@ResponseBody
	@PostMapping("/checkID")
	public String checkID(@RequestParam("mid") String mid) {
		
		int result = joinService.checkID(mid);
			return result + "";
	}
}
