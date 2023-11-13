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
  -webkit-text-fill-color: transparent;
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

h2{
	font-size: 40px;
	font-weight: bolder;
	color: black;
}

td{
	font-size: 30px;
	vertical-align: middle;
}

.col-lg-12{
	position: absolute;
	top: 19%;
	left: 3%;
	bottom: 35%;
}

.custom-checkbox{
	vertical-align: middle;
	margin-top: 22px;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
	<div class="title">
		<div class="titleFont">찜</div>
	</div>
	<div style="margin-top: 110px;"></div>
		<div class="cart-box-main">
		<c:if test="${list[0].count eq null}">
			<div class="container"><h1 style="text-align: center;">찜한 가게가 없습니다.</h1></div>
		</c:if>
		<c:if test="${list[0].count ne null}">
			<div id="mid" style="display: none;">${sessionScope.mid }</div>
			<div id="id" style="display: none;">${id }</div>
			<div class="container">
				<div class="col-lg-13"><h2>총 찜 개수 : <span class="wishcount" id="wishcount">${list[0].count }</span></h2>
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
									<span style="font-size: larger; font-weight: bolder;margin-right: 5px;"><span class="wish"></span> / <span class="wishcount">${list[0].count }</span></span>
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
						<c:forEach items="${list}" var="row" varStatus="loop">
					        <tr style="border-top: 1px solid #c0c0c0;border-bottom: 1px solid #c0c0c0;">
						        <td class="name-pr" style="border: 0; border-style: dashed; width: 5px;vertical-align: middle;">
					                <c:if test="${id eq null || sessionScope.mid eq id}">
					                	<div class="custom-control custom-checkbox" style="display: inline-block;">
						                    <input type="checkbox" class="custom-control-input rowCheck wno" name="rowCheck" id="${loop.index }" value="${row.wno}">
						                    <label class="custom-control-label" for="${loop.index }"></label>
					                    </div>
					                </c:if>
						        </td>
					            <td class="name-pr" style="font-weight: bolder; border: 0; border-style: dashed; width: 100px;">
					                <a href="/food/storedetail?sno=${row.sno }">
					                <img style="width: 170px;height:150px;" src="/img/food/${row.simg }"/></a>
					            </td>
					            <td class="name-pr sname" style="font-weight: bolder; border: 0; border-style: dashed; width: 150px;vertical-align: middle;">
					                <a href="/food/storedetail?sno=${row.sno }"><span style="font-size:30px;">${row.sname}</span></a>
					            </td>
					            <td class="name-pr mnname" style="font-weight: bold; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">
									<c:set var="i" value="0" />
					            	<c:forEach items="${mnlist}" var="innerRow">
									    <c:if test="${innerRow.sname.equals(row.sname)}">
										     <c:choose>
										        <c:when test="${i == 0}">
										        	${innerRow.mnname},&nbsp;
										        </c:when>
										        <c:when test="${i == 1}">
										            ${innerRow.mnname}
										        </c:when>
										    </c:choose>
										    <c:set var="i" value="${i + 1}" />
									    </c:if>
									</c:forEach>
					            </td>
					            <td class="name-pr" style="border: 0; border-style: dashed; width: 100px;vertical-align: middle;">
					                <div class="star-ratings">
					                    <div class="rscore" style="display: none;">${row.average_rating}</div>
					                    <div class="star-ratings-fill space-x-2 text-lg" style="width: ${score}%;">
					                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					                    </div>
					                    <div class="star-ratings-base space-x-2 text-lg">
					                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					                    </div>
					                </div>&nbsp;(${row.average_rating})
					            </td>
					        </tr>
						</c:forEach>
					</table>
					<button style="margin: 0 auto;" class="morebtn">+ 더보기</button>
				</div>
			</div>
		</c:if>
		</div>
		<div class="mouse" style="text-align: center;">
		<a href="#" class="mouse-icon">
			<div class="mouse-wheel"><i class="fa fa-chevron-up"></i></div>
		</a>
	</div>
	</c:if>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="/js/sweetalert.min.js"></script>
    
    <script type="text/javascript">
    
 		// 총 개수
		var wishcount = $('#wishcount').text();
		// 조회 인덱스
		var offset = 0;	// 인덱스 초기값
		var count = 7;	// 7개씩 로딩
		// 더보기 버튼 삭제
		if(offset + count >= wishcount){
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
				url: "/moreWishlist",
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

					// 중복된 sno 값을 가진 데이터를 그룹화하기 위한 객체 생성
				    var groupedData = {};
				    // 데이터 그룹화
				    $.each(data.wlist, function(index, row) {
				    	index += count;
				        var sname = row.sname;
				        if (!groupedData[sname]) {
				            groupedData[sname] = {
				            	sno: row.sno,
				            	simg: row.simg,
				            	wno: row.wno,
				                count: row.count,
				                sname: sname,
				                mnnameList: [],
				                average_rating: row.average_rating,
				                index:index
				            };
				        }
				        
				        $.each(data.mnlist, function(index2, row2) {
					     	// 최대 두 개의 mnname만 추가
					        if (groupedData[sname].sname == row2.sname && groupedData[sname].mnnameList.length < 2) {
					            groupedData[sname].mnnameList.push(row2.mnname);
					        }
				        });
				    });
				    
				    // 그룹화된 데이터로 테이블 생성
				    $.each(groupedData, function(sno, group) {
				        newTableHTML += '<tr style="border-top: 1px solid #c0c0c0;border-bottom: 1px solid #c0c0c0;">';
				        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 5px;vertical-align: middle;">';
			        if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
				        newTableHTML += '<div class="custom-control custom-checkbox" style="display: inline-block;"> <input type="checkbox" class="custom-control-input rowCheck wno" name="rowCheck" id="' + group.index + '" value="' + group.wno + '"><label class="custom-control-label" for="' + group.index + '"></label></div></td>';
			        }
				        newTableHTML += '<td class="name-pr" style="font-weight: bolder; border: 0; border-style: dashed; width: 100px;"><a href="/food/storedetail?sno=' + group.sno + '"><img style="width: 170px;height:150px;" src="/img/food/' + group.simg + '" /></a>';
				        newTableHTML += '</td>';
				        newTableHTML += '<td class="name-pr sname" style="font-weight: bolder; border: 0; border-style: dashed; width: 150px;vertical-align: middle;">';
				        newTableHTML += '<a href="/food/storedetail?sno=' + group.sno + '"><span style="font-size:30px;">' + group.sname + '</span></a>';
				        newTableHTML += '</td>';
				        newTableHTML += '<td class="name-pr mnname" style="font-weight: bold; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">';
				        newTableHTML += group.mnnameList.join(', ');
				        newTableHTML += '</td>';
				        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 100px;vertical-align: middle;">';
				        newTableHTML += '<div class="star-ratings">';
				        newTableHTML += '<div class="rscore" style="display: none;">' + group.average_rating + '</div>';
				        newTableHTML += '<div class="star-ratings-fill space-x-2 text-lg" style="width: ' + (group.average_rating * 20) + '%;">';
				        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
				        newTableHTML += '</div>';
				        newTableHTML += '<div class="star-ratings-base space-x-2 text-lg">';
				        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
				        newTableHTML += '</div>';
				        newTableHTML += '</div>&nbsp;(' + group.average_rating + ')';
				        newTableHTML += '</td>';
				        newTableHTML += '</tr>';
				    });

				    // 테이블 업데이트
					$(newTableHTML).appendTo($(".table")).slideDown();

				    if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
					    $('.wish').text('0');
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
							var zzimTotalElement = document.querySelector('.wish');
							zzimTotalElement.textContent = count;
						}
				    }
					// 더보기 버튼 삭제
					if(offset + count >= wishcount){
						$('.morebtn').remove();
					}
				 	
				}
			});
		}
    
    	$('.sname').each(function(){
    		var sname = $(this).text().trim();
    		var mnname = $(this).closest('tr').find('.mnname');
    			
    		$.ajax({
	            url: '/mnname',
	            type: 'post',
	            data: { sname:sname },
	            dataType: 'json',
	            success: function(data) {
					
	                if(data.mlist.length != 0){
		            	var mlist = '';
		                for (let i = 0; i < data.mlist.length; i++) {
		                	if(i == data.mlist.length - 1){
		                		mlist += data.mlist[i].mnname;
		                	} else {
			                	mlist += data.mlist[i].mnname + ', ';
		                	}
		                }
	                	mnname.html(mlist);
	                }
	            },
	            error: function(error) {
	                swal("실패", "작업수행에 실패하였습니다.", "error");
	            }
	        });
    	});
    
	
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
					var wish = $('.wish').text();
					if(offset > 0){
						offset = offset - wish;
						for(var i = 1; offset <= 7 * i && offset > 7 * (i - 1); i++){
							offset = i - 1;
						}
					}
					$.ajax({
						url : '/wdelete',
						type : 'post',
						traditional : true,// valueArr=[1, 2, 3] -> valueArr=1&valueArr=2&valueArr=3
						data : {
							valueArr : valueArr,offset: offset
						},
						dataType: 'json',
						success: function(data) {
						    swal("", "찜을 삭제했습니다.", "success");
						    updateTable(data);
						    
						 	// 더보기 버튼 삭제
							if(offset + count >= wishcount){
								$('.morebtn').remove();
							}
						},
						error: function(error) {
							swal("실패", "작업수행에 실패하였습니다.", "error");
						}
					});
				}
			});
		}
		
		var check = document.getElementsByName("rowCheck");// var check = $(".rowCheck");
		var checkCnt = check.length;
		$('.wish').text('0');

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
			var zzimTotalElement = document.querySelector('.wish');
			zzimTotalElement.textContent = count;
		}

		$(document).on("click", ".delbtn", function(){
			var wno = $('.wno').val();
			deleteValue(wno);
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
			    
			    // 중복된 sno 값을 가진 데이터를 그룹화하기 위한 객체 생성
			    var groupedData = {};

			    // 데이터 그룹화
			    $.each(data.wlist, function(index, row) {
			        var sname = row.sname;
			        if (!groupedData[sname]) {
			            groupedData[sname] = {
			            	sno: row.sno,
			            	simg: row.simg,
			            	wno: row.wno,
			                count: row.count,
			                sname: sname,
			                mnnameList: [],
			                average_rating: row.average_rating,
			                index:index
			            };
			        }
			        
			        $.each(data.mnlist, function(index2, row2) {
				     	// 최대 두 개의 mnname만 추가
				        if (groupedData[sname].sname == row2.sname && groupedData[sname].mnnameList.length < 2) {
				            groupedData[sname].mnnameList.push(row2.mnname);
				        }
			        });
			    });
			    
			    // 그룹화된 데이터로 테이블 생성
			    $.each(groupedData, function(sno, group) {
			        newTableHTML += '<tr style="border-top: 1px solid #c0c0c0;border-bottom: 1px solid #c0c0c0;">';
			        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 5px;vertical-align: middle;">';
		        if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
			        newTableHTML += '<div class="custom-control custom-checkbox" style="display: inline-block;"> <input type="checkbox" class="custom-control-input rowCheck wno" name="rowCheck" id="' + group.index + '" value="' + group.wno + '"><label class="custom-control-label" for="' + group.index + '"></label></div></td>';
		        }
			        newTableHTML += '<td class="name-pr" style="font-weight: bolder; border: 0; border-style: dashed; width: 100px;"><a href="/food/storedetail?sno=' + group.sno + '"><img style="width: 170px;height:150px;" src="/img/food/' + group.simg + '" /></a>';
			        newTableHTML += '</td>';
			        newTableHTML += '<td class="name-pr sname" style="font-weight: bolder; border: 0; border-style: dashed; width: 150px;vertical-align: middle;">';
			        newTableHTML += '<a href="/food/storedetail?sno=' + group.sno + '"><span style="font-size:30px;">' + group.sname + '</span></a>';
			        newTableHTML += '</td>';
			        newTableHTML += '<td class="name-pr mnname" style="font-weight: bold; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">';
			        newTableHTML += group.mnnameList.join(', ');
			        newTableHTML += '</td>';
			        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 100px;vertical-align: middle;">';
			        newTableHTML += '<div class="star-ratings">';
			        newTableHTML += '<div class="rscore" style="display: none;">' + group.average_rating + '</div>';
			        newTableHTML += '<div class="star-ratings-fill space-x-2 text-lg" style="width: ' + (group.average_rating * 20) + '%;">';
			        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
			        newTableHTML += '</div>';
			        newTableHTML += '<div class="star-ratings-base space-x-2 text-lg">';
			        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
			        newTableHTML += '</div>';
			        newTableHTML += '</div>&nbsp;(' + group.average_rating + ')';
			        newTableHTML += '</td>';
			        newTableHTML += '</tr>';
			    });

			    newTableHTML += '</table>';
			    // 테이블 업데이트
			    $('.table').html(newTableHTML);

			    // 찜 개수 업데이트
			    var count = data.wlist[0].count;
			    wishcount = $('.wishcount').text(count);
			    $('.wish').text('0');
			    
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
					var zzimTotalElement = document.querySelector('.wish');
					zzimTotalElement.textContent = count;
				}
			}
	</script>
</body>
</html>