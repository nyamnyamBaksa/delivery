<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/home.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1 style="text-align: center;">냠냠박사</h1>

	<div id="location">
		<div>
			<i class="fa-solid fa-location-dot fa-xl" style="color: #ffffff;"></i>
			대표 주소를 설정해주세요.
		</div>
	</div>
	<br>
	<div id="randomfood" style="float: right;">
		<h1 style="display: inline;">오늘 뭐먹지?</h1>
		<button type="button" style="display: inline;">선택</button>
	</div>
	<br>
	<div id="foodcategory">
		<div>
			<a href="food/1?category=한식">한식</a>
		</div>
		<div>
			<a href="food/2?category=중식">중식</a>
		</div>
		<div>
			<a href="food/3?category=일식">일식</a>
		</div>
		<div>
			<a href="food/4?category=양식">양식</a>
		</div>
		<div>
			<a href="food/5?category=분식">분식</a>
		</div>
		<div>
			<a href="food/6?category=아시안">아시안</a>
		</div>
		<div>
			<a href="food/7?category=패스트푸드">패스트푸드</a>
		</div>
		<div>
			<a href="food/8?category=카페/디저트">카페/디저트</a>
		</div>
	</div>


	<swiper-container class="mySwiper" scrollbar-hide="true">
	<swiper-wrapper> <c:forEach items="${list}" var="l"
		varStatus="status">
		<swiper-slide>
		<div class="restraunt-list"
			style="display: flex; align-items: center;">
			<table width="50%" style="text-align: left; margin-right: 10px;">
				<tr>
					<td rowspan="3" style="width: 200px; text-align: center;"><c:if
							test="${l.store_image == null}">
							<i class="fa-solid fa-hammer fa-rotate-270 fa-lg"
								style="color: #eb5757;"></i>이미지 준비중
                                    <i class="fa-solid fa-wrench fa-lg"
								style="color: #eb5757;"></i>
						</c:if> <c:if test="${l.store_image != null}">${l.store_image}</c:if></td>
					<td style="font-size: large;">${l.store_name}</td>
				</tr>
				<tr>
					<td><i class="xi-star xi-x" style="color: #ffe11c;"></i><span
						class="rating">${l.average_rating}</span><span class="review">(${l.review_count})</span></td>
				</tr>
				<tr>
					<td>최소주문 9,000원</td>
				</tr>
			</table>
		</div>
		</swiper-slide>
	</c:forEach> </swiper-wrapper> </swiper-container>




</body>

</html>
