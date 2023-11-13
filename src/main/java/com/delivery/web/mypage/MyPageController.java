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
	
	@Autowired
	private SmsUtil smsUtil;
	
	@GetMapping({"/main","/main/{id}"})
	public String main(@PathVariable(name = "id", required = false) String id, Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			if(id == null) {// 본인 계정
				id = (String) session.getAttribute("mid");
			} else {// 다른 사람 계정 or 본인 계정
				String myid = (String) session.getAttribute("mid");
				model.addAttribute("id", id);
				if(!myid.equals(id)) {
					int babfriend = myPageService.babfriend(myid, id);
					model.addAttribute("babfriend", babfriend);
				}
			}
			int findById = myPageService.findById(id);
			if(findById == 0) {
				return "redirect:/";
			}
			Map<String, Object> result = myPageService.profile(id);
            Map<String, Object> follow = myPageService.follow(id);
            List<Map<String, Object>> toplist = myPageService.toplist(id);
            List<Map<String, Object>> favoritecate = myPageService.favoritecate(id);
            model.addAttribute("result", result);
            model.addAttribute("follow", follow);
            model.addAttribute("toplist", toplist);
            model.addAttribute("favoritecate", favoritecate);
            return "/mypage/main";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateProfileImg")// 웹 전용
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
	
	@ResponseBody
	@PostMapping("/updateProfileImg2")// 모바일 전용
	public String updateProfileImg2(@RequestParam("file") MultipartFile file, @RequestParam Map<String, Object> map, HttpSession session) {
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
	public String diary(@PathVariable(name = "id", required = false) String id, Model model, HttpSession session,
			@RequestParam Map<String, Object> map) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			map.put("mid", mid);
			if(id == null) {// 본인 계정
				id = (String) session.getAttribute("mid");
			} else {// 다른 사람 계정 or 본인 계정
				String myid = (String) session.getAttribute("mid");
				model.addAttribute("id", id);
				if(!myid.equals(id)) {// 서로 친구 아니면 못 보게함
					int babfriend = myPageService.babfriend(myid, id);
					model.addAttribute("babfriend", babfriend);
					if(babfriend != 3) {
						return "redirect:/mypage/main/{id}";
					}
				}
			}
			map.put("id", id);
			map.put("offset", 0);
			int findById = myPageService.findById(id);
			if(findById == 0) {
				return "redirect:/";
			}
			List<Map<String, Object>> list = myPageService.boardlist(map);
			model.addAttribute("list", list);
			return "/mypage/diary";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/moreDiary")
	public String moreDiary(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			System.out.println(map);
			map.put("offset", util.strToInt((String)map.get("offset")));
			List<Map<String, Object>> list = myPageService.boardlist(map);
			JSONObject json = new JSONObject();
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/bdelete")
	public String bdelete(Model model, HttpSession session, @RequestParam Map<String, Object> map,
			@RequestParam(value = "bno", required = true, defaultValue = "0") int bno) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			myPageService.bdelete(bno);
			String mid = (String) session.getAttribute("mid");
			String id = (String) session.getAttribute("mid");
			map.put("mid", mid);
			map.put("id", id);
			map.put("offset", util.strToInt((String)map.get("offset")));
			List<Map<String, Object>> list = myPageService.boardlist(map);
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
			map.put("id", (String)session.getAttribute("mid"));
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
	public String comment(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno, HttpSession session) 
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
			Map<String, Object> follow = myPageService.follow(id);
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
	
	@ResponseBody
	@PostMapping("/friendcount")
	public String friendcount(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			List<Map<String, Object>> list = myPageService.friendcount(map);
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
	public String pay(Model model, HttpSession session,@RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("mid", (String) session.getAttribute("mid"));
			map.put("offset", 0);
			List<Map<String, Object>> list = myPageService.pay(map);
			int paycount = myPageService.paycount(map);
			model.addAttribute("list", list);
			model.addAttribute("paycount", paycount);
			return "/mypage/pay";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/morePay")
	public String morePay(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("mid", (String) session.getAttribute("mid"));
			map.put("offset", util.strToInt((String)map.get("offset")));
			List<Map<String, Object>> list = myPageService.pay(map);
			int paycount = myPageService.paycount(map);
			JSONObject json = new JSONObject();
			json.put("list", list);
			json.put("paycount", paycount);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/cateChange")
	public String cateChange(HttpSession session, @RequestParam(name="cate", required = false, defaultValue = "0") int cate,
			@RequestParam Map<String, Object> map) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			if(map.get("offset") == null) {
				map.put("offset", 0);
			}
			map.put("mid", (String) session.getAttribute("mid"));
			List<Map<String, Object>> list = myPageService.pay(map);
			JSONObject json = new JSONObject();
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/charge")
	public String charge(@RequestParam Map<String, Object> map, HttpSession session,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			// System.out.println(map);// {pcharge=10000, pbalance=14500}
			if(map.get("offset") == null) {
				map.put("offset", 0);
			} else {
				map.put("offset", util.strToInt((String)map.get("offset")));
			}
			
			if(map.get("pbalance") == null || map.get("pbalance").equals("")) {
				map.put("pbalance", util.strToInt((String)map.get("pcharge")));
			} else {
				map.put("pbalance", util.strToInt((String)map.get("pbalance"))  + util.strToInt((String)map.get("pcharge")));
			}
			String mid = (String) session.getAttribute("mid");
			map.put("mid", mid);
			myPageService.charge(map);
			List<Map<String, Object>> list = myPageService.pay(map);
			int paycount = myPageService.paycount(map);
			JSONObject json = new JSONObject();
			json.put("list", list);
			json.put("paycount", paycount);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping({"/review", "/review/{id}"})
	public String review(@RequestParam Map<String, Object> map, @PathVariable(name = "id", required = false) String id,Model model, HttpSession session) {
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
			map.put("id", id);
			map.put("offset", 0);
			List<Map<String, Object>> list = myPageService.reviewlist(map);
			List<Map<String, Object>> mnlist = myPageService.mnreviewlist(map);
			model.addAttribute("list", list);
			model.addAttribute("mnlist", mnlist);
			return "/mypage/review";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/moreReview")
	public String moreReview(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			System.out.println(map);// {id=aaaa, offset=7, endIndex=13}
			map.put("offset", util.strToInt((String)map.get("offset")));
			List<Map<String, Object>> list = myPageService.reviewlist(map);
			List<Map<String, Object>> mnlist = myPageService.mnreviewlist(map);
			JSONObject json = new JSONObject();
			json.put("list", list);
			json.put("list", mnlist);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	/*@ResponseBody
	@PostMapping("/reviewStar")
	public String reviewStar(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String id = (String) map.get("id");
			List<Map<String, Object>> list = myPageService.reviewlist(id);
			JSONObject json = new JSONObject();
			json.put("score", util.strToInt((String) map.get("score")));
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}*/
	
	@ResponseBody
	@PostMapping("/rdelete")
	public String rdelete(@RequestParam(value="valueArr") String[] del, HttpSession session,
			@RequestParam(name="offset", required = false) int offset) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			JSONObject json = new JSONObject();
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < del.length; i++) {
				map.put("del", del[i]);
				map.put("mid", session.getAttribute("mid"));
				int result = myPageService.rdelete(map);
			}
			String id = (String) session.getAttribute("mid");
			map.put("id", id);
			map.put("offset", offset);
			List<Map<String, Object>> list = myPageService.reviewlist(map);
			List<Map<String, Object>> mnlist = myPageService.mnreviewlist(map);
			json.put("list", list);
			json.put("mnlist", mnlist);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateReview")
	public String updateReview(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			JSONObject json = new JSONObject();
			Map<String, Object> review = myPageService.findReviewByRno(map);
			json.put("review", review);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/editReview")
	public String editReview(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			JSONObject json = new JSONObject();
			myPageService.updateReview(map);
			String id = (String) session.getAttribute("mid");
			map.put("id", id);
			map.put("offset", util.strToInt((String)map.get("offset")));
			List<Map<String, Object>> list = myPageService.reviewlist(map);
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/dwrite")
	public String dwrite(HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			return "/mypage/dwrite";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/dwrite")
	public String dwrite(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("id", (String)session.getAttribute("mid"));
			myPageService.dwrite(map);
			return "redirect:/mypage/diary";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping({"/dedit/{bno}", "/dedit"})
	public String dedit(@PathVariable(value = "bno", required = false) Integer bno, Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			if(bno == null) {
				return "redirect:/";
			}
			Map<String, Object> result = myPageService.diaryDetail(bno);
			model.addAttribute("result", result);
			model.addAttribute("bno", bno);
			return "/mypage/dedit";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/dedit")
	public String dedit(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("id", (String)session.getAttribute("mid"));
			myPageService.dupdate(map);
			return "redirect:/mypage/diary";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/cwrite")
	public String cwrite(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("id", (String)session.getAttribute("mid"));
			myPageService.cwrite(map);
			int bno = util.strToInt((String)map.get("bno"));
			List<Map<String, Object>> comment = myPageService.comment(bno);
			JSONObject json = new JSONObject();
			json.put("comment", comment);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/info")
	public String info(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			Map<String, Object> info = myPageService.info(mid);
			model.addAttribute("info", info);
			return "/mypage/info";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/out")
	public String out(HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			myPageService.out(mid);
			session.invalidate();
			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			session.invalidate();
			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/idchk")
	public String idchk(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			int idchk = myPageService.idchk(map);
			JSONObject json = new JSONObject();
			json.put("idchk", idchk);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/idUpdate")
	public String idUpdate(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("mno", session.getAttribute("mno"));
			myPageService.idUpdate(map);
			session.setAttribute("mid", map.get("id"));
			JSONObject json = new JSONObject();
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/pwUpdate")
	public String pwUpdate(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("mno", session.getAttribute("mno"));
			myPageService.pwUpdate(map);
			JSONObject json = new JSONObject();
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/addrUpdate")
	public String addrUpdate(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("mno", session.getAttribute("mno"));
			myPageService.addrUpdate(map);
			JSONObject json = new JSONObject();
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/phoneCheck")// 휴대폰 문자보내기
	public String sendSMS(@RequestParam(name="phone", required = false) String phone, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			System.out.println(phone);
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
	
			smsUtil.sendOne(phone, randomNumber);
			return String.valueOf(randomNumber);
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/phoneUpdate")
	public String phoneUpdate(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			map.put("mno", session.getAttribute("mno"));
			myPageService.phoneUpdate(map);
			JSONObject json = new JSONObject();
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
}
