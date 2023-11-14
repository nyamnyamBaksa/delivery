<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link href="css/trade.css" rel="stylesheet">
</head>
<body>
	<a href="/home"><-뒤로가기</a>
	<h1>주문내역</h1>
	<hr class="hr">
	
	<c:choose>
		<c:when test="${sessionScope.mname ne null }">
			<form action="./post" method="get" >
			  <div class="serch-container">
				<input class="serch" type="text" name="serchM" required="required" placeholder="주문했던 메뉴와 가게를 검색해 보세요">
				<%-- <input type="hidden" name="cate" value="${param.cate }"> --%>
				<button type="submit" class="serchBtn">
					<img src="img/serchBtn.png" alt="검색">
				</button>
				</div>
			</form>
		
			<c:forEach items="${tradegroup}" var="row" varStatus="loop" >
				<c:if test="${loop.first || row.tgroup ne tradegroup[loop.index - 1].tgroup}">
					<div class="tradeBox">	
						<span class="tradedate">${row.tdate} 배달완료(${row.tgroup})</span>
						<img alt="샘플이미지" src="/img/sample.png" class="sampleimg">
		                <a href="tradedetail?tgroup=${row.tgroup }"><div class="Sname">${row.sname } ></div></a> 
		              	<a href="tradedetail?tgroup=${row.tgroup }"><button class="tradeDetailBtn">
		              		<span class="tradeDetailText">주문상세</span></button></a>
		              	<a href="review?sno=${row.sno}"><button class="reviewBtn">
		              		<span class="reviewText">리뷰쓰기</span></button></a>
		            	<div class="tradeMnname">${row.mnname}
			            	<c:if test="${row.totaltamount != 1}">
			            		외 ${row.totaltamount}	
			            	</c:if>
		            	</div>
		            		<c:if test="${row.cpno == 1 }">
		            		<div class="cpno">
		            			<div class="cpnotext">2000원 할인받음</div>
		            		</div>
		            		</c:if>
		            </div>
				</c:if>
             </c:forEach>
		 
		</c:when>
		
		<c:otherwise>
			<li>로그인을 해주세요.</li>
		</c:otherwise>
	</c:choose>

</body>
</html>