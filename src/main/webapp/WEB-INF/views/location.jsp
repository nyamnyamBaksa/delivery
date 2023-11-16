<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 위치 설정하기</title>
    <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="/css/location.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
   
</style>
</head>
<body>
<a href="javascript:history.back()" style="position: relative; z-index: 1;">
    <i class="fa-solid fa-arrow-left fa-xl" style="color: black; font-size: 2rem; margin-top: 30px; margin-left: 10px;"></i>
</a>
<h2 style="text-align: center; margin-top: 30px;">주소설정</h2>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	window.onload = function(){
	    document.getElementById("address").addEventListener("click", function(){ 
	        
	        new daum.Postcode({
	            oncomplete: function(data) { 
	            	
	            	window.location.href = "/?address=" + encodeURIComponent(data.address);
	            }
	        }).open();
	    });
	}
	</script>

<div id="search">
 <label for="address" style="position: relative; margin-left:25px;">
<i class="fa-solid fa-location-dot fa-2xl" style="color: #EB5757; position: absolute; top: 80%; transform: translateY(-50%); margin-left:10px;"></i>	
<input type="text" name="address" id="address" placeholder="지번,도로명,건물명으로 검색"><br>
</label>
</div>


<div id="location">
<i class="fa-regular fa-map fa-2xl" style="color: #eb5757; "></i><span style="font-size: 17px; font-weight: bold;">&nbsp;현재 위치로 설정</span><a href="/"><i class="fa-solid fa-chevron-right fa-s" style="color: #000000;"></i></a>


</div>



</body>
</html>