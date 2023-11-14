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
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1 style="text-align: center; font-size: 70px;">냠냠박사<i class="fa-solid fa-utensils fa-bounce fa-lg" style="color: #eb5757;"></i></h1>

	<div id="location">
		<div>
			<a href="/location"><i class="fa-solid fa-location-dot fa-2xl" style="color: #ffffff;"></i>
			<span style="font-size: 35px; color: white;'">대표 주소를 설정해주세요</span></a>
			
		</div>
	</div>
	<br>
<div id="randomfood" style="float: right;">
    <h2 id="menutext" style="display: inline; font-size: 35px; font-weight: bold;">오늘 뭐먹지?</h2>&nbsp;&nbsp;&nbsp;
    <button type="button" onclick="randommenu()" style="display: inline;">선택</button>
</div>

    <script type="text/javascript">
    let menulist = ["칼국수", "감베리크레마", "교자만두", "시골야채된장비빔밥",
        "목살김치된장", "햄버거", "새우샤오룽바오", "꿔바로우", "보슬키토",
        "생돼지 김치찌개식 두루치기", "돼지갈비찜", "완당떡국", "스시"];

    function randommenu() {
        let randomindex = Math.floor(Math.random() * menulist.length);
        let selectmenu = menulist[randomindex];
        
        let menu = document.getElementById("menutext");
        menu.style.transition = "opacity 0.5s ease-in-out"; 
        
        setTimeout(() => {
            menu.style.opacity = "0";
            setTimeout(() => {
                menu.textContent = selectmenu; 
                menu.style.opacity = "1"; 
            }, 500); 
        }, 10); 
    }
</script>

	<br>
	<div id="foodcategory">
		<div>
			<a href="food/1?category=한식"><i class="fa-solid fa-bowl-food fa-lg" style="color: #eb5757;"></i> 한식</a>
		</div>
		<div>
			<a href="food/2?category=중식"><i class="fa-solid fa-shrimp fa-lg" style="color: #eb5757;"></i> 중식</a>
		</div>
		<div>
			<a href="food/3?category=일식"><i class="fa-solid fa-fish fa-lg" style="color: #eb5757;"></i> 일식</a>
		</div>
		<div>
			<a href="food/4?category=양식"><i class="fa-solid fa-pizza-slice fa-lg" style="color: #eb5757;"></i> 양식</a>
		</div>
		<div>
			<a href="food/5?category=분식"><i class="fa-solid fa-hotdog fa-lg" style="color: #eb5757;"></i> 분식</a>
		</div>
		<div>
			<a href="food/6?category=아시안"><i class="fa-solid fa-plate-wheat fa-lg" style="color: #eb5757;"></i> 아시안</a>
		</div>
		<div>
			<a href="food/7?category=패스트푸드"><i class="fa-solid fa-burger fa-lg" style="color: #eb5757;"></i> 패스트푸드</a>
		</div>
		<div>
			<a href="food/8?category=카페/디저트"><i class="fa-solid fa-cookie fa-lg" style="color: #eb5757;"></i> 카페/디저트</a>
		</div>
	</div>
	<br>

<div class="restraunt-list" style=" ">
	<h2 class="bestname" style="font-size: 50px;">냠냠박사 Best 맛집 <i class="fa-solid fa-crown fa-lg" style="color: #ff9c41; margin-bottom: -5px;"></i></h2>
	<br>
		<c:forEach items="${list}" var="l">
			<div style="display: flex; align-items: center;">
				<table  width="100%" style="text-align: left; ">

					<tr>
						<td rowspan="3" style="width: 200px; text-align: left;">
						<c:if test="${l.store_image == null}">
								<i class="fa-solid fa-hammer fa-rotate-270 fa-lg"
									style="color: #eb5757;"></i>이미지 준비중<i class="fa-solid fa-wrench fa-lg" style="color: #eb5757;"></i>
							</c:if>
							<c:if test="${l.store_image != null}"><img style="width: 210px; height: 180px; " class="foodimg" src="/img/food/${l.store_image}"></c:if></td>
	 					<td>${l.store_name}</td>
					</tr>
					<tr>
						<td><i class="xi-star xi-x" style="color: #ffe11c;"></i><span class="rating"> ${l.average_rating }</span><span class="review">(${l.review_count})</span></td>
					</tr>
					<tr>
						<td id="ordername">최소주문 9,000원</td>
					</tr>

				</table>
				<a href="food/storedetail?sno=${l.sno}"><button id="nowbutton" type="button">주문하기</button></a>
			</div>
		</c:forEach>
	</div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
</body>

</html>
