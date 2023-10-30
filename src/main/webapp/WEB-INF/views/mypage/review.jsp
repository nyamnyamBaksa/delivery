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
				<input style="float: left;margin-top: 15px; margin-right: 15px;" class="allCheck" name="allCheck" type="checkbox">
				<span class="review"></span> / ${list[0].count }
				&nbsp;<button class="delbtn" style="width: 70px;height: 40px;float:left;">삭제</button>
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
		var confirm = function(msg, title, bno) {
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
			});
		}
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
		
		var check = document.getElementsByName("rowCheck");
		var checkCnt = check.length;
		$('.review').text('0');

		$('input[name="allCheck"]').click(function() {
			var checkList = $('input[name="rowCheck"]');
			for (var i = 0; i < checkList.length; i++) {
				checkList[i].checked = this.checked;
			}
		});

		$('input[name="rowCheck"]').click(function() {
			if ($('input[name="rowCheck"]:checked').length == checkCnt) {
				$('input[name="allCheck"]')[0].checked = true;
			} else {
				$('input[name="allCheck"]')[0].checked = false;
			}
		});

		// 모든 체크박스 요소를 가져오기
		var allCheckCb = document.querySelector('input[name="allCheck"]');
		var rowCheckCb = document
				.querySelectorAll('input[name="rowCheck"]');

		// "찜한 상품" 옆 체크박스의 변경 이벤트 처리
		allCheckCb.addEventListener('change', function() {
			var checkedCount = 0;
			if (allCheckCb.checked) {
				// "찜한 상품" 체크박스가 체크되면 모든 상품 체크박스도 체크
				rowCheckCb.forEach(function(checkbox) {
					checkbox.checked = true;
					checkedCount++;
				});
			} else {
				// "찜한 상품" 체크박스가 해제되면 모든 상품 체크박스도 해제
				rowCheckCb.forEach(function(checkbox) {
					checkbox.checked = false;
				});
			}

			// 총 선택된 상품 개수를 업데이트
			updateTotalCount(checkedCount);
		});

		// 각 상품 옆 체크박스의 변경 이벤트 처리
		rowCheckCb.forEach(function(checkbox) {
			checkbox.addEventListener('change', function() {
				var checkedCount = 0;
				rowCheckCb.forEach(function(checkbox) {
					if (checkbox.checked) {
						checkedCount++;
					}
				});

				// 총 선택된 상품 개수를 업데이트
				updateTotalCount(checkedCount);
			});
		});

		// 총 선택된 상품 개수를 업데이트하는 함수
		function updateTotalCount(count) {
			var zzimTotalElement = document.querySelector('.review');
			zzimTotalElement.textContent = count;
		}

		$('.delbtn').click(function() {
			deleteValue();
		});

		function deleteValue() {
			var valueArr = new Array();
			var list = $('input[name="rowCheck"]');
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) {
					valueArr.push(list[i].value);
				}
			}
			// alert("valueArr: " + valueArr);
			if (valueArr.length == 0) {
				swal("", "선택한 리뷰가 없습니다.", "error");
				return false;
			} else {
				var chk = confirm('정말 삭제하시겠습니까?');
				$.ajax({
					url : './rdelete',
					type : 'post',
					traditional : true,// valueArr=[1, 2, 3] > valueArr=1&valueArr=2&valueArr=3
					data : {
						valueArr : valueArr
					},
					success : function(data) {
						swal("", "리뷰를 삭제했습니다.", "success");
					},
					error : function(error) {
						swal("실패", "작업수행에 실패하였습니다.", "error");
					}
				});
			}
		}
	</script>
</body>
</html>