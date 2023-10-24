package com.delivery.web.mypage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;

	public Map<String, Object> profile(String id) {
		return myPageDAO.profile(id);
	}

	public void updateProfileImg(Map<String, Object> map) {
		myPageDAO.updateProfileImg(map);
	}
}
