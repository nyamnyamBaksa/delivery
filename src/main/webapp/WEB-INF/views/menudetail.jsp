<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세페이지</title>
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

	<div id="storedetail">
	<c:forEach items="${menudetail}" var="mf">
		<div id="menuimg" style="text-align: center;">${mf.mnimg}</div>
		<div id="menuname">${mf.mnname}</div>
		<div id="menudesc">${mf.mndesc} </div>
		<div id="menuprice">가격<div style="text-align: right;">${mf.mnprice}</div></div>
		<br>
		<br>
		<div><i class="fa-solid fa-plus fa-xl" style="color: #eb5757;"></i> 사이드 추가 선택</div>
		<br>
		<input type='checkbox' name='sidemenu' value='${mnname}' >${mf.mnname} ${mf.mnprice }원

		</c:forEach>
		</div>
		<br>
		<button type="button" onclick="location.href='./cart?cno='${cno}">담기</button>


</body>
</html>