<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
</head>
<body>
	<nav>
		<ul>
			<li onclick="link('home')"><i class="fa-solid fa-house fa-2xl"
				style="color: #eb5757;"></i> 홈</li>
			<li onclick="link('search')"><i
				class="fa-solid fa-magnifying-glass fa-2xl" style="color: #eb5757;"></i>
				검색</li>
			<li onclick="link('wishlist')"><i
				class="fa-solid fa-heart fa-2xl" style="color: #eb5757;"></i> 찜</li>
			<li onclick="link('trade')"><i
				class="fa-solid fa-clipboard-list fa-2xl" style="color: #eb5757;"></i>
				주문내역</li>
				<c:choose>
    <c:when test="${sessionScope.mgrade ne null }">
        <c:choose>
            <c:when test="${sessionScope.mgrade eq '2'}">
                <li onclick="link('admin/list-member')">
                    <i class="fa-solid fa-screwdriver-wrench fa-xl" style="color: #eb5757;"></i>
                    관리자페이지
                </li>
            </c:when>
            <c:otherwise>
                <li onclick="link('mypage/main')">
                    <i class="fa-regular fa-face-smile-wink fa-2xl" style="color: #eb5757;"></i>
                    마이페이지
                </li>
            </c:otherwise>
        </c:choose>
    </c:when>
</c:choose>
		</ul>
	</nav>

	<Script>
		function link(url) {
			location.href = "/" + url;
		}
	</Script>

</body>
</html>