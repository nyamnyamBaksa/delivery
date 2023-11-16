<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰내역</title>
<link href="/css/review.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>

// 구글 시각화 API를 로딩하는 메소드
google.charts.load('current', {packages: ['corechart']});

// 구글 시각화 API가 로딩이 완료되면,
// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드
// 화면이 실행될 때 함께 실행된다.
google.charts.setOnLoadCallback(drawChart);

// 가로 막대형 차트
function drawChart() {
  var arr = [
    ['점수', '리뷰개수'],
    ['5점', ${countrscore.countrscore5}],
    ['4점', ${countrscore.countrscore4}],
    ['3점', ${countrscore.countrscore3}],
    ['2점', ${countrscore.countrscore2}],
    ['1점', ${countrscore.countrscore1}]
  ];

  // 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
  var dataTable = google.visualization.arrayToDataTable(arr);

  // 옵션객체 준비
  var options = {
    vAxis: { },
    colors: ['#FFC633'], // 막대의 색상 설정
    bar: { groupWidth: '15%' },
  };

  // 차트를 그릴 영역인 div 객체를 가져옴
  var objDiv = document.getElementById('column_chart_div1');

  // 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴 수 있는 차트객체를 반환
  var chart = new google.visualization.BarChart(objDiv);

  // 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트를 그리는 메소드
  chart.draw(dataTable, options);
}
</script>
<script>
<a href="javascript:history.back()"> <i 
class="fa-solid fa-arrow-left fa-xl" style="color: black;"></i>
</a>
</script>

</head>
<body>
<c:forEach items="${reviewview}" var="row" varStatus="loop" >
		<c:if test="${loop.first || row.sno ne reviewview[loop.index - 1].sno}">
			<a href="/food/storedetail?sno=${row.sno }" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
			    <i class="fa-solid fa-arrow-left fa-xl" style="color: black;"></i>
			</a>
	</c:if>
</c:forEach>
	<h1>리뷰보기</h1>
	<hr class="hr">
	
	<div id="column_chart_div1" style="width: 500px; height: 300px;" class="chart"></div>

	<div class="stroeAvg">
	<c:forEach items="${reviewview}" var="row" varStatus="loop" >
		<c:if test="${loop.first || row.sno ne reviewview[loop.index - 1].sno}">
			<div class="totalrscore">${row.totalrscore }</div>
<fieldset class="rate1">
  <input type="checkbox" id="rating5" name="rating" value="5" ${row.totalrscore >= 5 ? 'checked' : ''} disabled />
  <label for="rating5" title="5점">★</label>
  <input type="checkbox" id="rating4_half" name="rating" value="4.5" ${row.totalrscore >= 4 ? 'checked' : ''} disabled />
  <label for="rating4_half" title="4점">★</label>
  <input type="checkbox" id="rating3" name="rating" value="3" ${row.totalrscore >= 3 ? 'checked' : ''} disabled />
  <label for="rating3" title="3점">★</label>
  <input type="checkbox" id="rating2_half" name="rating" value="2.5" ${row.totalrscore >= 2 ? 'checked' : ''} disabled />
  <label for="rating2_half" title="2점">★</label>
  <input type="checkbox" id="rating1" name="rating" value="1" ${row.totalrscore >= 1 ? 'checked' : ''} disabled />
  <label for="rating1" title="1점">★</label>
</fieldset>
		 <div class="totalcount">최근 리뷰 ${row.totalcount }개</div>
		</c:if>
	</c:forEach>
	
		</div>
	<span class="examine">모든 리뷰는 검토 후 보여드려요</span>
			
	<div class="reviewview">
	  <c:forEach items="${reviewview}" var="row">
	    <div class="mnickname"><a href="/mypage/main/${row.mid}">${row.mnickname} ></a></div>
	    <c:if test="${row.mprofile ne null }">
	    	<img class="profile" src="/img/profileImg/${row.mprofile}" onerror="this.src='/img/profileImg/basic_profile.png'" id="userProfileImage"/>
		</c:if>	
			<fieldset class="rate">
			  <input type="checkbox" id="rating5" name="rating" value="5" ${row.rscore == 5 ? 'checked' : ''} disabled />
			  <label for="rating5" title="5점">★</label>
			  <input type="checkbox" id="rating4" name="rating" value="4" ${row.rscore == 4 ? 'checked' : ''} disabled />
			  <label for="rating4" title="4점">★</label>
			  <input type="checkbox" id="rating3" name="rating" value="3" ${row.rscore == 3 ? 'checked' : ''} disabled />
			  <label for="rating3" title="3점">★</label>
			  <input type="checkbox" id="rating2" name="rating" value="2" ${row.rscore == 2 ? 'checked' : ''} disabled />
			  <label for="rating2" title="2점">★</label>
			  <input type="checkbox" id="rating1" name="rating" value="1" ${row.rscore == 1 ? 'checked' : ''} disabled />
			  <label for="rating1" title="1점">★</label>
			</fieldset>
	    <div class="rddate">${row.rdate }</div>
	    <div class="rcomment">${row.rcomment }</div> <br>
	    <c:if test="${row.rphoto !=null }">
	    	<img class="rphoto" src="/img/review/${row.rphoto}" style="width:150px;height:150px;margin: 0 auto">
	    	<img class="rphoto" src="\img\review\20231116175919\data\user\0\mcore.edu.study\files\mcore_temp_file\storage\emulated\0\Download\화면 캡처 2023-11-16 175617 (1).png" style="width:150px;height:150px;margin: 0 auto">
	   ${row.rphoto}
	   \img\review\20231116175919\data\user\0\mcore.edu.study\files\mcore_temp_file\storage\emulated\0\Download
	    </c:if>
	    <br><br>
	    <hr>
	  </c:forEach>
	</div>
</body>
</html>