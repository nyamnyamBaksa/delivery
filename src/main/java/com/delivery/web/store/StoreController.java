package com.delivery.web.store;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	@GetMapping("/food/{mncate}")
	public String storelist(@PathVariable int mncate, Model model) {

		List<StoreDTO> list = storeService.list(mncate);

		model.addAttribute("list", list);
		return "storelist";
	}

	@GetMapping("/food/storedetail")
	public String storedetail(@RequestParam(value = "sno", required = false) int sno, Model model) {

		//메뉴리스트 불러오기
		StoreDTO detail = storeService.detail(sno);
		List<MenuDTO> menulist = storeService.getmenulist(sno);
		
		//메인+사이드 메뉴 랜덤 뽑기
		 List<MenuDTO> mainMenuList = new ArrayList<>();
		 List<MenuDTO> sideMenuList = new ArrayList<>();
		
		 for (MenuDTO menu : menulist) {
			if (menu.getMnside() == 0) {
				mainMenuList.add(menu);
			}else if(menu.getMnside() == 1) {
				sideMenuList.add(menu);
			}
		}
		 
		MenuDTO randomMain = RandomMenu(mainMenuList);
		MenuDTO randomSide = RandomMenu(sideMenuList);
		
		String bestmenu = randomMain.getMnname() + "+" + randomSide.getMnname();
							
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

	@GetMapping("/food/storeinfo")
	public String storeinfo(@RequestParam(value = "sno", required = false) int sno, Model model) {

		List<StoreDTO> storeinfo = storeService.storeinfo(sno);
		
		model.addAttribute("storeinfo", storeinfo);

		return "storeinfo";
	}
	
	
	@GetMapping("/food/menudetail")
	public String menudetail(@RequestParam(value = "mnno", required = false) int mnno, Model model) {
		
		 List<MenuDTO> menudetail = storeService.menudetail(mnno);
		 
		 List<MenuDTO> mainMenuList = new ArrayList<>();
		 List<MenuDTO> sideMenuList = new ArrayList<>();
		
		 for (MenuDTO menu : menudetail) {
				if (menu.getMnside() == 0) {
					mainMenuList.add(menu);
				}else if(menu.getMnside() == 1) {
					sideMenuList.add(menu);
				}
			}
		 
		 System.out.println(sideMenuList);
		 
		 model.addAttribute("menudetail", menudetail);
		 model.addAttribute("sideMenuList", sideMenuList);

		return "menudetail";
	}
	

}