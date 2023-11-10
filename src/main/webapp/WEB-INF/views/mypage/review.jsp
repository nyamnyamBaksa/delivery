<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
	<div class="title">
		<div class="titleFont">리뷰관리</div>
	</div>
	<div style="margin-top: 20px;"></div>
		<div class="cart-box-main">
		<c:if test="${list[0].count eq null}">
			<div class="container">
				<h1 style="text-align: center;">리뷰가 없습니다.</h1>
			</div>
		</c:if>
		<c:if test="${list[0].count ne null}">
			<div id="mid" style="display: none;">${sessionScope.mid }</div>
			<div id="id" style="display: none;">${id }</div>
			<div class="container">
				<div class="col-lg-12"><h2>총 리뷰 개수 : <span class="reviewcount" id="reviewcount">${list[0].count }</span></h2>
					<c:if test="${id eq null || sessionScope.mid eq id }">
						<table style="margin-bottom: 10px;">
							<tr>
								<td>
									<div class="custom-control custom-checkbox">
					                    <input type="checkbox" class="custom-control-input allCheck" name="allCheck" id="save-info">
					                    <label class="custom-control-label" for="save-info"></label>
				                    </div>
								</td>
								<td>
									<span style="font-size: larger; font-weight: bolder;margin-right: 5px;"><span class="review"></span> / <span class="reviewcount">${list[0].count }</span></span>
								</td>
								<td>
									<button class="delbtn" style="width: 70px;height: 40px;">삭제</button>
								</td>
							</tr>
						</table>
					</c:if>
				</div>
				<div class="col-lg-12">
					<table class="table">
						 <c:forEach var="row" items="${list}" varStatus="loop">
					        <tr style="border-top: 1px solid #c0c0c0;">
					            <td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 800px;">
					
					                <div class="custom-control custom-checkbox" style="display: inline-block;">
					                    <input type="checkbox" class="custom-control-input rowCheck rno" name="rowCheck" id="${loop.index}" value="${row.rno}">
					                    <label class="custom-control-label" for="${loop.index}"></label>
					                </div>
					
					                &nbsp;<a href="/food/storedetail?sno=${row.sno}">${row.sname}</a>
					                <span class="star-ratings rdate">&nbsp;${row.rdate}</span>
					                <button class="editbtn" style="width: 70px; height: 40px; float:right; margin-left:10px; margin-right:10px;">수정</button>
					            </td>
					        </tr>
					        <tr>
					            <td class="name-pr" style="border: 0; border-style: dashed; width: 100px;">
					                <div class="star-ratings">
					                    <div class="rscore" style="display: none;">${row.rscore}</div>
					                    <div class="star-ratings-fill space-x-2 text-lg" style="width: ${(row.rscore * 20)}%;">
					                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					                    </div>
					                    <div class="star-ratings-base space-x-2 text-lg">
					                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					                    </div>
					                </div>
					            </td>
					        </tr>
					        <tr>
					            <td class="name-pr" style="border: 0; border-style: dashed; font-size: larger; font-weight: bolder;">${row.rcomment}</td>
					        </tr>
					        <tr style="border-bottom: 1px solid #c0c0c0;">
					            <td class="name-pr mnname" style="border: 0; border-style: dashed; width: 200px;vertical-align: middle;">
					                <c:set var="menuNames" value="" />
					                <c:forEach var="mn" items="${mnlist}" varStatus="loop">
					                    <c:if test="${mn.rno eq row.rno}">
						                    <c:choose>
					                            <c:when test="${not empty menuNames}">
					                                <c:set var="menuNames" value="${menuNames}, " />
					                            </c:when>
					                            <c:otherwise>
					                                <c:set var="menuNames" value="${menuNames}" />
					                            </c:otherwise>
					                        </c:choose>
				                        <c:set var="menuNames" value="${menuNames}${mn.mnname}" />
				                        </c:if>
					                </c:forEach>
					                ${menuNames}
					            </td>
					        </tr>
					    </c:forEach>
					</table>
					<button style="margin: 0 auto;" class="morebtn">+ 더보기</button>
				</div>
			</div>
			</c:if>
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
		
    	
    
   		// 총 개수
   		var reviewcount = $('#reviewcount').text();
   		// 조회 인덱스
   		var offset = 0;	// 인덱스 초기값
   		var count = 7;	// 7개씩 로딩
   		
  		// 더보기 버튼 삭제
		if(offset + count >= reviewcount){
			$('.morebtn').remove();
		}
    
   		// 더보기 클릭시
    	$(document).on("click", ".morebtn", function(){
    		offset += count;
   			readOldNotify(offset);
    	});
    			
   		// 더보기 실행함수
   		function readOldNotify(offset){
   			var id = $("#id").text();
   			if(id == ''){
   				id = $('#mid').text();
   			}
   			let endIndex = offset+count-1;	// endIndex설정
   			$.ajax({
   				url: "/mypage/moreReview",
   				type: "post",
   				async: "true",
   				dataType: "json",
   				data: {
   					id: id,
   					offset: offset,
   					endIndex: endIndex
   				},
   				success: function (data) {
   					var newTableHTML = '';
   					// 중복된 rno 값을 가진 데이터를 그룹화하기 위한 객체 생성
   				    var groupedData = {};

   				    // 데이터 그룹화
   				    $.each(data.list, function(index, row) {
   				        var rno = row.rno;
   				        if (!groupedData[rno]) {
   				            groupedData[rno] = {
   				            	sno: row.sno,
   				            	sname: row.sname,
   				                rdate: row.rdate,
   				                rcomment: row.rcomment,
   				                rno: rno,
   				                mnnameList: [],
   				                rsocre: row.rsocre,
   				                index:index
   				            };
   				        }
   				        $.each(data.mnlist, function(index2, row2) {
   					        if (groupedData[rno].rno == row2.rno) {
   					            groupedData[rno].mnnameList.push(row2.mnname);
   					        }
   				        });
   				    });

   				 	// 그룹화된 데이터로 테이블 생성
   				    $.each(groupedData, function(rno, group) {
   				            newTableHTML += '<tr style="border-top: 1px solid #c0c0c0;">';
   				            newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 800px;">';

   			                newTableHTML += '<div class="custom-control custom-checkbox" style="display: inline-block;"> <input type="checkbox" class="custom-control-input rowCheck rno" name="rowCheck" id="' + group.index + '" value="' + group.rno + '"><label class="custom-control-label" for="' + group.index + '"></label></div>';
   			                newTableHTML += '&nbsp;<a href="/food/storedetail?sno=' + group.sno + '">' + group.sname + '</a>';
   			                newTableHTML += '<span class="star-ratings rdate">&nbsp;' + group.rdate + '</span>';
   			                newTableHTML += '<button class="editbtn" style="width: 70px; height: 40px; float:right; margin-left:10px; margin-right:10px;">수정</button>';
   				            newTableHTML += '</td>';
   				            newTableHTML += '</tr>';

   				            newTableHTML += '<tr>';
   				            newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 100px;">';
   				            newTableHTML += '<div class="star-ratings">';
   				            newTableHTML += '<div class="rscore" style="display: none;">' + group.rscore + '</div>';
   				            newTableHTML += '<div class="star-ratings-fill space-x-2 text-lg" style="width: ' + (group.rscore * 20) + '%;">';
   				            newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
   				            newTableHTML += '</div>';
   				            newTableHTML += '<div class="star-ratings-base space-x-2 text-lg">';
   				            newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
   				            newTableHTML += '</div>';
   				            newTableHTML += '</div>';
   				            newTableHTML += '</td>';
   				            newTableHTML += '</tr>';
   				            newTableHTML += '<tr>';
   				            newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed;">' + group.rcomment + '</td>';
   				            newTableHTML += '</tr>';
   				            newTableHTML += '<tr style="border-bottom: 1px solid #c0c0c0;"><td class="name-pr mnname" style="font-size: large; font-weight: bold; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">';
   					        newTableHTML += group.mnnameList.join(', ');
   					        newTableHTML += '</td></tr>';
   					    });

	   			    newTableHTML += '';
   				 	// 테이블 업데이트
   					$(newTableHTML).appendTo($(".table")).slideDown();
   				 	
   				 	editok();
   				 	
   					// 더보기 버튼 삭제
   					if(offset + count >= reviewcount){
   						$('.morebtn').remove();
   					}
   				 	
   				}
   			});
   		}
    	
    	
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
					var review = $('.review').text();
					if(offset > 0){
						offset = offset - review;
						for(var i = 1; offset <= 7 * i && offset > 7 * (i - 1); i++){
							offset = i - 1;
						}
					}
					$.ajax({
						url : '/mypage/rdelete',
						type : 'post',
						traditional : true,// valueArr=[1, 2, 3] -> valueArr=1&valueArr=2&valueArr=3
						data : {
							valueArr : valueArr,offset: offset
						},
						dataType: 'json',
						success : function(data) {
							swal("", "리뷰를 삭제했습니다.", "success");
							updateTable(data);
							var count = data.list[0].count;
							$('.reviewcount').text(count);
							$('.review').text('0');
							
							var check = document.getElementsByName("rowCheck");// var check = $(".rowCheck");
							var checkCnt = check.length;

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

							// allCheck 체크박스의 변경 이벤트 처리
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

							// rowCheck 체크박스의 변경 이벤트 처리
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
							// 더보기 버튼 삭제
		   					if(offset + count >= reviewcount){
		   						$('.morebtn').remove();
		   					}
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
			var rno = $(this).closest('tr').find('.rno').val();
			let $icon = $(this);
			if ($icon.hasClass('editbtn')) {
				updateReview(rno);
			} else {
				deleteValue();
			}
		});
		
		// 3일 지난 리뷰
		var today = new Date();
		var threeDaysAgo = new Date();
		threeDaysAgo.setDate(today.getDate() - 3);
		editok();
		function editok(){
			$('.rdate').each(function() {
			    var rdate = $(this).text();
			    var rdateDate = new Date(rdate);
			    if (rdateDate < threeDaysAgo) {
			        $(this).closest('tr').find('.editbtn').remove();
			    }
			});
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
			if(starRating == null){
				starRating = 0;
			}
			$.ajax({
				url : '/mypage/editReview',
				type : 'post',
				data : {rno : rno, redit:redit, starRating:starRating,offset: offset},
				dataType : 'json',
				success : function(data) {
					swal("", "리뷰를 수정했습니다.", "success");
					updateTable(data);
					$("#exampleModal").modal("hide");
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
		
		function updateTable(data) {
		    var newTableHTML = '<table class="table">';
		 	// 중복된 rno 값을 가진 데이터를 그룹화하기 위한 객체 생성
		    var groupedData = {};

		    // 데이터 그룹화
		    $.each(data.list, function(index, row) {
		        var rno = row.rno;
		        if (!groupedData[rno]) {
		            groupedData[rno] = {
		            	sno: row.sno,
		            	sname: row.sname,
		                rdate: row.rdate,
		                rcomment: row.rcomment,
		                rno: rno,
		                mnnameList: [],
		                rsocre: row.rsocre,
		                index:index
		            };
		        }
		        $.each(data.mnlist, function(index2, row2) {
			        if (groupedData[rno].rno == row2.rno) {
			            groupedData[rno].mnnameList.push(row2.mnname);
			        }
		        });
		    });

		 	// 그룹화된 데이터로 테이블 생성
		    $.each(groupedData, function(rno, group) {
		            newTableHTML += '<tr style="border-top: 1px solid #c0c0c0;">';
		            newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 800px;">';

	                newTableHTML += '<div class="custom-control custom-checkbox" style="display: inline-block;"> <input type="checkbox" class="custom-control-input rowCheck rno" name="rowCheck" id="' + group.index + '" value="' + group.rno + '"><label class="custom-control-label" for="' + group.index + '"></label></div>';
	                newTableHTML += '&nbsp;<a href="/food/storedetail?sno=' + group.sno + '">' + group.sname + '</a>';
	                newTableHTML += '<span class="star-ratings rdate">&nbsp;' + group.rdate + '</span>';
	                newTableHTML += '<button class="editbtn" style="width: 70px; height: 40px; float:right; margin-left:10px; margin-right:10px;">수정</button>';
		            newTableHTML += '</td>';
		            newTableHTML += '</tr>';

		            newTableHTML += '<tr>';
		            newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 100px;">';
		            newTableHTML += '<div class="star-ratings">';
		            newTableHTML += '<div class="rscore" style="display: none;">' + group.rscore + '</div>';
		            newTableHTML += '<div class="star-ratings-fill space-x-2 text-lg" style="width: ' + (group.rscore * 20) + '%;">';
		            newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
		            newTableHTML += '</div>';
		            newTableHTML += '<div class="star-ratings-base space-x-2 text-lg">';
		            newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
		            newTableHTML += '</div>';
		            newTableHTML += '</div>';
		            newTableHTML += '</td>';
		            newTableHTML += '</tr>';
		            newTableHTML += '<tr>';
		            newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed;">' + group.rcomment + '</td>';
		            newTableHTML += '</tr>';
		            newTableHTML += '<tr style="border-bottom: 1px solid #c0c0c0;"><td class="name-pr mnname" style="font-size: large; font-weight: bold; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">';
			        newTableHTML += group.mnnameList.join(', ');
			        newTableHTML += '</td></tr>';
			    });

		    newTableHTML += '</table>';

		    // 테이블 업데이트
		    $('.table').html(newTableHTML);

		    editok();
		}

	</script>
</body>
</html>