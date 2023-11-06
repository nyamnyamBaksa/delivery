<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게상세페이지</title>
<link rel="stylesheet" href="/css/storedetail.css">

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
</head>

<body>

	<div>
		<a href="javascript:history.back()"> <i
			class="fa-solid fa-arrow-left fa-xl" " style="color: black;"></i>
		</a><i class="xi-cart-o xi-2x" style="color: #fffff; float: right;"></i>
	</div>
	<br>
	<br>
	<div id="storedetail">
		<div id="storeimg" style="text-align: center;">${detail.store_image}
			<c:if test="${detail.store_image == null}">
				<i class="fa-solid fa-hammer fa-rotate-270 fa-lg"
					style="color: #eb5757;"></i>이미지 준비중<i
					class="fa-solid fa-wrench fa-lg" style="color: #eb5757;"></i>
			</c:if>
			<c:if test="${detail.store_image != null}">${detail.store_image}</c:if>
		</div>
		<div id="wishlist" style="float: right;">
			<button type="button">
			<!-- 찜하기 버튼 안눌렀을 때 빈하트/눌렀을 때 채워진하트-->
			<i class="fa-solid fa-heart fa-2xl" style="color: #eb5757;"></i>
			<i class="fa-solid fa-heart fa-2xl" style="color: #eb5757;"></i>
			</button>
		</div>

		<br>
		<div id="storename">${detail.store_name}</div>
		<br>
		<div id="storestar">
			<i class="xi-star xi-x" style="color: #FFC633;"></i>${detail.average_rating}&nbsp;&nbsp;리뷰${detail.review_count}개
			<a href="./review"><i class="fa-solid fa-chevron-right fa-2xs"
				style="color: #000000;"></i></a>
		</div>
		<button id="storeinfo"
			onclick="location.href='./storeinfo?sno=${detail.sno}'">가게정보</button>
			<hr style="width: 97%; border: solid 2px #eb5757;" />
		<br>
		<!-- <hr style="width: 95%; border: solid 2px #eb5757;" />  -->

		<div id="menumix">
			<i class="fa-solid fa-heart fa-lg" style="color: #eb5757;"></i> 메뉴 추천 조합
			<br>
			<br>
			<c:forEach items="${bestmenu}" var="best">
				<div id="menubest">&nbsp;${bestmenu}</div>
			</c:forEach>
		</div>


		<h3 style="margin-left: 25px;">
			<i class="fa-solid fa-utensils fa-lg"  style="color: #eb5757;"></i>&nbsp;&nbsp;메뉴
		</h3>
		<div id="menulist">
			<c:forEach items="${menulist}" var="menu">
				<table width="100%" style="text-align: left; margin-right: 10px;">
					<tr>
						<th style=""><a href="./menudetail?mnno=${menu.mnno}">${menu.mnname}</a></th>
						<td rowspan="3" style="width: 30%; text-align: center;"><c:if
								test="${menu.mnimg == null}">
								<i class="fa-solid fa-hammer fa-rotate-270 fa-lg"
									style="color: #eb5757;"></i>이미지 준비중 <i
									class="fa-solid fa-wrench fa-lg" style="color: #eb5757;"></i>
							</c:if> <c:if test="${menu.mnimg != null}">${l.store_image}</c:if></td>

					</tr>
					<tr>
						<td>${menu.mnprice}</td>
					</tr>

				</table>
			</c:forEach>
		</div>
	</div>



</body>
</html>