package com.delivery.web.mypage;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
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
	
	@Autowired
	private Util util;
	
	// 나중에 수정
	@GetMapping("/sample")
	public String sample(HttpSession session){
		session.setAttribute("mid", "bbbb");// 나중에 수정
		session.setAttribute("mgrade", 1);// 나중에 수정
		return "/mypage/sample";
	}
	
	@GetMapping({"/main","/main/{id}"})
	public String main(@PathVariable(name = "id", required = false) String id, Model model, HttpSession session) {
		session.setAttribute("mid", "aaaa");// 나중에 수정
		session.setAttribute("mgrade", 1);// 나중에 수정
		
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			if(id == null) {// 본인 계정
				id = (String) session.getAttribute("mid");
			} else {// 다른 사람 계정 or 본인 계정
				String myid = (String) session.getAttribute("mid");
				model.addAttribute("id", id);
				int babfriend = myPageService.babfriend(myid, id);
				model.addAttribute("babfriend", babfriend);
			}
			int findById = myPageService.findById(id);
			if(findById == 0) {
				return "redirect:/";
			}
			Map<String, Object> result = myPageService.profile(id);
            Map<String, Object> follow = myPageService.follow(id);
            model.addAttribute("result", result);
            model.addAttribute("follow", follow);
            return "/mypage/main";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
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
				String profileImg = myPageService.profileImg(map);
				JSONObject json = new JSONObject();
				json.put("profileImg", profileImg);
				return json.toString();
	        } else {
	        	return "redirect:/mypage/main";
	        }
	    } else {
	        return "redirect:/login";
	    }
	}
	
	@GetMapping({"/diary", "/diary/{id}"})
	public String diary(@PathVariable(name = "id", required = false) String id, Model model, HttpSession session) {
		session.setAttribute("mid", "aaaa");// 나중에 수정
		session.setAttribute("mgrade", 1);// 나중에 수정
		
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			if(id == null) {// 본인 계정
				id = (String) session.getAttribute("mid");
			} else {// 다른 사람 계정 or 본인 계정
				model.addAttribute("id", id);
			}
			int findById = myPageService.findById(id);
			if(findById == 0) {
				return "redirect:/";
			}
			List<Map<String, Object>> list = myPageService.boardlist(id);
			model.addAttribute("list", list);
			return "/mypage/diary";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/bdelete")
	public String bdelete(Model model, HttpSession session,
			@RequestParam(value = "bno", required = true, defaultValue = "0") int bno) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			myPageService.bdelete(bno);
			String id = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.boardlist(id);
			JSONObject json = new JSONObject();
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateLike")
	public String updateLike(Model model, HttpSession session, @RequestParam Map<String, Object> map) {
		// System.out.println(map);// {bno=2, i=0, id=aaaa}
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
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
			// System.out.println(comment);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateFollow")
	public String updateFollow(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			// System.out.println(map);// {myid=aaaa, id=String, i=4, modal=bbbb}
			String myid = (String) map.get("myid");
			String id = (String) map.get("id");
			int iIs3 = myPageService.iIs3(map);
			map.put("iIs3", iIs3);
			// System.out.println("iIs3 : " + iIs3);
			if("4".equals(map.get("i"))) {
				map.put("id", (String)map.get("modal"));
			}
			int result = myPageService.updateFollow(map);
			int babfriend = myPageService.babfriend(myid, id);
			Map<String, Object> follow = myPageService.follow(myid);
			JSONObject json = new JSONObject();
			json.put("result", result);
			json.put("i", map.get("i"));
			json.put("babfriend", babfriend);
			json.put("follow", follow);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/followAsk")
	public String followAsk(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			List<Map<String, Object>> list = myPageService.followAsk(map);
			// System.out.println(list);
			JSONObject json = new JSONObject();
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/coupon")
	public String coupon(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.coupon(mid);
			model.addAttribute("list", list);
			return "/mypage/coupon";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/pay")
	public String pay(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.pay(mid);
			model.addAttribute("list", list);
			return "/mypage/pay";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/charge")
	public String charge(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			// System.out.println(map);// {pcharge=10000, pbalance=14500}
			map.put("pbalance", util.strToInt((String)map.get("pbalance"))  + util.strToInt((String)map.get("pcharge")));
			String mid = (String) session.getAttribute("mid");
			map.put("mid", mid);
			myPageService.charge(map);
			List<Map<String, Object>> list = myPageService.pay(mid);
			JSONObject json = new JSONObject();
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping({"/review", "/review/{id}"})
	public String review(@PathVariable(name = "id", required = false) String id,Model model, HttpSession session) {
		session.setAttribute("mid", "aaaa");// 나중에 수정
		session.setAttribute("mgrade", 1);// 나중에 수정
		
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			if(id == null) {// 본인 계정
				id = (String) session.getAttribute("mid");
			} else {// 다른 사람 계정 or 본인 계정
				model.addAttribute("id", id);
			}
			int findById = myPageService.findById(id);
			if(findById == 0) {
				return "redirect:/";
			}
			List<Map<String, Object>> list = myPageService.reviewlist(id);
			model.addAttribute("list", list);
			return "/mypage/review";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/rdelete")
	public String rdelete(@RequestParam(value="valueArr") String[] del, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			JSONObject json = new JSONObject();
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < del.length; i++) {
				map.put("del", del[i]);
				map.put("mid", session.getAttribute("mid"));
				int result = myPageService.rdelete(map);
				json.put("result", result);
			}
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
