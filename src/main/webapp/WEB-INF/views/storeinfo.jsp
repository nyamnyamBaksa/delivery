<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게정보</title>

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95bbf6af936a9f2f64e3c60c91399bfd&libraries=services"></script>
</head>

<a href="javascript:history.back()"> <i
	class="fa-solid fa-arrow-left fa-lg" style="color: black;"></i>
</a>


<h1 style="text-align: center;">가게정보</h1>
<h1>영업정보</h1>
<c:forEach items="${storeinfo}" var="s">
	<div>상호명 ${s.sname}</div>
	<div>영업시간 ${s.stime}</div>
	<div>전화번호 ${s.sphone}</div>
	<div>위치안내 ${s.saddr}</div>
	<div id="map" style="width: 600px; height: 350px;"></div>
</c:forEach>



<script type="text/javascript">

</script>



</body>
</html>