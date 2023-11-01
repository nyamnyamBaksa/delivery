<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게상세페이지</title>
<link rel="stylesheet" href="./css/storedetail.css">

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>

<body>

	<div>
		<a href="javascript:history.back()"> <i
			class="fa-solid fa-arrow-left fa-lg" style="color: black;"></i>
		</a><i class="xi-cart-o xi-2x" style="color: #fffff; float: right;"></i>
	</div>
	<div></div>
	<div></div>
	<div id="storedetail">
		<div id="storeimg">${detail.store_image}</div>
		<div id="storename">${detail.store_name}</div>
		<div id="storestar">
			<i class="xi-star xi-x" style="color: #FFC633;"></i>${detail.average_rating}&nbsp;&nbsp;리뷰${detail.review_count}개
			<a href="./review"><i class="fa-solid fa-chevron-right fa-2xs"
				style="color: #000000;"></i></a>
		</div>
		<button id="storeinfo"
			onclick="location.href='./storeinfo?sno=${detail.sno}'">가게정보</button>
		<br>

		<div id="menumix">
			<i class="fa-solid fa-heart fa-sm" style="color: #eb5757;"></i> 메뉴 추천
			조합
			<!-- 메뉴 추천 조합 기능 추후 구현 예정 -->
			<div id="menubest">&nbsp;${mnname} + ${mnname}</div>

		</div>


		<h3>
			<i class="fa-solid fa-utensils" style="color: #eb5757;"></i> 메뉴
		</h3>
		<div id="menulist">
			<c:forEach items="${menulist}" var="menu">
				<table border="1" width="50%"
					style="text-align: left; margin-right: 10px;">

					<tr>
						<td><a href="./menudetail?mnno=${menu.mnno}">${menu.mnname}</a></td>
						<td rowspan="3" style="width: 200px; text-align: center;">${menu.mnimg}</td>
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