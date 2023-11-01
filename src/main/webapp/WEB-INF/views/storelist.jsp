<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세카테고리</title>
<link rel="stylesheet" href="./css/storelist.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background-color: white;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 10%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #ffdfc6;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

</head>

<body>
	<h1 style="text-align: center;">냠냠박사</h1>

	<i class="xi-cart-o xi-2x" style="float: right;"></i>
	<br>

	<!-- Swiper -->
	<div class="swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="./1">한식</a>
			</div>
			<div class="swiper-slide">
				<a href="./2">중식</a>
			</div>
			<div class="swiper-slide">
				<a href="./3">일식</a>
			</div>
			<div class="swiper-slide">
				<a href="./4">양식</a>
			</div>
			<div class="swiper-slide">
				<a href="./5">분식</a>
			</div>
			<div class="swiper-slide">
				<a href="./6">아시안</a>
			</div>
			<div class="swiper-slide">
				<a href="./7">패스트푸드</a>
			</div>
			<div class="swiper-slide">
				<a href="./8">카페/디저트</a>
			</div>
		</div>
		<!--  <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>-->
	</div>

	<br>
	<form method="get" action="" style="">
		<label id="list-option"></label> <select id="list-option">
			<option value="기본순">기본순</option>
			<option value="평점높은순">평점높은순</option>
			<option value="신규매장순">신규매장순</option>
		</select>
	</form>
	<br>

	<div class="restraunt-list" style="">
		<c:forEach items="${list}" var="l">
			<div style="display: flex; align-items: center;">
				<table border="1" width="50%"
					style="text-align: left; margin-right: 10px;">
					<tr>
						<td rowspan="3" style="width: 200px; text-align: center;">${l.store_image}</td>
						<td>${l.store_name}</td>
					</tr>
					<tr>
						<td><i class="xi-star xi-x" style="color: #ffe11c;"></i>${l.average_rating }(${l.review_count})</td>
					</tr>
					<tr>
						<td>최소주문 9,000원</td>
					</tr>

				</table>
				<button type="button"
					onclick="location.href='./storedetail?sno=${l.sno}'">주문하러가기</button>
			</div>
		</c:forEach>
	</div>


	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper', {
			slidesPerView : 6,
			direction : getDirection(),
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			on : {
				resize : function() {
					swiper.changeDirection(getDirection());
				},
			},
		});

		function getDirection() {
			var windowWidth = window.innerWidth;
			var direction = window.innerWidth <= 760 ? 'vertical'
					: 'horizontal';

			return direction;
		}
	</script>
</body>
</html>