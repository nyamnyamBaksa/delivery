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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style type="text/css">
	.star-rating {
	    display: inline-block;
	    font-size: 0; /* Remove whitespace between inline-block elements */
	}
	
	.star-icon {
	    display: inline-block;
	    width: 20px; /* Adjust the width of each star icon as needed */
	    overflow: hidden;
	}
	
	.star-icon i {
	    color: yellow; /* Star color */
	    clip-path: polygon(0 0, 0 100%, 100% 100%, 100% 0);
	}
	
	.star-icon.partial-star i {
	    clip-path: polygon(0 0, 0 100%, 100% 100%, 100% 0);
	}
</style>

</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<div class="title">
		<div class="titleFont">리뷰관리</div>
	</div>
	<div style="margin-top: 100px;"></div>
		<div class="cart-box-main">
			<div class="container">
			<c:if test="${id eq null || sessionScope.mid eq id }">
				<input class="allCheck" name="allCheck" type="checkbox">&nbsp;<button class="del" style="width: 70px;height: 40px;">삭제</button>
			</c:if>
				<div class="col-lg-12">
					<table class="table">
						<c:forEach items="${list }" var="row">
							<tr>
								<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed; width: 800px;">
									<input class="rowCheck" name="rowCheck" type="checkbox" value="${row.rno }">
									&nbsp;${row.sname }
								</td>
							</tr>
							<tr>
							    <td class="name-pr" style="font-size: large; font-weight: bold; border: 0; border-style: dashed;">
							        <div class="star-rating" data-rating="${row.rscore}">
							            <c:forEach var="i" begin="1" end="5">
							                <span class="star-icon" style="color: yellow;">
							                    <i class="fa fa-star"></i>
							                </span>
							            </c:forEach>
							        </div>
							        &nbsp;${row.rdate}
							    </td>
							</tr>	
							<tr>
								<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed;">${row.rcomment}</td>
							</tr>
							<tr style="border-bottom: 1px solid black;">
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
		$(document).ready(function() {
		    $('.star-rating').each(function() {
		        var rating = parseFloat($(this).data('rating'));
		        var $starIcons = $(this).find('.star-icon');
	
		        $starIcons.each(function(index) {
		            if (index < rating) {
		                $(this).find('i').removeClass('partial-star');
		            } else if (index === Math.floor(rating) && rating % 1 !== 0) {
		                var width = (rating % 1) * 100;
		                alert(width);
		                $(this).find('i').css('clip-path', `polygon(0 0, 0 100%, ${width}% 100%, ${width}% 0)`);
		                $(this).addClass('partial-star');
		            }
		        });
		    });
		});
	</script>
</body>
</html>