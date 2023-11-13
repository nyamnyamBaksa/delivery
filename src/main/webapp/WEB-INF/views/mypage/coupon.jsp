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
	<link rel="stylesheet" href="/css/sweetalert.min.css" />
	<!-- 아이콘 -->
	<link rel="stylesheet" href="/css/bootstrap-icons.css">
	<style type="text/css">
		.col-lg-12{
			position: absolute;
			top: 15%;
			left: 7%;
			right: 7%;
			bottom: 50%;
		}
		
		h2, h1{
			font-size: 40px;
			font-weight: bolder;
			color: black;
		}
		
		td{
			font-size: 30px;
			vertical-align: middle;
		}
	</style>
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
	<div class="title">
		<div class="titleFont">쿠폰함</div>
	</div>
	<div style="margin-top: 150px;"></div>
		<div class="cart-box-main">
			<div class="container">
				<div class="col-lg-12">
				<c:if test="${list[0].count eq null }">
					<h1 style="text-align: center;">보유쿠폰이 없습니다.</h1>
				</c:if>
				<c:if test="${list[0].count ne null }">
					<div class="count"><h2>보유쿠폰 ${list[0].count }장</h2></div><br>
					<table class="table" style="border-left: 3px solid #EB5757;border-right: 3px solid #EB5757;">
						<c:forEach items="${list }" var="row">
							<tr style="border-top: 3px solid #EB5757;height: 30px;">
								<td class="name-pr" style="font-weight: bold;border: 0; border-style: dashed; width: 800px;">${row.cpid }</td>
							</tr>
							<tr style="height: 100px;border-bottom: 3px solid #EB5757;">
								<td class="name-pr" style="border: 0; border-style: dashed; width: 700px;"><h1 style="font-weight: bolder;">${row.cpname }&nbsp;${row.cpprice }원 할인 쿠폰</h1></td>
								<td class="quantity-box" style="border: 0; border-style: dashed; width: 500px;">사용기한 : ${row.cpedate }</td>
								<td class="bbno" style="display: none;">${row.cpno }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
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
	<script src="/js/sweetalert.min.js"></script>
    
	<script type="text/javascript">

	</script>
</body>
</html>