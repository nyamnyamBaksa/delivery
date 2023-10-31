<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Basic -->

<head>
<meta charset="utf-8">
<title>냠냠박사</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/mypage-main.css">
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
	<div class="mypage">
		<div class="mypageFont">주문하기</div>
	</div>
	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-6 mb-3">
					<div class="col-md-12 col-lg-12">
						<div class="odr-box">
							<div class="title-left">
								<h3>${list[0].sname }</h3>
							</div>
							<div class="rounded p-2 bg-light">
								<c:forEach items="${list }" var="row">
									<div class="media mb-2 border-bottom">
										<div class="media-body">
											${row.mnname }
											<div class="small text-muted">
												가격 : ${row.mnprice }원 <span class="mx-2">|</span> 수량 :
												${row.camount } <span class="mx-2">|</span> 메뉴당 가격 :
												${row.ctotal }원
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-12">
						<div class="checkout-address">
							<div class="title-left">
								<h3>요청사항</h3>
							</div>
							<div class="row">
								<div class="col-md-10 mb-3">
									<label for="username">가게 사장님께</label>
									<div class="input-group">
										<input type="text" class="form-control toowner" id="username"
											placeholder="">
									</div>
								</div>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="save-info"> <label class="custom-control-label"
									for="save-info">다음에도 사용</label>
							</div>
							<br>
							<div class="row">
								<div class="col-md-10 mb-3">
									<label for="rider">라이더님께</label>
									<select class="wide w-100" id="rider">
										<option value="문 앞에 두고 벨 눌러주세요" >문 앞에 두고 벨 눌러주세요</option>
										<option value="문 앞에 두면 가져갈게요(벨x, 노크x)">문 앞에 두면 가져갈게요(벨x, 노크x)</option>
										<option value="직접 받을게요">직접 받을게요</option>
										<option value="전화주시면 마중 나갈게요">전화주시면 마중 나갈게요</option>
										<option value="4">직접 입력</option>
									</select>
								</div>
							</div>
							<!-- 직접 입력시 노출 -->
							<div class="row">
								<div class="col-md-10 mb-3">
									<div class="input-group">
										<input placeholder="요청사항을 입력하세요." type="text" class="riderAsk form-control" style="display: none"/>
				                  	</div>
			                  	</div>
		                  	</div>
						</div>
						<div class="checkout-address">
							<div class="title-left">
								<h3>쿠폰</h3>
							</div>
							<div class="row my-8">
								<div class="col-md-10 mb-3">
									<div class="coupon-box">
										<div class="input-group input-group-sm" style="display: inline;">
											<select class="wide w-100" id="coupon">
												<option value="0">선택안함</option>
												<c:forEach items="${coupon }" var="row">
													<option value="${row.cpno }">
														(${row.cpid }) ${row.cpname } ${row.cpprice }원
													</option>
												</c:forEach>
											</select>
										</div>
										<div class="input-group-append">
											<button class="ml-auto cpbtn" type="button">쿠폰적용</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="d-block my-3"></div>
						<div class="row"></div>
						<div class="row"></div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-6 mb-3">
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="order-box">
								<div class="title-left">
									<h3>주문금액</h3>
								</div>
								<div class="d-flex gr-total" onclick="location.href='/mypage/pay?pbalance=charge'" style="cursor: pointer;">
									<h5 style="color: #EB5757;display: none;" class="pointempty">
										<i class="bi bi-credit-card"></i>
										포인트가 부족합니다. 충전하시려면 클릭하세요.
									</h5>
								</div>
								<div class="d-flex gr-total" onclick="location.href='/mypage/pay?pbalance=charge'" style="cursor: pointer;">
									<h5 style="color: #EB5757;">포인트</h5>
									<div class="ml-auto h5">
										<span class="point">${pbalance }</span>원
									</div>
								</div>
								<hr>
								<div class="d-flex">
									<h4>주문금액</h4>
									<div class="ml-auto font-weight-bold">
										<span class="total">${list[0].total }</span>원
									</div>
								</div>
								<div class="d-flex">
									<h4>할인</h4>
									<div class="ml-auto font-weight-bold">
										<span class="cpprice">0</span>원
									</div>
								</div>
								<div class="d-flex">
									<h4>배달비</h4>
									<div class="ml-auto font-weight-bold" style="color: #EB5757;">0원</div>
								</div>
								<div class="d-flex gr-total">
									<h5 style="color: #EB5757;">총 주문금액</h5>
									<div class="ml-auto h5">
										<span class="realtotal">${list[0].total }</span>원
									</div>
								</div>
								<hr>
								<div class="d-flex gr-total">
									<h5 style="color: #EB5757;">포인트 잔액</h5>
									<div class="ml-auto h5">
										<span class="pbalance"></span>원
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 d-flex shopping-box">
							<button class="ml-auto purchasebtn" type="button">결제하기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- End Cart -->


	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="/js/jquery.superslides.min.js"></script>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
		
	<script type="text/javascript">
		var point = $('.point').text();
		var total = $('.total').text();
		var realtotal = $('.realtotal').text();
		var pbalance = point - realtotal;
		$('.pbalance').text(pbalance);
		var cpno = $('#coupon').val();
		
		if(pbalance < 0){
			$('.pointempty').css('display', 'inline');
		} else {
			$('.pointempty').css('display', 'none');
		}
		
		var riderAsk = $('#rider').val();
		$(document).on('change', '#rider', function(){
			riderAsk = $(this).val();
			if(riderAsk == 4){
				$('.riderAsk').css('display', 'inline');
				riderAsk = $('.riderAsk').val();
			} else {
			    $('.riderAsk').css('display', 'none');
			}
		});
	
		$(document).on("click",".cpbtn",function() {
			cpno = $('#coupon').val();
			if(cpno == 0){
				$('.cpprice').text('0');
				realtotal = total;
				pbalance = point - realtotal;
				$('.realtotal').text(realtotal);
				$('.pbalance').text(pbalance);
			} else {
				
				$.ajax({
					url : '/findByCpno',
					type : 'post',
					data : {cpno : cpno},
					dataType : 'json',
					success : function(data) {
						$('.cpprice').text(data.cpprice);
						realtotal = total - data.cpprice;
						pbalance = point - realtotal;
						$('.realtotal').text(realtotal);
						$('.pbalance').text(pbalance);
					},
					error : function(error) {
						swal("실패", "작업수행에 실패하였습니다.", "error");
					}
				});
			}
		});
		
		$(document).on("click",".purchasebtn",function() {
			var toowner = $('.toowner').val();
			var value = $("#save-info").is(":checked") ? 1 : 0;
			 
			riderAsk = $('#rider').val();
			if (riderAsk == 4) {
				riderAsk = $('.riderAsk').val();
			}
			
			if(pbalance < 0){
				$(".purchasebtn").attr("disabled",true);
				return;
			}
			
			$.ajax({
				url : '/purchase',
				type : 'post',
				data : {cpno : cpno, riderAsk:riderAsk, toowner:toowner, pbalance:pbalance, realtotal:realtotal},
				dataType : 'json',
				success : function(data) {
					if(value == 1){
					 	setCookie("toowner", toowner, 7);
					 	setCookie("setY", "Y", 2);
					} else {
					 	delCookie("toowner");
					 	delCookie("setY");
					}
					location.href="./orderDetail?tgroup=" + data.tgroup;// 주문상세내역
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		// 다음에도 사용
		let saveinfo = getCookie("toowner");
		let setY = getCookie("setY");
		
		// 저장 기록이 있을 때
		if(setY == "Y"){
			$("#save-info").prop("checked", true);
			$(".toowner").val(saveinfo);
		} else{
			$("#save-info").prop("checked", false);
		}
		
		
		// 쿠키 저장
		function setCookie(cookieName, value, exdays){
			let exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			
			let cookieValue;
			if(exdays == null) {
				cookieValue = value;
			} else {
				cookieValue = value +"; expires="+ exdate.toUTCString()
			}
			
			document.cookie = cookieName+"="+cookieValue;
		}
		
		
		// 쿠키 삭제
		function delCookie(cookieName){
			let expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName +"="+ "; expires="+ expireDate.toUTCString()
		}
		
		
		// 쿠키가져오기
		function getCookie(cookieName){
			let cname, cvalue;
			let val = document.cookie.split(";");
			for(let i = 0; i < val.length; i++){
				cname = val[i].substr(0, val[i].indexOf("="));
				cvalue = val[i].substr(val[i].indexOf("=")+1);
				cname = cname.trim();
				
				if(cname == cookieName){
					return cvalue;
				}
			}
		}
		
	</script>
</body>

</html>