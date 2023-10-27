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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
		<div class="title">
			<div class="titleFont">냠냠페이</div>
		</div>
		<div style="margin-top: 100px;"></div>
		<div class="cart-box-main">
			<div class="container">
				<div class="col-lg-12">
					<div class="count">
						<div class="h2"><h2 style="font-weight: bolder;float: left;">보유금액&nbsp;:&nbsp;${list[0].pbalance }원</h2></div>&nbsp;
							<select class="pcharge">
								<option selected="selected" value="10000">10,000원</option>
								<option value="30000">30,000원</option>
								<option value="50000">50,000원</option>
								<option value="100000">100,000원</option>
								<option value="4">입력하세요.</option>
							</select>
							<div id="pchargeInput" style="display: none;">
							    <input type="text" style="width: 300px;" class="pchargeInput" placeholder="10만원 이상의 금액을 숫자만 입력하세요.">
							    <div class="pchargeAlert" style="display: none;"></div>
							</div>
						<button class="charge" style="cursor:pointer;width: 100px;height: 50px;float: right; margin-bottom: 5px;">충전하기</button>
						<div class="pbalance" style="display: none;">${list[0].pbalance }</div>
					</div>
					<br>
					<table class="table">
						<c:forEach items="${list }" var="row">
							<tr style="border-bottom: 1px solid #EB5757;">
								<c:if test="${row.pcharge ne null }">
									<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">${row.pcdate }</td>
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder;"></td>
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder; color: #EB5757;">${row.pcharge }원 충전</td>
								</c:if>
								<c:if test="${loop.first || row.tgroup ne list[loop.index - 1].tgroup}">
									<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">${row.tdate }</td>
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder;">${row.sname }</td>
									<td class="name-pr"
										style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder;">${row.total }원 차감</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
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
		
		$(document).on('change', '.pcharge', function(){
			var selectedValue = $(this).val();
			if(selectedValue == '4'){
				$('#pchargeInput').css('display', 'inline');
				selectedValue = $('.pchargeInput').val();
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
			var pcharge = $('.pcharge').val();
			var pbalance = $('.pbalance').text();
			if(pcharge == 4){
				pcharge = $('.pchargeInput').val().trim();
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
		        if (row.pcharge != null) {
		            tableHtml += '<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">' + row.pcdate + '</td>';
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder;"></td>';
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder; color: #EB5757;">' + row.pcharge + '원 충전</td>';
		        }
		        if (row.total != null && (index == 0 || row.tgroup != list[index - 1].tgroup)) {
		            tableHtml += '<td class="quantity-box" style="border: 0; border-style: dashed; width: 200px;">' + row.tdate + '</td>';
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder;">' + row.sname + '</td>';
		            tableHtml += '<td class="name-pr" style="border: 0; border-style: dashed; width: 600px;text-align:right;font-size: larger; font-weight: bolder;">' + row.total + '원 차감</td>';
		        }
		        tableHtml += '</tr>';
		    });
		    tableHtml += '</table>';
		    $('.table').html(tableHtml);
		}

		function updateBalance(pbalance) {
		    var pbalanceHtml = '<h2 style="font-weight: bolder; float: left;">보유금액 : ' + pbalance + '원</h2>';
		    $('.h2').html(pbalanceHtml);
		}
	</script>
</body>
</html>