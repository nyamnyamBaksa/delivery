<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    // 로그아웃 버튼 클릭 이벤트 핸들러
    $("#logoutBtn").click(function () {
        // AJAX 요청을 사용하여 로그아웃 컨트롤러로 요청을 보냅니다.
        $.ajax({
            type: "GET",
            url: "/logout", // 로그아웃을 처리하는 서버 컨트롤러의 URL
            success: function (data) {
                // 로그아웃 성공 시 실행할 코드
                alert("로그아웃 성공");
                window.location.href = "/login"; 
            },
            error: function (error) {
                // 로그아웃 실패 시 실행할 코드
                alert("로그아웃 실패");
            }
        });
    });
});
</script>
</head>
<body>
	<h1>index</h1>
	
	<c:choose>
		<c:when test ="${sessionScope.mname eq null }">
			<li>로그인을 해주세요.</li>
		</c:when>
		<c:otherwise>
			<li>${sessionScope.mname }님 반갑습니다.</li>
			<button type="button" id="logoutBtn">로그아웃</button>
		</c:otherwise>
	</c:choose>
	
</body>
</html>