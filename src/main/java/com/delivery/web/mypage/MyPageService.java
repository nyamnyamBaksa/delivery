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
	
	public String profileImg(Map<String, Object> map) {
		return myPageDAO.profileImg(map);
	}

	public Map<String, Object> follow(String id) {
		return myPageDAO.follow(id);
	}

	public List<Map<String, Object>> boardlist(String mid, String id) {
		return myPageDAO.boardlist(mid, id);
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

	public int updateFollow(Map<String, Object> map) {
		return myPageDAO.updateFollow(map);
	}

	public int babfriend(String myid, String id) {
		return myPageDAO.babfriend(myid, id);
	}

	public int iIs3(Map<String, Object> map) {
		return myPageDAO.iIs3(map);
	}

	public int iIs3update(Map<String, Object> map) {
		return myPageDAO.iIs3update(map);
	}

	public List<Map<String, Object>> followAsk(Map<String, Object> map) {
		return myPageDAO.followAsk(map);
	}

	public List<Map<String, Object>> coupon(String mid) {
		return myPageDAO.coupon(mid);
	}

	public List<Map<String, Object>> pay(String mid, int cate) {
		return myPageDAO.pay(mid, cate);
	}

	public int findById(String id) {
		return myPageDAO.findById(id);
	}

	public void charge(Map<String, Object> map) {
		myPageDAO.charge(map);
	}

	public List<Map<String, Object>> reviewlist(String id) {
		return myPageDAO.reviewlist(id);
	}

	public int rdelete(Map<String, Object> map) {
		return myPageDAO.rdelete(map);
	}

	public void dwrite(Map<String, Object> map) {
		myPageDAO.dwrite(map);
	}

	public void cwrite(Map<String, Object> map) {
		myPageDAO.cwrite(map);
	}

	public void updateReview(Map<String, Object> map) {
		myPageDAO.updateReview(map);
	}

	public Map<String, Object> findReviewByRno(Map<String, Object> map) {
		return myPageDAO.findReviewByRno(map);
	}

	public Map<String, Object> info(String mid) {
		return myPageDAO.info(mid);
	}

	public void out(String mid) {
		myPageDAO.out(mid);
	}

	public int idchk(Map<String, Object> map) {
		return myPageDAO.idchk(map);
	}

	public void idUpdate(Map<String, Object> map) {
		myPageDAO.idUpdate(map);
	}

	public void pwUpdate(Map<String, Object> map) {
		myPageDAO.pwUpdate(map);
	}

	public void addrUpdate(Map<String, Object> map) {
		myPageDAO.addrUpdate(map);
	}

	public void phoneUpdate(Map<String, Object> map) {
		myPageDAO.phoneUpdate(map);
	}

	public List<Map<String, Object>> toplist(String id) {
		return myPageDAO.toplist(id);
	}

	public List<Map<String, Object>> favoritecate(String id) {
		return myPageDAO.favoritecate(id);
	}

	public Map<String, Object> diaryDetail(int bno) {
		return myPageDAO.diaryDetail(bno);
	}

	public void dupdate(Map<String, Object> map) {
		myPageDAO.dupdate(map);
	}


}
