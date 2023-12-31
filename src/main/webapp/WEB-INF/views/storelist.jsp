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
<meta charset="UTF-8">
<title>상세카테고리</title>
<link rel="stylesheet" href="/css/storelist.css">
<link rel="stylesheet" href="/css/menu.css">

<link rel="stylesheet"
	href="/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
</head>

<body>
<%@ include file="menu.jsp"%>

	<h1 style="text-align: center; font-size: 30px;"><a href="/">냠냠박사</a><i class="fa-solid fa-utensils fa-bounce fa-lg" style="color: #eb5757;"></i></h1>
	<a id="cart" href="/cart"><i class="fa-solid fa-cart-shopping fa-2xl"
		style="color: #000000; margin-left: 90%; font-size: 2rem;"></i></a>
	<br>

	<!-- Swiper -->
	<div class="swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="./1?category=한식">한식</a>
			</div>
			<div class="swiper-slide">
				<a href="./2?category=중식">중식</a>
			</div>
			<div class="swiper-slide">
				<a href="./3?category=일식">일식</a>
			</div>
			<div class="swiper-slide">
				<a href="./4?category=양식">양식</a>
			</div>
			<div class="swiper-slide">
				<a href="./5?category=분식">분식</a>
			</div>
			<div class="swiper-slide">
				<a href="./6?category=아시안">아시안</a>
			</div>
			<div class="swiper-slide">
				<a href="./7?category=패스트푸드">패스트푸드</a>
			</div>
			<div class="swiper-slide">
				<a href="./8?category=카페/디저트">카페/디저트</a>
			</div>
		</div>
	</div>

	<hr style="width: 95%; border: solid 2px #eb5757;" />

	<br>
	<form name="search " method="get" action="/storelist" style="margin-left: 20px">
		<label id="list-option"></label>
		<select id="select_option" onchange="sortoption()">
			<option value="기본순">기본순</option>
			<option value="평점높은순">평점높은순</option>
			<option value="리뷰많은순">리뷰많은순</option>
		</select>
	</form>
	<br>

	<div class="restraunt-list" style="">
		<c:forEach items="${list}" var="l">
			<div style="display: flex; align-items: center;">
				<table width="70%" style="text-align: left; margin-right: 10px;">

					<tr>
						<td rowspan="3" style="width: 80px; text-align: center;">
						<c:if test="${l.store_image == null}">
								이미지<br>준비중
							</c:if>
							<c:if test="${l.store_image != null}"><img style="width: 80px; height: 70px; " class="foodimg" src="/img/food/${l.store_image}"></c:if></td>
	 					<td style="font-size: 13px;">${l.store_name}</td>
					</tr>
					<tr>
						<td><i class="xi-star xi-x" style="color: #ffe11c;"></i><span class="rating">${l.average_rating }</span><span class="review">(${l.review_count})</span></td>
					</tr>
					<tr>
						<td>최소주문 9,000원</td>
					</tr>

				</table>
				<button type="button"
					onclick="location.href='./storedetail?sno=${l.sno}'">주문하기</button>
			</div>
		</c:forEach>
	</div>
	
	<script type="text/javascript">
    function sortoption() {
    	
        let selectElement = document.getElementById('select_option');
        let selectedOption = selectElement.value;
        let list = document.querySelectorAll('.restraunt-list > div');
        let restrauntlist = document.querySelector('.restraunt-list');
        
        let sortedList;
        
        if (selectedOption === '평점높은순') {
        	sortedList = Array.from(list).sort((a, b) => {
                let ratingA = parseFloat(a.querySelector('.rating').textContent);
                let ratingB = parseFloat(b.querySelector('.rating').textContent);
                
                return ratingB - ratingA;
            });
            
        } else if (selectedOption === '리뷰많은순') {
        	sortedList = Array.from(list).sort((a, b) => {
                let reviewA = parseInt(a.querySelector('.review').textContent);
                let reviewB = parseInt(b.querySelector('.review').textContent);
               
                return reviewB - reviewA;
            });
        
        }else { 
        	sortedList = Array.from(list);
        }
       
        sortedList.forEach((item) => restrauntlist.appendChild(item));
    
    }
</script>
	
	
	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper', {
			slidesPerView : 6,
			direction :'horizontal',
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			on : {
				resize : function() {
					swiper.changeDirection('horizontal');
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