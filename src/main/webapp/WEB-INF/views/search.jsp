<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
<link rel="stylesheet" href="/css/mypage-pay.css">
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
<style>
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}

.hov-in {
	font-size: larger;
	font-weight: bolder;
	background-color: rgba(255, 156, 65, 0.5);
}

.hover:hover {
	color: black;
}

.search {
	position: absolute;
	left: 20%;
	right: 25%;
	top: 9.77%;
	bottom: 85.55%;
	background: #EB5757;
	border: 1px solid #E8E8E8;
	border-radius: 50px;
	padding-left: 10px;
	color: white;
	font-size: larger;
	font-weight: bolder;
}

.search::placeholder {
	padding-left: 10px;
	color: white;
	font-size: larger;
	font-weight: bolder;
}

.fa-search{
	position: absolute;
	left: 73%;
	right: 20%;
	top: 11%;
	bottom: 85.55%;
	cursor: pointer;
}
</style>
</head>
<body>
	<div style="margin-top: 50px;"></div>
	<div class="cart-box-main">
		<div class="container">
			<form action="/search" method="get" class="row">
				<input type="text" class="search" name="search" required="required"
					placeholder="검색어를 입력해주세요.">
				<button class="search-btn" type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
			<div class="col-lg-12">
				<table class="table">
				</table>
			</div>
			<c:if test="${sessionScope.mid ne null}">
				'${sessionScope.mname }'님이 최근에 드신 메뉴 별 추천 맛집
					<div class="instagram-box">
					<div class="main-instagram owl-carousel owl-theme">
						<c:forEach items="${list}" var="row">
							<div class="item">
								<div class="ins-inner-box">
									<img src="${row.simg }"
										onerror="this.src='/img/profileImg/20231026101912스크린샷%202023-10-18%20171343.png'"
										alt="" />
									<div class="hov-in">
										<a class="hover" href="#">${row.sname }</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<c:if test="${sessionScope.mid eq null}">
				주문량 많은 추천 맛집
					<div class="instagram-box">
					<div class="main-instagram owl-carousel owl-theme">
						<c:forEach items="${rlist}" var="row">
							<div class="item">
								<div class="ins-inner-box">
									<img src="${row.simg }"
										onerror="this.src='/img/profileImg/20231026101912스크린샷%202023-10-18%20171343.png'"
										alt="" />
									<div class="hov-in">
										<a class="hover" href="#">${row.sname }</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/inewsticker.js"></script>
	<script src="js/bootsnav.js."></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>
	<script src="/js/sweetalert.min.js"></script>

	<script type="text/javascript">
		$('.rscore').each(function() {
			var scoreElement = $(this);
			var score = parseFloat(scoreElement.text());
			score = score * 20;

			var starRatings = scoreElement.closest('.star-ratings');

			starRatings.find('.rscore').text(score);
			var starRatingsFill = starRatings.find('.star-ratings-fill');
			starRatingsFill.css('width', score + '%');
		});

		var confirm = function(msg, title, valueArr) {
			swal({
				title : title,
				text : msg,
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "예",
				cancelButtonText : "아니오",
				closeOnConfirm : false,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						url : '/wdelete',
						type : 'post',
						traditional : true,// valueArr=[1, 2, 3] -> valueArr=1&valueArr=2&valueArr=3
						data : {
							valueArr : valueArr
						},
						dataType : 'json',
						success : function(data) {
							swal("", "찜을 삭제했습니다.", "success");
							updateTable(data);
						},
						error : function(error) {
							swal("실패", "작업수행에 실패하였습니다.", "error");
						}
					});
				}
			});
		}
	</script>
</body>
</html>