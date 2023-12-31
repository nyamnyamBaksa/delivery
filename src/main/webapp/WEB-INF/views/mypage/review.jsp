<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
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
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	<!-- 폰트 -->
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
* {
	font-family: 'NanumSquareNeo';	
}

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

.col-lg-12{
	position: absolute;
	top: 24%;
	left: 3%;
	right: 3%;
	bottom: 35%;
}

.col-lg-13{
	position: absolute;
	top: 12%;
	left: 10%;
	right: 3%;
}

h2, h1{
	font-size: 20px;
	font-weight: bold;
	color: black;
}

td, .rdate, .sname{
	font-size: 20px;
	vertical-align: middle;
}

.rcomment{
	width: 450px;
}

.height{
	height: 150px;
}

.sname{
	font-weight: bolder;
}

.custom-checkbox{
	vertical-align: middle;
	margin-top: 12.5px;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<a href="javascript:history.back()" style="position: relative; z-index: 1;">
    	<i class="fa-solid fa-arrow-left fa-xl" style="color: black;font-size: 2rem; margin-left: 10px; margin-top: 20px;"></i>
	</a>
	<div class="title">
		<div class="titleFont">리뷰관리</div>
	</div>
		<div class="cart-box-main">
		<c:if test="${list[0].count eq null}">
			<div class="container">
				<div class="col-lg-13">
					<h1 style="text-align: center;">리뷰가 없습니다.</h1>
				</div>
			</div>
		</c:if>
		<c:if test="${list[0].count ne null}">
			<div id="mid" style="display: none;">${sessionScope.mid }</div>
			<div id="id" style="display: none;">${id }</div>
			<div class="container">
				<div class="col-lg-13"><h2>총 리뷰 개수 : <span class="reviewcount" id="reviewcount">${list[0].count }</span></h2>
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
									<button class="delbtn">삭제</button>
								</td>
							</tr>
						</table>
					</c:if>
				</div>
				<div class="col-lg-12">
					<table class="table">
						 <c:forEach var="row" items="${list}" varStatus="loop">
					        <tr style="border-top: 1px solid #c0c0c0;">
					            <td colspan='2' class="name-pr" style="font-weight: bolder; border: 0; border-style: dashed; width: 500px;">
									<c:if test="${id eq null || sessionScope.mid eq id}">
					                <div class="custom-control custom-checkbox" style="display: inline-block;">
					                    <input type="checkbox" class="custom-control-input rowCheck rno" name="rowCheck" id="${loop.index}" value="${row.rno}">
					                    <label class="custom-control-label" for="${loop.index}"></label>
					                </div>
									</c:if>
					                &nbsp;<a href="/food/storedetail?sno=${row.sno}"><span class="sname">${row.sname}</span></a>
			                	</td>
			                </tr>
			                <tr>
			                	<td colspan='2' class="name-pr" style="border: 0; border-style: dashed; width: 500px;">
					                <span class="rdate">${row.rdate}</span>
					                <c:if test="${id eq null || sessionScope.mid eq id }">
					                	<button class="editbtn" style="float:right;">수정</button>
					            	</c:if>
					            </td>
					        </tr>
					        <tr>
					            <td class="name-pr" style="border: 0; border-style: dashed; width: 70px;">
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
					            <td class="name-pr rcomment  <c:if test="${row.rphoto != null || row.rphoto == ''}">height</c:if>" style="border: 0; border-style: dashed;font-weight: bolder;">${row.rcomment}</td>
					            <c:if test="${row.rphoto != null || row.rphoto == ''}">
						            <td rowspan='2' class="name-pr" style="border: 0; border-style: dashed;">
						            	<img class="rphoto modal-title" src="/img/review/${row.rphoto}" style="width:150px;height:150px;border-radius: 70px;margin: 0 auto">
						            </td>
					            </c:if>
					        </tr>
					        <tr style="border-bottom: 1px solid #c0c0c0;">
					            <td colspan='2' class="name-pr mnname" style="font-size:17px;border: 0; border-style: dashed; width: 100px;vertical-align: middle;">
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
					                <span class="mnname">${menuNames}</span>
					            </td>
					        </tr>
					    </c:forEach>
					</table>
					<button style="margin: 0 auto;" class="morebtn">+ 더보기</button>
					<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><i class="fa fa-chevron-up"></i></div>
						</a>
					</div>
				</div>
			</div>
			</c:if>
		</div>
	</c:if>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width: 400px;">
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
	<script src="/js/mcore.extends.js"></script>
	<script src="/js/mcore.min.js"></script>
	<script src="/js/wnInterface.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="js/scrollax.min.js"></script>
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
   				             	rscore: row.rscore,
   				                rphoto: row.rphoto,
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
	   					    newTableHTML += '<td colspan="2" class="name-pr" style="font-weight: bolder; border: 0; border-style: dashed; width: 500px;">';
	   					    if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
	   					        newTableHTML += '<div class="custom-control custom-checkbox" style="display: inline-block;"> <input type="checkbox" class="custom-control-input rowCheck rno" name="rowCheck" id="' + group.index + '" value="' + group.rno + '"><label class="custom-control-label" for="' + group.index + '"></label></div>';
	   					    }
	   					    newTableHTML += '&nbsp;<a href="/food/storedetail?sno=' + group.sno + '"><span class="sname">' + group.sname + '</span></a></td></tr>';
	   					    newTableHTML += ' <tr><td colspan="2" class="name-pr" style="border: 0; border-style: dashed; width: 500px;"><span class="rdate">' + group.rdate + '</span>';
	   					    if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
	   					        newTableHTML += '<button class="editbtn" style="float:right;">수정</button>';
	   					    }
	   					    newTableHTML += '</td>';
	   					    newTableHTML += '</tr>';
	   					
	   					    newTableHTML += '<tr>';
	   					    newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 500px;">';
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
	   					    newTableHTML += '<td class="name-pr rcomment" style="border: 0; border-style: dashed; font-weight: bolder;">' + group.rcomment + '</td>';
	   					    if (group.rphoto != null || group.rphoto == ''){
	   					        newTableHTML += '<td rowspan="2" class="name-pr" style="border: 0; border-style: dashed;"><img class="rphoto modal-title" src="/img/review/' + group.rphoto + '" style="width:150px;height:150px;border-radius: 70px;margin: 0 auto"></td>';
	   					    }
	   					    newTableHTML += '</tr>';
	   					    newTableHTML += '<tr style="border-bottom: 1px solid #c0c0c0;"><td colspan="2" class="name-pr mnname" style="font-size: 17px; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">';
	   					    newTableHTML += group.mnnameList.join(', ');
	   					    newTableHTML += '</td></tr>';
	   					    
	   					 	var element = document.querySelector('.rcomment'); // 클래스가 'rcomment'인 요소를 선택
		   					if (group.rphoto != null || group.rphoto == '') {
		   					    element.classList.add('height'); // 'height' 클래스를 추가
		   					}
   					    });

	   			    newTableHTML += '';
   				 	// 테이블 업데이트
   					$(newTableHTML).appendTo($(".table")).slideDown();
   				 	
   				 	
   					if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
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
				    }
   				 	
   				 	editok();
   				 	
   					// 더보기 버튼 삭제
   					if(offset + 7 >= reviewcount){
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
					reviewcount -=  review;
					if((offset + 7 >= reviewcount && offset < reviewcount) || (offset + 7 < reviewcount && offset < reviewcount)){
						count = offset + 7;
					} else if(offset >= reviewcount){
						count = offset;
					}
					$.ajax({
						url : '/mypage/rdelete',
						type : 'post',
						traditional : true,// valueArr=[1, 2, 3] -> valueArr=1&valueArr=2&valueArr=3
						data : {
							valueArr : valueArr,offset: offset, count:count
						},
						dataType: 'json',
						success : function(data) {
							offset = count - 7;
							count = 7;
							swal("", "리뷰를 삭제했습니다.", "success");
							updateTable(data);
							reviewcount = data.list[0].count;
							$('.reviewcount').text(reviewcount);
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
			var rno = $(this).closest('tr').prev().find('.rno').val();
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
					
					var rphotoElement = '';

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
		            '<div class="imgSrc" style="display:none;"></div>' +
		            '<input value="' + data.review.rcomment + '" class="modal-title redit" id="exampleModalLabel" style="width:800px;height:100px;font-weight: bolder;">' +
		            '</div>' +
		            '<div class="modal-header">' +
		            '<img id="rphoto" class="modal-title" src="/img/review/' + data.review.rphoto + '" onerror="this.src=\'/img/profileImg/camera.png\'" style="width:150px;height:150px;border-radius: 70px;margin: 0 auto">' +
		            '</div>' +
		            '<div class="modal-header" style="margin: 0 auto;">' +
		            '<button class="modal-title editModalbtn">등록하기</button>' +
		            '</div>';
					modalcontent.append(newContent);
					$("#exampleModal").modal("show");
					
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		}
		
		const M = window.M;
		$(document).on("click", "#rphoto", function() {
			M.media.picker({
				  mode: "SINGLE",
				  media: "PHOTO",
				  column: 3,
				  callback: function( status, result ) {
				    var fileList = [], fileCont = {};
				    fileCont.name = "file";
				    fileCont.content = result.path;
				    fileCont.type = 'FILE';
				    fileList.push(fileCont);
				    M.net.http.upload({
				      url: "http://172.30.1.10/mypage/updateReviewImg",
				      header: {},
				      params: {index : "3"},
				      body: fileList,
				      encoding : "UTF-8",
				      finish : function(code, header, body, status, error) {
				        if (status == 'SUCCESS') {
				         	// 이미지를 업데이트
				         	var jsonObject = JSON.parse(body);
				         	var reviewImg = jsonObject.reviewImg;
                            var imgSrc = $('.imgSrc').text(reviewImg); 
			                var newImageSrc = '/img/review/' + reviewImg;
                            $("#rphoto").attr('src', newImageSrc);
			                swal.close();
				        } else{
				            // M.pop.alert( status + " / " + error );
				        }
				     }
				   });
			  	}
			});
		});
		
		$(document).on("click", ".editModalbtn", function(){
			var rno = $('.rnoModal').text();
			var redit = $('.redit').val();
			var starRating = $('input[name="rating"]:checked').val();
			var rphoto = $(".imgSrc").text();
			if(starRating == null){
				starRating = 0;
			}
			$.ajax({
				url : '/mypage/editReview',
				type : 'post',
				data : {count:count, rno : rno, redit:redit, starRating:starRating,offset: offset, rphoto:rphoto},
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
		                rscore: row.rscore,
		                rphoto: row.rphoto,
		                index:index
		            };
		        }
		        $.each(data.mnlist, function(index2, row2) {
			        if (groupedData[rno].rno == row2.rno) {
			            groupedData[rno].mnnameList.push(row2.mnname);
			        }
		        });
		    });
		    
		 	// 그룹화된 데이터를 rno를 기준으로 역순으로 정렬
		    var sortedGroupedData = Object.values(groupedData).sort(function (a, b) {
		        return b.rno - a.rno;
		    });

		 	// 그룹화된 데이터로 테이블 생성
		    $.each(sortedGroupedData, function(index, group) {
		    	newTableHTML += '<tr style="border-top: 1px solid #c0c0c0;">';
				    newTableHTML += '<td colspan="2" class="name-pr" style="font-weight: bolder; border: 0; border-style: dashed; width: 500px;">';
				    if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
				        newTableHTML += '<div class="custom-control custom-checkbox" style="display: inline-block;"> <input type="checkbox" class="custom-control-input rowCheck rno" name="rowCheck" id="' + group.index + '" value="' + group.rno + '"><label class="custom-control-label" for="' + group.index + '"></label></div>';
				    }
				    newTableHTML += '&nbsp;<a href="/food/storedetail?sno=' + group.sno + '"><span class="sname">' + group.sname + '</span></a></td></tr>';
				    newTableHTML += ' <tr><td colspan="2" class="name-pr" style="border: 0; border-style: dashed; width: 500px;"><span class="rdate">' + group.rdate + '</span>';
				    if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
				        newTableHTML += '<button class="editbtn" style="float:right;">수정</button>';
				    }
				    newTableHTML += '</td>';
				    newTableHTML += '</tr>';
				
				    newTableHTML += '<tr>';
				    newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 500px;">';
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
				    newTableHTML += '<td class="name-pr rcomment" style="border: 0; border-style: dashed; font-weight: bolder;">' + group.rcomment + '</td>';
				    if (group.rphoto != null || group.rphoto == ''){
				        newTableHTML += '<td rowspan="2" class="name-pr" style="border: 0; border-style: dashed;"><img class="rphoto modal-title" src="/img/review/' + group.rphoto + '" style="width:150px;height:150px;border-radius: 70px;margin: 0 auto"></td>';
				    }
				    newTableHTML += '</tr>';
				    newTableHTML += '<tr style="border-bottom: 1px solid #c0c0c0;"><td colspan="2" class="name-pr mnname" style="font-size: 17px; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">';
				    newTableHTML += group.mnnameList.join(', ');
				    newTableHTML += '</td></tr>';
				    
				 	var element = document.querySelector('.rcomment'); // 클래스가 'rcomment'인 요소를 선택
					if (group.rphoto != null || group.rphoto == '') {
					    element.classList.add('height'); // 'height' 클래스를 추가
					}
			});

		    newTableHTML += '</table>';

		    // 테이블 업데이트
		    $('.table').html(newTableHTML);

		    editok();
		    
		}

	</script>
</body>
</html>