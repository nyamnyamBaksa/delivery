<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
	<link rel="stylesheet" href="../css/mypage-diary.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="../css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/custom.css">
</head>
<body>
	<div class="title">
		<div class="titleFont">냠냠 다이어리</div>
	</div>
	<div style="margin-top: 100px;"></div>
	<c:if test="${sessionScope.mid ne null}">
		<div class="cart-box-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="table-main table-responsive">
							<table class="table">
								<c:forEach items="${list }" var="row">
									<tr>
										<td class="name-pr">${row.bcontent }</td>
										<td class="quantity-box">${row.bdate }</td>
										<td class="total-pr">
											<p>
												<img src="/img/profileImg/like.png" onclick="">${row.blike }</p>
										</td>
										<td class="remove-pr"><a href="#"> <i
												class="fas fa-times"></i>
										</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width: 500px;">
			<div class="modal-content"">
				<div class="modal-header" style="color: blue;">
					<!-- 프로필 이미지 업로드 폼 -->
					<form id="profileImageForm" enctype="multipart/form-data">
						<input type="file" name="profileImage" id="profileImageInput"
							accept="image/*" style="display: none">
						<h5 class="modal-title ok" id="exampleModalLabel">
							<label for="profileImageInput" style="cursor: pointer;">
								프로필 사진 바꾸기 </label>
						</h5>
					</form>
				</div>
				<div class="modal-header" style="color: red;">
					<h5 class="modal-title notok" id="exampleModalLabel"
						style="cursor: pointer;">취소</h5>
				</div>
			</div>
		</div>
	</div>
	<!-- ALL JS FILES -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
    
	<script type="text/javascript">
		
	</script>
</body>
</html>