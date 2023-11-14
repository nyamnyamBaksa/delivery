<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 위치 설정하기</title>
<link rel="stylesheet" href="/css/location.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
   
</style>
</head>
<body>
<h1 style="text-align: center;">주소설정</h1>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	window.onload = function(){
	    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address").value = data.address; // 주소 넣기
	            }
	        }).open();
	    });
	}
	</script>

<div id="search">
<i class="fa-solid fa-location-dot fa-2xl" style="color: #EB5757;"></i>	
<input type="text" name="address" id="address" placeholder="지번,도로명,건물명으로 검색"><br>
</div>

</body>
</html>