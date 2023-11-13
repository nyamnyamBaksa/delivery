<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<style type="text/css">
.col-lg-12{
	position: absolute;
	top: 11%;
	left: 5%;
	right: 5%;
	bottom: 50%;
}

td{
	font-size: 40px;
	vertical-align: middle;
	text-align: center;
}

.selectpicker, .show-tick , .form-control{
	font-weight: 700;
	font-size: 40px;
	line-height: 27px;
	width:200px;
	height:70px;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
		<div class="title">
			<div style="display: inline-block;" class="titleFont">냠냠페이</div>
			<c:if test="${param.pbalance eq 'charge' }">
	       		<button class="againpurchase">결제페이지로</button>
	       	</c:if>
		</div>
		<div style="margin-top: 100px;"></div>
		<div class="cart-box-main">
			<div class="container">
				<div class="col-lg-12">
				<table>
					<tr>
						<td>
					       	<div class="count toolbar-sorter-right">
					       		<select class="cate selectpicker show-tick form-control" id="cate">
									<option selected="selected" value="0">전체 보기</option>
									<option value="1">최근 1개월</option>
									<option value="3">최근 3개월</option>
									<option value="6">최근 6개월</option>
								</select>
					       	</div>
						</td>
						<td style="width: 550px;text-align: left;">
							<span style="font-weight: bolder;font-size: larger;color: black;">
								<c:if test="${list[0].pbalance eq null }">
									보유금액&nbsp;:&nbsp;0원
								</c:if>
								<c:if test="${list[0].pbalance ne null }">
									보유금액&nbsp;:&nbsp;${list[0].pbalance }원
								</c:if>
							</span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<div class="toolbar-sorter-right">
								<select id="pcharge" class="selectpicker show-tick form-control">
									<option selected="selected" value="10000">10,000원</option>
									<option value="30000">30,000원</option>
									<option value="50000">50,000원</option>
									<option value="100000">100,000원</option>
									<option value="4">입력하세요.</option>
								</select>
							</div>
						</td>
						<td>
							<input type="text" style="width: 550px;display: none;border: 2px solid #EB5757;border-radius: 50px;font-weight: bold;" id="pchargeInput" placeholder="10만원 이상의 금액을 숫자만 입력하세요.">
						</td>
						<td>
							<button class="charge">충전하기</button>
						</td>
					</tr>
				</table>
					<div class="pbalance" style="display: none;">${list[0].pbalance }</div>
					<div style="display: none;" class="paycount">${paycount }</div>
					<table class="table">
						<c:forEach items="${list }" var="row">
							<tr style="border-bottom: 1px solid #EB5757;">
								<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">${row.pcdate }</td>
								<c:if test="${row.pcharge ne null }">
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 500px;font-weight: bolder;"></td>
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 300px;font-weight: bolder; color: #EB5757;">${row.pcharge }원 충전</td>
								</c:if>
								<c:if test="${row.tgroup ne null}">
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 500px;font-weight: bolder;">${row.sname }</td>
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 300px;font-weight: bolder;">${row.puse }원 차감</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
					<button style="margin: 0 auto;" class="morebtn">+ 더보기</button>
				</div>
			</div>
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
	<!-- ALL PLUGINS -->
	<script src="/js/jquery.superslides.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="/js/bootstrap-select.js"></script>
	<script src="/js/inewsticker.js"></script>
	<script src="/js/bootsnav.js."></script>
	<script src="/js/images-loded.min.js"></script>
	<script src="/js/isotope.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/baguetteBox.min.js"></script>
	<script src="/js/form-validator.min.js"></script>
	<script src="/js/contact-form-script.js"></script>
	<script src="/js/custom.js"></script>
	<script src="/js/sweetalert.min.js"></script>
	<script type="text/javascript">
	
		// 총 개수
		var paycount = $('.paycount').text();
		// 조회 인덱스
		var offset = 0;	// 인덱스 초기값
		var count = 10;	// 10개씩 로딩
		
		// 더보기 버튼 삭제
		if(offset + count >= paycount){
			$('.morebtn').remove();
		}
	
		// 더보기 클릭시
		$(document).on("click", ".morebtn", function(){
			offset += count;
			readOldNotify(offset);
		});
				
		// 더보기 실행함수
		function readOldNotify(offset){
			let endIndex = offset+count-1;	// endIndex설정
			$.ajax({
				url: "/mypage/morePay",
				type: "post",
				async: "true",
				dataType: "json",
				data: {
					offset: offset,
					endIndex: endIndex
				},
				success: function (data) {
					var tableHtml = '';
				    $.each(data.list, function (index, row) {
				        tableHtml += '<tr style="border-bottom: 1px solid #EB5757;">';
				        tableHtml += '<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">' + row.pcdate + '</td>';
				        if (row.pcharge != null) {
				            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 500px;font-weight: bolder;"></td>';
				            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 300px;font-weight: bolder; color: #EB5757;">' + row.pcharge + '원 충전</td>';
				        }
				        if (row.tgroup != null) {
				            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 500px;font-weight: bolder;">' + row.sname + '</td>';
				            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 300px;font-weight: bolder;">' + row.puse + '원 차감</td>';
				        }
				        tableHtml += '</tr>';
				    });
				    tableHtml += '';

				 	// 테이블 업데이트
					$(tableHtml).appendTo($(".table")).slideDown();
				 	
		         	// 더보기 버튼 삭제
		    		if(offset + count >= paycount){
		    			$('.morebtn').remove();
		    		}
				 	
				}
			});
		}
	
		$(document).on("click",".againpurchase", function(){
			location.href="/purchase";
		});
	
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
		
		function getParameterByName(name, url) {
	    	const urlParams = new URL(location.href).searchParams;
	    	return urlParams.get(name);
	    }
		
		// URL에서 cate 매개변수를 가져와서 기본값으로 설정
	    var defaultCate = getParameterByName('cate');
	    $('#cate').val(defaultCate);
		
	    $('#cate').on('change', function(){
			var cate = $('#cate').val();
			$.ajax({
				url:'/mypage/cateChange',
				type:'post',
				data:{cate:cate},
				dataType:'json',
				success:function(data){
					// 표의 내용을 삭제
	 		        var table = $(".table");
	 		        table.empty();
					// 테이블 업데이트
		            updateTable(data.list);
				},
				error:function(error){
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
	    
	    // 충전 사용자 지정
		$(document).on('change', '#pcharge', function(){
			var selectedValue = $(this).val();
			if(selectedValue == '4'){
				$('#pchargeInput').css('display', 'inline');
				selectedValue = $('#pchargeInput').val();
			} else {
				$('#pchargeInput').css('display', 'none');
			}
		});
		
		function strToInt(str) {
		    for (let i = 0; i < str.length; i++) {
		        if (isNaN(parseInt(str[i]))) {
		            // 숫자가 아닌 문자가 중간에 포함된 경우
		            swal('', '숫자만 입력하세요.', "error");
		            return false;
		        }
		    }
		    
			if(str.length < 6){
				swal('', '10만원 이상 입력하세요.', "error");
				return false;
			}
		    // 숫자로만 이루어진 문자열을 정수로 변환하여 반환
		    return parseInt(str);
		}
		
		$(document).on("click",".charge", function(){
			var pcharge = $('#pcharge').val();
			var pbalance = $('.pbalance').text();
			if(pcharge == 4){
				pcharge = $('#pchargeInput').val().trim();
				if (!strToInt(pcharge)) {
		            return; // 숫자로 변환되지 않으면 함수 종료
		        }
			}
			$.ajax({
				url: '/mypage/charge',
				type: 'post',
				data: {pcharge:pcharge, pbalance:pbalance},
				dataType:'json',
				success:function(data){
					swal('', '포인트가 충전되었습니다.', "success");
					// 표의 내용을 삭제
	 		        var table = $(".table");
	 		        table.empty();
					// 테이블 업데이트
		            updateTable(data.list);
					
		         	// 보유금액의 내용을 삭제
	 		        var h2 = $(".h2");
	 		        h2.empty();
		            // 보유금액 업데이트
		            updateBalance(data.list[0].pbalance);
		            
		            var count = data.paycount;
		            paycount = $('.paycount').text(count);
		            $('#pchargeInput').css('display', 'none');
		            $('#pchargeInput').val('');
		         	// 더보기 버튼 삭제
		    		if(offset + count >= paycount){
		    			$('.morebtn').remove();
		    		}
				},
				error:function(error){
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		function updateTable(list) {
		    var tableHtml = '<table class="table">';
		    $.each(list, function (index, row) {
		        tableHtml += '<tr style="border-bottom: 1px solid #EB5757;">';
		        tableHtml += '<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">' + row.pcdate + '</td>';
		        if (row.pcharge != null) {
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 500px;font-weight: bolder;"></td>';
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 300px;font-weight: bolder; color: #EB5757;">' + row.pcharge + '원 충전</td>';
		        }
		        if (row.tgroup != null) {
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 500px;font-weight: bolder;">' + row.sname + '</td>';
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 300px;font-weight: bolder;">' + row.puse + '원 차감</td>';
		        }
		        tableHtml += '</tr>';
		    });
		    tableHtml += '</table>';
		    $('.table').html(tableHtml);
		}

		function updateBalance(pbalance) {
		    var pbalanceHtml = '<span style="font-weight: bolder;font-size: larger;color: black;">보유금액 : ' + pbalance + '원</span>';
		    $('.h2').html(pbalanceHtml);
		}
	</script>
</body>
</html>