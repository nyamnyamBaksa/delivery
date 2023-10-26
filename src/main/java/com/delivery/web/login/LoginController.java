package com.delivery.web.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	//기본 로그인
	@PostMapping("/login")
	public String login(@RequestParam Map<String, Object> map, HttpSession session) {
		//System.out.println(map);
		
		Map<String, Object> result = loginService.login(map);
		System.out.println(result);
		
		if(String.valueOf(result.get("count")).equals("1")) {
			session.setAttribute("mid", result.get("mid"));
			session.setAttribute("mname", result.get("mname"));
			session.setAttribute("mgrade", result.get("mgrade"));
			session.setAttribute("mno", result.get("mno"));
			return "redirect:/";
		}
		return "redirect:/login";
		
		}
	 @GetMapping("/logout")
	    public String logout(HttpSession session) {
	        // 세션 삭제
	        session.invalidate();
	        // 로그아웃 후 리다이렉트할 페이지로 이동
	        return "redirect:/login";
	    }
	
}
