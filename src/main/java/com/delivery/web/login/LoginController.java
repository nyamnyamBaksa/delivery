package com.delivery.web.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	// 기본 로그인
	@PostMapping("/login")
	public String login(@RequestParam Map<String, Object> map, HttpSession session) {
		// System.out.println(map);

		Map<String, Object> result = loginService.login(map);


		if (String.valueOf(result.get("count")).equals("1")) {
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

	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/autologinCheckbox") public String
	 * autologinCheckbox(@RequestParam Map<String, Object> map, HttpSession session)
	 * {
	 * 
	 * JSONObject json = new JSONObject();
	 * 
	 * Map<String , Object> result = loginService.login(map);
	 * 
	 * int auto = loginService.autologinCheckbox(result);
	 * 
	 * json.put("auto", auto); return json.toString(); }
	 */
	
	// 네이버 로그인
	@GetMapping("/login/naver")
	public String naverLogin(@RequestParam(required = false) String code, HttpSession session, Model model) {
		
		//System.out.println(code);
		
		String Naccess_Token = loginService.getNaverToken(code);
		Map<String, Object> nUser = loginService.getNaverUser(Naccess_Token); // 서비스에서 리턴한 Nmap값을 nUser로 받음.
		
		System.out.println(nUser);
		
		//네이버 로그인 db 저장 여부
		int result = loginService.hasNaverUser(nUser); //0 or 1
		System.out.println(result);
		
		return "redirect:/";
	}
			
	
}
