package com.delivery.web.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<Map<String, Object>> reviewgroup(int sno) {
		return reviewDAO.reviewgroup(sno);
	}


	public int saveReview(Map<String, Object> map) {
		return reviewDAO.saveReview(map);
		
	}

	public List<Map<String, Object>> review(int sno) {
		return reviewDAO.revivew(sno);
	}


	public Map<String, Object> countrscore(int sno) {
		return reviewDAO.countrscore(sno);
	}

}
