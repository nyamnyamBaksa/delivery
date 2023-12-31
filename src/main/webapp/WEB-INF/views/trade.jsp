<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link href="css/trade.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
</head>
<body>

<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 3px 3px 3px gray;">
    <i class="fa-solid fa-arrow-left fa-xl" style="color: black; font-size: 2rem;  margin-top: 30px;"></i>
</a>
	<h1>주문내역</h1>
	<hr class="hr">
	
	<c:choose>
		<c:when test="${sessionScope.mname ne null }">
			<c:choose>
				<c:when test="${!empty tradegroup}">
					<form action="./trade" method="get">
						<div class="search-container">
							<select name="searchN" class="searchN">
								<option value="sname">가게명</option>
								<option value="mnname">메뉴명</option>
							</select> <input name="search" class="search" type="text"
								placeholder="주문했던 메뉴와 가게를 검색해 보세요">
							<button type="submit" class="searchBtn">
							<i class="fa-solid fa-magnifying-glass fa-2xl" style="color: #ffffff;" alt="검색"></i>
								<!--  <img src="img/searchBtn.png" alt="검색">-->
							</button>
						</div>
					</form>

                <c:forEach items="${tradegroup}" var="row" varStatus="loop">
                    <c:if test="${loop.first || row.tgroup ne tradegroup[loop.index - 1].tgroup}">
                        <div class="tradeBox">
                  
                            <span class="tradedate">${row.tdate} 배달완료(${row.tgroup})</span>
                            <img alt="샘플이미지" src="/img/sample.png" class="sampleimg">
                            <a href="food/storedetail?sno=${row.sno }">
                                <div class="Sname">${row.sname} > </div>
                            </a> 
                            <a href="tradedetail?tgroup=${row.tgroup}">
                                <button class="tradeDetailBtn">
                                    <span class="tradeDetailText">주문상세</span>
                                </button>
                            </a>
						<c:choose>
							<c:when test="${row.count == 1}">
								<button class="reviewBtn">
                            		<span class="reviewText">작성완료</span>
                        		</button>
							</c:when>
							<c:otherwise>
								<a href="reviewwrite?sno=${row.sno}">
	                            <button class="reviewBtn">
	                                <span class="reviewText">리뷰쓰기</span>
	                            </button>
	                       		</a>
							</c:otherwise>
						</c:choose>
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
                <span class="tradenull"> 주문내역이 없습니다.</span>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <li>로그인을 해주세요.</li>
        <a href="login">
        	<button>로그인하러 가기</button>
        </a>
    </c:otherwise>
</c:choose>

</body>
</html>