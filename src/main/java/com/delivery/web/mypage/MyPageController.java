package com.delivery.web.mypage;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	// 나중에 수정
	@GetMapping("/sample")
	public String sample(HttpSession session){
		session.setAttribute("mid", "bbbb");// 나중에 수정
		session.setAttribute("mgrade", 1);// 나중에 수정
		return "/mypage/sample";
	}
	
	@GetMapping("/{id}")
	public String main(@PathVariable("id") String id, Model model, HttpSession session) {
		session.setAttribute("mid", "aaaa");// 나중에 수정
		session.setAttribute("mgrade", 1);// 나중에 수정
		
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			// System.out.println(id);
			Map<String, Object> result = myPageService.profile(id);
			Map<String, Object> follow = myPageService.follow(id);
			model.addAttribute("result", result);
			model.addAttribute("follow", follow);
			model.addAttribute("id", id);
			return "/mypage/main";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/updateProfileImg")// 본인만 프로필 사진 바꿀 수 있음
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

	        return "redirect:/mypage/main";

	    } else {
	        return "redirect:/login";
	    }
	}
	
	@GetMapping("/diary/{id}")
	public String diary(@PathVariable("id") String id, Model model, HttpSession session) {
		session.setAttribute("mid", "aaaa");// 나중에 수정
		session.setAttribute("mgrade", 1);// 나중에 수정
		
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			List<Map<String, Object>> list = myPageService.boardlist(id);
			model.addAttribute("list", list);
			return "/mypage/diary";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/bdelete")
	public String bdelete(Model model, HttpSession session,
			@RequestParam(value = "bno", required = true, defaultValue = "0") int bno) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			myPageService.bdelete(bno);
			return "/mypage/diary";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateLike")
	public String updateLike(Model model, HttpSession session, @RequestParam Map<String, Object> map) {
		// System.out.println(map);// {bno=2, i=0}
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String id = (String) session.getAttribute("mid");
			map.put("id", id);
			myPageService.updateLike(map);
			int blike = myPageService.mylike(map);
			JSONObject json = new JSONObject();
			json.put("blike", blike);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/comment")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno, HttpSession session) 
			throws JsonProcessingException {
		// System.out.println(bno);
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			List<Map<String, Object>> comment = myPageService.comment(bno);
			JSONObject json = new JSONObject();
			json.put("comment", comment);
			System.out.println(comment);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping({"/cart"})
	public String cart() {
		return "/mypage/cart";
	}
}
