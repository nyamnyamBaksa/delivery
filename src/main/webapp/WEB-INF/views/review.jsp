<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰내역</title>
<link href="/css/review.css" rel="stylesheet">

</head>
<body>

	<h1>리뷰보기</h1>
	<hr class="hr">
	
	<c:forEach items="${reviewview}" var="row" varStatus="loop" >
		<c:if test="${loop.first || row.sno ne reviewview[loop.index - 1].sno}">
		<div class="stroeAvg">

			<div class="totalrscore">${row.totalrscore }</div>
			<fieldset class="rate">
		  <input type="checkbox" id="rating5" name="rating" value="5" ${row.totalrscore == 5 ? 'checked' : ''} disabled />
		  <label for="rating5" title="5점">★</label>
		  <input type="checkbox" id="rating4" name="rating" value="4" ${row.totalrscore == 4 ? 'checked' : ''} disabled />
		  <label for="rating4" title="4점">★</label>
		  <input type="checkbox" id="rating3" name="rating" value="3" ${row.totalrscore == 3 ? 'checked' : ''} disabled />
		  <label for="rating3" title="3점">★</label>
		  <input type="checkbox" id="rating2" name="rating" value="2" ${row.totalrscore == 2 ? 'checked' : ''} disabled />
		  <label for="rating2" title="2점">★</label>
		  <input type="checkbox" id="rating1" name="rating" value="1" ${row.totalrscore == 1 ? 'checked' : ''} disabled />
		  <label for="rating1" title="1점">★</label>
		</fieldset>
		</div>
			<div class="totalcount">최근 리뷰 ${row.totalcount }개</div>
		</c:if>
	</c:forEach>
	<span class="examine">모든 리뷰는 검토 후 보여드려요</span>
	
	<div class="reviewview">
	  <c:forEach items="${reviewview}" var="row">
	  <br>
	    <div class="mnickname"><a href="/mypage/main/${row.mid}">${row.mnickname} ></a></div>
	    <img src="/img/${row.mprofile}" alt="프로필" class="profile">
		<fieldset class="rate">
		  <input type="checkbox" id="rating5" name="rating" value="5" ${row.rscore == 5 ? 'checked' : ''} disabled />
		  <label for="rating5" title="5점">★</label>
		  <input type="checkbox" id="rating4" name="rating" value="4" ${row.rscore == 4 ? 'checked' : ''} disabled />
		  <label for="rating4" title="4점">★</label>
		  <input type="checkbox" id="rating3" name="rating" value="3" ${row.rscore == 3 ? 'checked' : ''} disabled />
		  <label for="rating3" title="3점">★</label>
		  <input type="checkbox" id="rating2" name="rating" value="2" ${row.rscore == 2 ? 'checked' : ''} disabled />
		  <label for="rating2" title="2점">★</label>
		  <input type="checkbox" id="rating1" name="rating" value="1" ${row.rscore == 1 ? 'checked' : ''} disabled />
		  <label for="rating1" title="1점">★</label>
		</fieldset>
	    <div class="rddate">${row.rdate }</div>
	    <div class="rcomment">${row.rcomment }</div> <br>
	    <c:if test="${row.rphoto !=null }">
	    	<img alt="리뷰사진" src="/img/${row.rphoto} " class="rphoto">
	    </c:if>
	    <br><br>
	    <hr>
	  </c:forEach>
	</div>
</body>
</html>