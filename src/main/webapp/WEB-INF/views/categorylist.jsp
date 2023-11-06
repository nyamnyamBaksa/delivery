<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
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
	<h1>로고</h1>
	
	<i class="xi-cart-o xi-2x" style="float: right;"></i>
	<br>

	<div class="swiper">
    <ul class="swiper-wrapper">
        <li class="swiper-slide"><a href="./food?mncate=1">한식</a></li>
        <li class="swiper-slide"><a href="./food?mncate=2">일식</a></li>
        <li class="swiper-slide"><a href="./food?mncate=3">중식</a></li>
        <li class="swiper-slide"><a href="./food?mncate=4">양식</a></li>
        <li class="swiper-slide"><a href="./food?mncate=5">분식</a></li>
        <li class="swiper-slide"><a href="./food?mncate=6">아시안</a></li>
        <li class="swiper-slide"><a href="./food?mncate=7">패스트푸드</a></li>
        <li class="swiper-slide"><a href="./food?mncate=8">카페/디저트</a></li>
    </ul>
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