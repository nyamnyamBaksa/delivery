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
			<li>${sessionScope.mname }님반갑습니다.</li>
			
			<form action="./post" method="get" >
				<input class="serch" type="text" name="serchM" required="required" placeholder="주문했던 메뉴와 가게를 검색해 보세요">
				<%-- <input type="hidden" name="cate" value="${param.cate }"> --%>
				<button type="submit">검색</button>
			</form>
			<c:forEach items="${tradegroup}" var="row" varStatus="loop">
				<c:if test="${loop.first || row.tgroup ne tradegroup[loop.index - 1].tgroup}">
					<div class="tradeBox">
						<span class="menu-title font-alt col-sm-5">${row.tdate} 배달완료(${row.tgroup})</span>
		                <a href="tradedetail?tgroup=${row.tgroup }"><div class="tradeSname" >${row.sname } > </div></a>
		              	<a href="tradedetail?tgroup=${row.tgroup }"><button class="tradeDetailBtn">주문상세</button></a>
		              	<a href=""><button class="tradeReview">리뷰쓰기</button></a>
					</div>
				</c:if>
		            <div class="tradeMnname">${row.mnname}</div>
             </c:forEach>
		</c:when>
		
		<c:otherwise>
			<li>로그인을 해주세요.</li>
		</c:otherwise>
	</c:choose>

</body>
</html>