package com.delivery.web.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delivery.web.mypage.Util;

@Controller
public class PayController {

	@Autowired
	private PayService payService;
	
	@Autowired
	private Util util;

	@GetMapping("/cart")
	public String cart(Model model, HttpSession session) {
		if (session.getAttribute("mid") != null && (int) session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = payService.cartlist(mid);
			model.addAttribute("list", list);
			return "/cart";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateQty")
	public String updateQty(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			int qty = util.strToInt((String) map.get("qty"));
			int mnprice = util.strToInt((String)map.get("mnprice"));
			map.put("ctotal", qty * mnprice);
			payService.updateQty(map);
			List<Map<String, Object>> list = payService.cartlist(mid);
			JSONObject json = new JSONObject();
			json.put("ctotal", qty * mnprice);
			json.put("list", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/cartdel")
	public String cartdel(@RequestParam("cno") int cno, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			payService.cartdel(cno);
			JSONObject json = new JSONObject();
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/purchase")
	public String purchase(Model model, HttpSession session) {
		if (session.getAttribute("mid") != null && (int) session.getAttribute("mgrade") >= 1) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = payService.cartlist(mid);
			if(list.size() == 0) {
				return "redirect:/";
			}
			List<Map<String, Object>> coupon = payService.coupon(mid);
			int pbalance = payService.point(mid);
			model.addAttribute("list", list);
			model.addAttribute("coupon", coupon);
			model.addAttribute("pbalance", pbalance);
			return "/purchase";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/findByCpno")
	public String findByCpno(@RequestParam("cpno") int cpno, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			int cpprice = payService.findByCpno(cpno);
			JSONObject json = new JSONObject();
			json.put("cpprice", cpprice);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/purchase")
	public String purchase(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			// System.out.println(map);
			String mid = (String) session.getAttribute("mid");
			map.put("mid", mid);
			payService.purchase(map);
			String tgroup = payService.tgroup(map);
			JSONObject json = new JSONObject();
			json.put("tgroup", tgroup);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping({"/wishlist","/wishlist/{id}"})
	public String wishlist(@PathVariable(name = "id", required = false) String id, Model model, HttpSession session) {
		if (session.getAttribute("mid") != null && (int) session.getAttribute("mgrade") >= 1) {
			if(id == null) {// 본인 계정
				id = (String) session.getAttribute("mid");
			} else {// 다른 사람 계정 or 본인 계정
				model.addAttribute("id", id);
			}
			List<Map<String, Object>> list = payService.wishlist(id);
			model.addAttribute("list", list);
			return "/wishlist";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/mnname")
	public String mnname(@RequestParam(name = "sname", required = false) String sname, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			List<Map<String, Object>> mlist = payService.mnname(sname);
			JSONObject json = new JSONObject();
			json.put("mlist", mlist);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/wdelete")
	public String wdelete(@RequestParam(value="valueArr") String[] del, HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") >= 1) {
			JSONObject json = new JSONObject();
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < del.length; i++) {
				map.put("del", del[i]);
				map.put("mid", session.getAttribute("mid"));
				int result = payService.wdelete(map);
			}
			String id = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = payService.wishlist(id);
			json.put("wlist", list);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/search")
	public String search(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		if (session.getAttribute("mid") != null && (int) session.getAttribute("mgrade") >= 1) {
			String id = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = payService.recommend(id);
			List<Map<String, Object>> rlist = payService.recommend2();
			List<Map<String, Object>> search = payService.search(map);
			model.addAttribute("list", list);
			model.addAttribute("rlist", rlist);
			model.addAttribute("search", search);
			return "/search";
		} else {
			return "redirect:/login";
		}
	}
}
