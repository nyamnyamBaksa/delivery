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
		<div class="titleFont">찜</div>
	</div>
	<div style="margin-top: 100px;"></div>
		<div class="cart-box-main">
		<c:if test="${list[0].count eq null}">
			<div class="container"><h1 style="text-align: center;">찜한 가게가 없습니다.</h1></div>
		</c:if>
		<c:if test="${list[0].count ne null}">
			<div class="container">
				<div class="col-lg-12"><h2>총 찜 개수 : <span class="wishcount">${list[0].count }</span></h2>
					<c:if test="${id eq null || sessionScope.mid eq id }">
						<input style="float: left;margin-top: 15px; margin-right: 15px;" class="allCheck" name="allCheck" type="checkbox">
						<span style="float: left; font-size: larger; font-weight: bolder; margin-top: 5px;margin-right: 5px;"><span class="wish"></span> / <span class="wishcount">${list[0].count }</span></span>
						&nbsp;<button class="delbtn" style="width: 70px;height: 40px;float:left;">삭제</button>
					</c:if>
				</div>
				<div class="col-lg-12">
					<table class="table">
						<c:forEach items="${list}" var="row" varStatus="loop">
						    <c:if test="${loop.index == 0 || !row.sname.equals(list[loop.index - 1].sname)}">
						        <tr style="border-top: 1px solid black">
						            <td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 100px;">
						                <c:if test="${id eq null || sessionScope.mid eq id}">
						                    <input class="rowCheck wno" name="rowCheck" type="checkbox" value="${row.wno}">
						                </c:if>
						                &nbsp;<a href="/food/storedetail?sno=${row.sno }">
						                <img src="${row.simg }"/></a>
						            </td>
						            <td class="name-pr sname" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 100px;">
						                <a href="/food/storedetail?sno=${row.sno }">${row.sname}</a>
						            </td>
						            <td class="name-pr mnname" style="font-size: large; font-weight: bold; border: 0; border-style: dashed; width: 200px;">
										<c:set var="i" value="0" />
						            	<c:forEach items="${list}" var="innerRow">
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
						            <td class="name-pr" style="border: 0; border-style: dashed; width: 100px;">
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
						    </c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:if>
		</div>
	</c:if>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sweetalert.min.js"></script>
    
    <script type="text/javascript">
    
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
					$.ajax({
						url : '/wdelete',
						type : 'post',
						traditional : true,// valueArr=[1, 2, 3] -> valueArr=1&valueArr=2&valueArr=3
						data : {
							valueArr : valueArr
						},
						dataType: 'json',
						success: function(data) {
						    swal("", "찜을 삭제했습니다.", "success");
						    updateTable(data);
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
			            	wno: row.wno,
			                count: row.count,
			                sname: sname,
			                mnnameList: [],
			                average_rating: row.average_rating
			            };
			        }
			     	// 최대 두 개의 mnname만 추가
			        if (groupedData[sname].mnnameList.length < 2) {
			            groupedData[sname].mnnameList.push(row.mnname);
			        }
			    });

			    // 그룹화된 데이터로 테이블 생성
			    $.each(groupedData, function(sno, group) {
			        newTableHTML += '<tr style="border-top: 1px solid black">';
			        newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 100px;">';
			        newTableHTML += '<input class="rowCheck wno" name="rowCheck" type="checkbox" value="' + group.wno + '">';
			        newTableHTML += '&nbsp;<a href="/food/storedetail?sno=' + group.sno + '"><img src="' + group.simg + '" /></a>';
			        newTableHTML += '</td>';
			        newTableHTML += '<td class="name-pr sname" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 100px;">';
			        newTableHTML += '<a href="/food/storedetail?sno=' + group.sno + '">' + group.sname + '</a>';
			        newTableHTML += '</td>';
			        newTableHTML += '<td class="name-pr mnname" style="font-size: large; font-weight: bold; border: 0; border-style: dashed; width: 200px">';
			        newTableHTML += group.mnnameList.join(', ');
			        newTableHTML += '</td>';
			        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 100px;">';
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
			    $('.wishcount').text(data.wlist[0].count);
			    $('.wish').text('0');
			}
	</script>
</body>
</html>