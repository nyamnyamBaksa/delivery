<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세</title>
<link href="css/tradedetail.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    <i class="fa-solid fa-arrow-left fa-xl" style="color: black;"></i>
</a>
	<h1>주문상세</h1>
	<hr class="hr">
	<div class="tradedetailBox">
	<c:forEach items="${tradedetail}" var="row" varStatus="loop">
		<c:if test="${loop.first || row.tgroup ne tradedetail[loop.index - 1].tgroup}">
			<div class="detailBox">
				<div class="title">
					<span style="color: #EB5757;" >배달이 완료되었어요</span><br>
					<span style="color: #000000;">${row.sname }</span><br>
				</div>
				<a href="food/storedetail?sno=${row.sno }">
					<button class="storedetailBtn">
			        	<span class="storedetail">가게보기</span>
			        </button>
				</a>

		        <c:if test="${row.cpno == 1 }">
		           <div class="cpno">
		           	<div class="cpnotext">2000원 할인받음</div>
		           </div>
		        </c:if>
				<div class="tradedetailDate">
					<span style="font-weight: bold;">주문일시</span> : ${row.tdate } <br>
					<span style="font-weight: bold;">주문번호</span> : ${row.tgroup }<br><br>
				</div>
			</div>
		</c:if>
			<div class="tradeMnname">
			${row.mnname} ${row.tamount}개 <br>
			${row.ttotal}
			<br><br>
			</div>
		</c:forEach>	
		<div class="text">
		
		결제금액 <br>
		-------------------------------------<br>
	
		
		<c:forEach items="${tradedetail}" var="row" varStatus="loop">
			<c:if test="${loop.first || row.tgroup ne tradedetail[loop.index - 1].tgroup}">
				주문금액 ${row.total }<br>
				<c:choose>
					<c:when test="${row.cpno ==1 }">
						<span style="color:red;">${tradecp.cpname} 쿠폰 -${tradecp.cpprice}원</span><br>
						<span>총 결제금액 ${tradecp.puse}</span><br>
							-------------------------------------<br>
						<span>남은 냠냠페이 ${tradecp.pbalance}</span>
					</c:when>
					<c:otherwise>
						<span>총 결제금액  ${row.total }</span>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:forEach>
		
		
	
		</div>
	</div>
</body>
</html>