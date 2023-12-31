package com.delivery.web.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
public class StoreController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private Util util;

	@GetMapping("/food/{mncate}")
	public String storelist(@PathVariable int mncate, Model model) {

		List<StoreDTO> list = storeService.list(mncate);

		model.addAttribute("list", list);
		return "storelist";
	}

	@GetMapping("/food/storedetail")
	public String storedetail(@RequestParam(value = "sno", required = false) int sno, Model model,
			HttpSession session) {

		// 메뉴리스트 불러오기
		StoreDTO detail = storeService.detail(sno);
		List<MenuDTO> menulist = storeService.getmenulist(sno);

		if (session.getAttribute("sno") == null) {
			session.setAttribute("sno", sno);
		}

		// 메인+사이드 메뉴 랜덤 뽑기
		List<MenuDTO> mainMenuList = new ArrayList<>();
		List<MenuDTO> sideMenuList = new ArrayList<>();

		for (MenuDTO menu : menulist) {
			if (menu.getMnside() == 0) {
				mainMenuList.add(menu);
			} else if (menu.getMnside() == 1) {
				sideMenuList.add(menu);
			}
		}

		String bestmenu = null;

		// 사이드 메뉴 있을 때
		if (!sideMenuList.isEmpty()) {
			MenuDTO randomMain = RandomMenu(mainMenuList);
			MenuDTO randomSide = RandomMenu(sideMenuList);

			bestmenu = randomMain.getMnname() + " + " + randomSide.getMnname();
			// 사이드 메뉴 없을 때
		} else if(!mainMenuList.isEmpty()){
			MenuDTO randomMain = RandomMenu(mainMenuList);
			bestmenu = randomMain.getMnname();
		}
		model.addAttribute("detail", detail);
		model.addAttribute("menulist", menulist);
		model.addAttribute("bestmenu", bestmenu);

		return "storedetail";
	}

	private MenuDTO RandomMenu(List<MenuDTO> menulist) {

		if (menulist.isEmpty()) {
			return null;
		}

		Random random = new Random();
		int randomIndex = random.nextInt(menulist.size());
		return menulist.get(randomIndex);

	}

	// 찜 누르기
	@PostMapping("/food/storedetail")
	@ResponseBody
	public Map<String, Object> wishlist(@RequestParam(value = "sno", required = false) int sno, HttpSession session) {

		List<Integer> wishlist = (List<Integer>) session.getAttribute("wishlist");

		if (wishlist == null) {
			wishlist = new ArrayList<>();
		}

		Map<String, Object> response = new HashMap<>();
		Integer mno = (Integer) session.getAttribute("mno");
		String mid = (String) session.getAttribute("mid");

		if (mno == null || mid == null) {

			response.put("status", "error");
			response.put("message", "로그인 이용 후 가능합니다.");

		} else {

			boolean wishlistAdded = storeService.wishlist(mno, sno);

			if (wishlistAdded) {

				response.put("status", "success");
				response.put("message", "찜목록에 추가되었습니다.");

				wishlist.add(sno);

			} else {
				response.put("status", "error");
				response.put("message", "이미 찜한 가게입니다.");

				wishlist.add(sno);
			}
		}

		session.setAttribute("wishlist", wishlist);

		return response;
	}

	// 찜 취소하기
	@PostMapping("/food/storedetail/remove")
	@ResponseBody
	public Map<String, Object> wishremove(@RequestParam(value = "sno", required = false) int sno, HttpSession session) {

		List<Integer> wishlist = (List<Integer>) session.getAttribute("wishlist");

		Map<String, Object> response = new HashMap<>();

		Integer mno = (Integer) session.getAttribute("mno");
		String mid = (String) session.getAttribute("mid");

		if (mid == null) {

			response.put("status", "error");
			response.put("message", "로그인 이용 후 가능합니다.");

		} else {
			boolean wishlistRemoved = storeService.wishremove(mno, sno);

			if (wishlistRemoved) {
				response.put("status", "removed");
				response.put("message", "찜목록에서 제거되었습니다.");
			} else {
				response.put("status", "error");
				response.put("message", "찜 목록에서 제거할 항목이 없습니다.");
			}
		}
		session.setAttribute("wishlist", wishlist);
		return response;
	}

	// 가게 정보 리스트 불러오기
	@GetMapping("/food/storeinfo")
	public String storeinfo(@RequestParam(value = "sno", required = false) int sno, Model model) {

		List<StoreDTO> storeinfo = storeService.storeinfo(sno);

		model.addAttribute("storeinfo", storeinfo);

		return "storeinfo";
	}

	@GetMapping("/food/menudetail")
	public String menudetail(@RequestParam(value = "mnno", required = false) int mnno, Model model) {

		List<MenuDTO> menudetail = storeService.menudetail(mnno);

		if (!menudetail.isEmpty()) {
			MenuDTO firstMenu = menudetail.get(0);

			if (firstMenu.getMnside() == 0) {
				// 메인 메뉴인 경우
				model.addAttribute("menudetail", menudetail);
				model.addAttribute("isMain", true);
			} else {
				// 사이드 메뉴인 경우
				model.addAttribute("menudetail", menudetail);
				model.addAttribute("isMain", false);
			}
		}

		return "menudetail";

	}


	// 장바구니 담기
	@PostMapping("/food/menudetail")
	public String cart (@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		
		if (session.getAttribute("mid") != null) {
	        
			    map.put("sno", (Integer) session.getAttribute("sno"));
		        map.put("mid", (String) session.getAttribute("mid"));

		        System.out.println(map);

		        storeService.cartname(map);

		        return "redirect:/cart";
		    } else {
		        return "redirect:/login";
		    }
	}

	
	
	// 장바구니 담기
   @ResponseBody
   @PostMapping("/menucart2")
   public String menucart2(@RequestParam(value = "sno", required = false) Integer sno,
         @RequestParam Map<String, Object> map, Model model, HttpSession session) {
      if (session.getAttribute("mid") != null) { // 로그인한 아이디가 있을 경우
         map.put("mid", (String) session.getAttribute("mid"));
         String mid = (String) session.getAttribute("mid");
         int csno = storeService.cartlist(mid);
         System.out.println(map);
         System.out.println(csno);
         JSONObject json = new JSONObject();
             if (csno != sno && csno != 0) {
                 json.put("result", "1");
             } else if(csno == 0 || csno == sno) {
                 storeService.cartname(map);
                 json.put("result", "2");
             }
             System.out.println(json.toString());
          return json.toString();
     } else {
         return "redirect:/login";
     }
    }
}