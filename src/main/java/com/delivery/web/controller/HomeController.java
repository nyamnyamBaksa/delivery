package com.delivery.web.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delivery.web.service.HomeService;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@GetMapping({ "/", "/home" })
	public String home() {
		return "home";
	}

	@ResponseBody // 전체적으로 수정해야됨
	@GetMapping(value = "/getStoreList", produces = "application/json; charset=utf-8")
	public String getStoreList(@RequestParam("mncatename") String mncatename) {
		List<String> storelist = homeService.storelist(mncatename);
		System.out.println(storelist);

		// List<String> 형식의 데이터를 JSON 형식으로 변환
		JSONObject jsonObject = new JSONObject();
		JSONArray listArr = new JSONArray(storelist);
		jsonObject.put("storelist", listArr);

		// JSON 형식의 데이터를 문자열로 반환
		return jsonObject.toString();
	}

}
