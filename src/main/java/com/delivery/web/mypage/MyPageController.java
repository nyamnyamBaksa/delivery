package com.delivery.web.mypage;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@GetMapping({"/", "/main"})
	public String main(Model model, HttpSession session) {
		//session.setAttribute("mid", "aaaa");// 나중에 수정
		//session.setAttribute("mgrade", 1);// 나중에 수정
		
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String id = (String) session.getAttribute("mid");
			Map<String, Object> result = myPageService.profile(id);
			model.addAttribute("result", result);
			System.out.println(result);
			return "/mypage/main";
		} else {
			return "/login";
		}
	}
	
	@PostMapping("/updateProfileImg")
	public String updateProfileImg(@RequestParam("file") MultipartFile file, @RequestParam Map<String, Object> map, HttpSession session) {
		if (session.getAttribute("mid") != null && (int) session.getAttribute("mgrade") >= 1) {
	        if (file != null && !file.isEmpty()) {
	        	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
						.getRequest();
				String path = request.getServletContext().getRealPath("/img/profileImg");
	
				//이미지 저장 
				//UUID uuid = UUID.randomUUID();
				LocalDateTime ldt = LocalDateTime.now();
				String format = ldt.format(DateTimeFormatter.ofPattern("YYYYMMddHHmmss"));
				String realFileName = format + file.getOriginalFilename();
	
				File newFileName = new File(path, realFileName);
				try {
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					FileCopyUtils.copy(file.getBytes(), newFileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
				map.put("mid", session.getAttribute("mid"));
				map.put("file", realFileName);
				myPageService.updateProfileImg(map);
	        }

	        return "redirect:/mypage/main"; // 업로드 후 마이페이지 또는 다른 적절한 경로로 리다이렉트

	    } else {
	        return "redirect:/login"; // 로그인되지 않았거나 권한이 부족한 경우 로그인 페이지로 리다이렉트
	    }
	}
	
	@GetMapping({"/cart"})
	public String cart() {
		return "/mypage/cart";
	}
}
