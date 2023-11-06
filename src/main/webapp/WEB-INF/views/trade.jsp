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
	<h1>주문내역</h1>
	<hr class="hr">
	<a href="/home">X</a>
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
			<div class="tradeBox">	
				<c:if test="${loop.first || row.tgroup ne tradegroup[loop.index - 1].tgroup}">
					
						<span class="tradedate">${row.tdate} 배달완료(${row.tgroup})</span>
						<img alt="샘플이미지" src="/img/sample.png" class="sampleimg">
		                <a href="tradedetail?tgroup=${row.tgroup }"><div class="Sname">${row.sname } > </div></a>
		              	<a href="tradedetail?tgroup=${row.tgroup }"><button class="tradeDetailBtn">주문상세</button></a>
		              	<a href="review?sno=${row.sno}"><button class="reviewBtn">리뷰쓰기</button></a>
				</c:if>
		            	<div class="tradeMnname">${row.mnname}</div>
            </div>
             </c:forEach>
		
		</c:when>
		
		<c:otherwise>
			<li>로그인을 해주세요.</li>
		</c:otherwise>
	</c:choose>

</body>
</html>