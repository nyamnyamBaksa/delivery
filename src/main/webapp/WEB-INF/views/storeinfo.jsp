<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게정보</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="/css/storeinfo.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95bbf6af936a9f2f64e3c60c91399bfd&libraries=services"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
</head>

<a href="javascript:history.back()"> <i 
	class="fa-solid fa-arrow-left fa-xl" style="color: black; margin-top: 30px;"></i>
</a>


<h1 style="text-align: center;">가게정보</h1>
<hr style="width: 95%; border: solid 2px #eb5757;" />
<br>
<c:forEach items="${storeinfo}" var="s">

<h2 style="margin-left: 25px;">가게소개</h2>
<div style="margin-left: 25px;">${s.sdesc}</div>

<h2 style="margin-left: 20px">영업정보</h2>
<table width="95%" style="margin-left: 5px; text-align: left;" >
      <tr>
        <th style="width: 70px;">상호명</th>
        <td>${s.sname}</td>
      </tr>
      <tr>
        <th>운영시간</th>
        <td>${s.stime}</td>
      </tr>
      <tr>
        <th>전화번호</th>
        <td>${s.sphone}</td>
      </tr>
      <tr>
        <th>위치안내</th>
        <td>${s.saddr}</td>
      </tr>
    </table>
	<div id="map" style="margin-left: 7px; width:95%;height:220px;"></div>
</c:forEach>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.499594008902825, 127.03047466035417), // 지도의 중심좌표
        level: 2// 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.499594008902825, 127.03047466035417); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);    
</script>

</body>
</html>