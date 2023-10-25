package com.delivery.web.mypage;

import java.util.List;
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

	public Map<String, Object> follow(String id) {
		return myPageDAO.follow(id);
	}

	public List<Map<String, Object>> boardlist(String id) {
		return myPageDAO.boardlist(id);
	}

	public void bdelete(int bno) {
		myPageDAO.bdelete(bno);
	}

	public void updateLike(Map<String, Object> map) {
		myPageDAO.updateLike(map);
	}

	public int mylike(Map<String, Object> map) {
		return myPageDAO.mylike(map);
	}

	public List<Map<String, Object>> comment(int bno) {
		return myPageDAO.comment(bno);
	}

}
