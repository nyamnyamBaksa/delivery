package com.delivery.web.pay;

import java.util.List;
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
}
