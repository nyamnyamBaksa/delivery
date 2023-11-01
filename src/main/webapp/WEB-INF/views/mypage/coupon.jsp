<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
	<link rel="stylesheet" href="/css/mypage-diary.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/custom.css">
    <!-- sweetalert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="title">
		<div class="titleFont">쿠폰함</div>
	</div>
	<div style="margin-top: 100px;"></div>
	<c:if test="${sessionScope.mid ne null}">
		<div class="cart-box-main">
			<div class="container">
				<div class="col-lg-12">
				<div class="count"><h3>보유쿠폰 ${list[0].count }장</h3></div><br>
					<table class="table">
						<c:forEach items="${list }" var="row">
							<tr style="border-top: 3px solid #EB5757;">
								<td class="name-pr" style="font-size: large; font-weight: bold;border: 0; border-style: dashed; width: 800px;">${row.cpid }</td>
							</tr>
							<tr style="margin-top:30px;height: 100px;border-bottom: 3px solid #EB5757;">
								<td class="name-pr" style="border: 0; border-style: dashed; width: 800px;"><h1 style="font-size: larger; font-weight: bolder;">${row.cpname }&nbsp;${row.cpprice }원 할인 쿠폰</h1></td>
								<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">사용기한 : ${row.cpedate }</td>
								<td class="bbno" style="display: none;">${row.cpno }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #E6E6FA;">
					<h5 class="modal-title" id="exampleModalLabel">본문제목</h5>
				</div>
				<div class="modal-body">
					<div class="detail">
						<div class="detail-date-read">    		
							<div class="detail-date">날짜</div>     		
							<div class="detail-read">조회수</div>	      		
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
	<script type="text/javascript">

	</script>
</body>
</html>