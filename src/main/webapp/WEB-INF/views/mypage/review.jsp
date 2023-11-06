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
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
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
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
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
				<div class="col-lg-12"><h2>총 리뷰 개수 : <span class="reviewcount">${list[0].count }</span></h2>
					<c:if test="${id eq null || sessionScope.mid eq id }">
						<input style="float: left;margin-top: 15px; margin-right: 15px;" class="allCheck" name="allCheck" type="checkbox">
						<span style="float: left; font-size: larger; font-weight: bolder; margin-top: 5px;margin-right: 5px;"><span class="review"></span> / <span class="reviewcount">${list[0].count }</span></span>
						&nbsp;<button class="delbtn" style="width: 70px;height: 40px;float:left;">삭제</button>
					</c:if>
				</div>
				<div class="col-lg-12">
					<table class="table">
						<c:forEach items="${list }" var="row">
							<tr>
								<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed; width: 800px;">
									<c:if test="${id eq null || sessionScope.mid eq id }">
										<input class="rowCheck rno" name="rowCheck" type="checkbox" value="${row.rno }">
									</c:if>
									&nbsp;${row.sname }
									<span class="star-ratings rdate">&nbsp;${row.rdate}</span>
									<c:if test="${id eq null || sessionScope.mid eq id }">
										<button class="editbtn" style="width: 70px;height: 40px;float:right;margin-left:10px;margin-right:10px;">수정</button>
									</c:if>
								</td>
							</tr>
							<tr>
							    <td class="name-pr" style="border: 0; border-style: dashed; width: 100px;">
							        <div class="star-ratings">
							        	<div class="id" style="display: none;">${id }</div>
							        	<div class="rscore" style="display: none;">${row.rscore }</div>
										<div class="star-ratings-fill space-x-2 text-lg" style="width: ${score}%;">
										    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
										<div class="star-ratings-base space-x-2 text-lg">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
									</div>
							    </td>
							</tr>
							<tr>
								<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed;">${row.rcomment}</td>
							</tr>
							<tr style="border-bottom: 1px solid black;">
								<td class="name-pr" style="border: 0; border-style: dashed;">${row.mnname}</td>
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
		<div class="modal-dialog modal-lg" style="width: 500px;">
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
			},
			function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						url : '/mypage/rdelete',
						type : 'post',
						traditional : true,// valueArr=[1, 2, 3] -> valueArr=1&valueArr=2&valueArr=3
						data : {
							valueArr : valueArr
						},
						dataType: 'json',
						success : function(data) {
							swal("", "리뷰를 삭제했습니다.", "success");
							updateTable(data.list);
						},
						error : function(error) {
							swal("실패", "작업수행에 실패하였습니다.", "error");
						}
					});
				}
			});
		}
		
		var check = document.getElementsByName("rowCheck");// var check = $(".rowCheck");
		var checkCnt = check.length;
		$('.review').text('0');

		$('input[name="allCheck"]').click(function() {
			var checkList = $('input[name="rowCheck"]');
			for (var i = 0; i < checkList.length; i++) {
				checkList[i].checked = this.checked;
			}
		});

		$('input[name="rowCheck"]').click(function() {
			if ($('input[name="rowCheck"]:checked').length == checkCnt) {// $('.rowCheck:checked').length
				$('input[name="allCheck"]')[0].checked = true;
			} else {
				$('input[name="allCheck"]')[0].checked = false;
			}
		});

		// 모든 체크박스 요소를 가져오기
		var allCheckCb = document.querySelector('input[name="allCheck"]');// var allCheckCb = $('input[name="allCheck"]');
		var rowCheckCb = document
				.querySelectorAll('input[name="rowCheck"]');// var rowCheckCb = $('input[name="rowCheck"]');

		// 맨 위의 체크박스의 변경 이벤트 처리
		allCheckCb.addEventListener('change', function() {
			var checkedCount = 0;
			if (allCheckCb.checked) {
				// 맨 위의 체크박스가 체크되면 모든 상품 체크박스도 체크
				rowCheckCb.forEach(function(checkbox) {
					checkbox.checked = true;
					checkedCount++;
				});
			} else {
				// 맨 위의 체크박스가 해제되면 모든 상품 체크박스도 해제
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

		$(document).on("click", ".editbtn, .delbtn", function(){
			var rno = $('.rno').val();
			let $icon = $(this);
			if ($icon.hasClass('editbtn')) {
				updateReview(rno);
			} else {
				deleteValue();
			}
		});
		
		var rdate = $('.rdate').text();
		var today = new Date();
		var rdateDate = new Date(rdate);
		
		var threeDaysAgo = new Date();
	    threeDaysAgo.setDate(today.getDate() - 3);
	    
	    if (rdateDate > threeDaysAgo) {
	    	$('.editbtn').attr("disabled",true);
	    }
		
		function updateReview(rno){
		   
	    	$.ajax({
				url : '/mypage/updateReview',
				type : 'post',
				data : {rno : rno},
				dataType : 'json',
				success : function(data) {
					var modalcontent = $(".modal-content");
					modalcontent.empty();
					
					var newContent = '<div class="modal-body" style="display: flex; justify-content: space-between;background-color: #FF9C41;">' +
		            '<div class="detail" style="margin: 0 auto;">' +
		            '<div class="detail-date-read">' +
		            '<div class="detail-read" style="font-size:larger;font-weight:bolder;text-align:center;"><i class="bi bi-pencil"></i>&nbsp;리뷰 수정&nbsp;(' + data.review.sname + ')</div>' +
		            '</div>' +
		            '</div>' +
		            '</div>' +
		            '<div class="modal-header">' +
		            '<div class="modal-title star-rating space-x-4 mx-auto" style="border: 0; border-style: dashed;">' +
		            '<input type="radio" id="5-stars" name="rating" value="5" />' +
		            '<label for="5-stars" class="star pr-4">★</label>' +
		            '<input type="radio" id="4-stars" name="rating" value="4" />' +
		            '<label for="4-stars" class="star">★</label>' +
		            '<input type="radio" id="3-stars" name="rating" value="3" />' +
		            '<label for="3-stars" class="star">★</label>' +
		            '<input type="radio" id="2-stars" name="rating" value="2" />' +
		            '<label for="2-stars" class="star">★</label>' +
		            '<input type="radio" id="1-star" name="rating" value="1" />' +
		            '<label for="1-star" class="star">★</label>' +
		            '</div></div>' +
		            '<div class="modal-header">' +
		            '<div class="rnoModal" style="display:none;">' + rno + '</div>' +
		            '<input value="' + data.review.rcomment + '" class="modal-title redit" id="exampleModalLabel" style="width:800px;height:100px;font-weight: bolder;">' +
		            '</div>' +
		            '<div class="modal-header" style="margin: 0 auto;">' +
		            '<button class="modal-title editModalbtn" style="width:100px;height:35px;cursor:pointer;">등록하기</button>' +
		            '</div>';
					modalcontent.append(newContent);
					$("#exampleModal").modal("show");
					
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		}
		
		$(document).on("click", ".editModalbtn", function(){
			var rno = $('.rnoModal').text();
			var redit = $('.redit').val();
			var starRating = $('input[name="rating"]:checked').val();
			$.ajax({
				url : '/mypage/editReview',
				type : 'post',
				data : {rno : rno, redit:redit, starRating:starRating},
				dataType : 'json',
				success : function(data) {
					swal("", "리뷰를 수정했습니다.", "success");
					updateTable(data.list);
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});

		function deleteValue() {
			var valueArr = new Array();
			var list = $('input[name="rowCheck"]');
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) {
					valueArr.push(list[i].value);
				}
			}
			
			if (valueArr.length == 0) {
				return false;
			} else {
				var chk = confirm('', '정말 삭제하시겠습니까?', valueArr);
			}
		}
		/* jQuery 1.4 이전의 버전과의 하위 호환성을 유지하거나 특정 서버 요구 사항을 충족시키기 위해 필요한 경우에 유용
		1. 기본적으로 traditional 속성은 false로 설정한다. ex) valueArr[]=1&valueArr[]=2&valueArr[]=3
			이 경우 jQuery는 배열 데이터를 전송할 때, 배열 이름에 대괄호([])를 추가하여 데이터를 직렬화한다.
		2. traditional 속성을 true로 설정하면 jQuery는 배열 데이터를 직렬화할 때 대괄호([])를 사용하지 않으며, 배열 요소를 반복적으로 전송
			ex)valueArr=1&valueArr=2&valueArr=3 */
			
		function updateTable(data){
				var newTableHTML = '<table class="table">';
			    
			    for (var i = 0; i < data.length; i++) {
			        var row = data[i];
			        newTableHTML += '<tr>';
			        newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed; width: 800px;">';
			        newTableHTML += '<input class="rowCheck rno" name="rowCheck" type="checkbox" value="' + row.rno + '">';
			        newTableHTML += '&nbsp;' + row.sname;
			        newTableHTML += '<span class="star-ratings rdate">&nbsp;' + row.rdate + '</span>';
			        newTableHTML += '<button class="editbtn" style="width: 70px; height: 40px; float:right; margin-left:10px; margin-right:10px;">수정</button>';
			        newTableHTML += '</td>';
			        newTableHTML += '</tr>';
			        newTableHTML += '<tr>';
			        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 100px;">';
			        newTableHTML += '<div class="star-ratings">';
			        newTableHTML += '<div class="id" style="display: none;">' + row.id + '</div>';
			        newTableHTML += '<div class="rscore" style="display: none;">' + row.rscore + '</div>';
			        newTableHTML += '<div class="star-ratings-fill space-x-2 text-lg" style="width: ' + (row.rscore * 20) + '%;">';
			        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
			        newTableHTML += '</div>';
			        newTableHTML += '<div class="star-ratings-base space-x-2 text-lg">';
			        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
			        newTableHTML += '</div>';
			        newTableHTML += '</div>';
			        newTableHTML += '</td>';
			        newTableHTML += '</tr>';
			        newTableHTML += '<tr>';
			        newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed;">' + row.rcomment + '</td>';
			        newTableHTML += '</tr>';
			        newTableHTML += '<tr style="border-bottom: 1px solid black;">';
			        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed;">' + row.mnname + '</td>';
			        newTableHTML += '</tr>';
			    }

			    newTableHTML += '</table>';
			 	// 테이블 업데이트
			    $('.table').html(newTableHTML);
			 	
			 	// 리뷰 개수 업데이트
			    $('.reviewcount').text(data[0].count);
			    $('.review').text('0');
		}
	</script>
</body>
</html>