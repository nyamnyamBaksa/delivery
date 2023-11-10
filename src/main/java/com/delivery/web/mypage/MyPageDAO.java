package com.delivery.web.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MyPageDAO {

	Map<String, Object> profile(String targetId);

	void updateProfileImg(Map<String, Object> map);

	Map<String, Object> follow(String id);

	List<Map<String, Object>> boardlist(Map<String, Object> map);

	void bdelete(int bno);

	void updateLike(Map<String, Object> map);

	int mylike(Map<String, Object> map);

	List<Map<String, Object>> comment(int bno);

	String profileImg(Map<String, Object> map);

	int updateFollow(Map<String, Object> map);

	int babfriend(@Param("myid") String myid, @Param("id") String id);

	int iIs3(Map<String, Object> map);

	int iIs3update(Map<String, Object> map);

	List<Map<String, Object>> followAsk(Map<String, Object> map);

	List<Map<String, Object>> coupon(String mid);

	List<Map<String, Object>> pay(Map<String, Object> map);

	int findById(String id);

	void charge(Map<String, Object> map);

	List<Map<String, Object>> reviewlist(Map<String, Object> map);

	int rdelete(Map<String, Object> map);

	void dwrite(Map<String, Object> map);

	void cwrite(Map<String, Object> map);

	void updateReview(Map<String, Object> map);

	Map<String, Object> findReviewByRno(Map<String, Object> map);

	Map<String, Object> info(String mid);

	void out(String mid);

	int idchk(Map<String, Object> map);

	void idUpdate(Map<String, Object> map);

	void pwUpdate(Map<String, Object> map);

	void addrUpdate(Map<String, Object> map);

	void phoneUpdate(Map<String, Object> map);

	List<Map<String, Object>> toplist(String id);

	List<Map<String, Object>> favoritecate(String id);

	Map<String, Object> diaryDetail(int bno);

	void dupdate(Map<String, Object> map);

	List<Map<String, Object>> friendcount(Map<String, Object> map);

	int oldListCnt(Map<String, Object> map);

	int paycount(Map<String, Object> map);

	List<Map<String, Object>> mnreviewlist(Map<String, Object> map);

}
