<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세</title>
<link href="css/tradedetail.css" rel="stylesheet">
</head>
<body>
	<h1>주문상세</h1>
	<hr class="hr">
	<a href="/trade">X</a>
	<c:forEach items="${tradedetail}" var="row" varStatus="loop">
		<c:if test="${loop.first || row.tgroup ne tradedetail[loop.index - 1].tgroup}">
			<div class="tradedetailBox">
				<span style="color: #EB5757;" >배달이 완료되었어요</span><br>
				<span style="font-weight: bold;">${row.mnname }</span><br>
		        <button>가게보기</button>
		        <div class="coupon">2000원 할인 받음</div>
				<div class="tradedetailDate">
					주문일시 : ${row.tdate } <br>
					주문번호 : ${row.tgroup }
				</div>
			</div>
		</c:if>
			<div class="tradeMnname">
			${row.mnname} ${row.tamount}개 <br>
			${row.total}
			</div>
		</c:forEach>	
			
		결제금액 <br>
		-------------------------------------<br>
		
		<c:forEach items="${tradedetail}" var="row" varStatus="loop">
		<c:if test="${loop.first || row.tgroup ne tradedetail[loop.index - 1].tgroup}">
		주문금액 ${row.realtotal }
			</c:if>
		</c:forEach>	
	
	
</body>
</html>