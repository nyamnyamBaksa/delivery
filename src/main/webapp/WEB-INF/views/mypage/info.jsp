<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 폰트 -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<style type="text/css">
body {
	font-family: 'NanumSquareNeo';
}
.col-lg-13{
	position: absolute;
	top: 12%;
	left: 5%;
	right: 5%;
}

.form-group{
	position: relative;
}
.input{
	width: 250px;
	height: 50px;
	
	background: #FFFFFF;
	border: 4px solid #EB5757;
	border-radius: 10px;
	font-size: large;
	font-weight: bolder;
	
}

.infobtn{
	margin-top:5px;
	top: 27.83%;
	bottom: 67.48%;
	height: 40px;
	background: #EB5757;
	border-radius: 50px;
	border: none;
	font-weight: 700;
	font-size: 18px;
	line-height: 27px;
	/* or 150% */
	display: flex;
	align-items: center;
	text-align: center;
	color: #FFFFFF;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
	<div class="title">
		<div class="titleFont">회원정보수정</div>
	</div>
		<div class="container" style="margin: 0 auto;width: 520px;">
			<div class="col-lg-13">
				<div class="form-group">
					<div>
						<input class="id input" type="text" placeholder="아이디를 입력하세요." />
						<button class="idchbtn infobtn" style="float: right;">아이디 변경</button><br>
						<input style="display: inline-block;margin-top: 5px;background: #FF9C41;" class="idchk infobtn" type=button value="아이디 중복 확인" />
						<span style="color: red;" id="idchkMsg"></span>
					</div>
				</div>
				<div class="form-group">
					<div>
						<input class="pw input" type="password" placeholder="새 비밀번호를 입력하세요." />
						<button class="pwchbtn infobtn" style="float: right;">비밀번호 변경</button>
					</div>
					<div style="margin-top: 5px;">
						<input class="input-sm pwchk input"  type="password" placeholder="새 비밀번호를 한 번 더 입력하세요." />
						<br><span style="color: red;" id="pwchkMsg">비밀번호와 일치하지 않습니다.</span>
					</div>
				</div>
				<div class="form-group">
					<div>
						<input class="input" name="postcode" type="text" id="postcode" placeholder="우편번호">
						<button class="addrchbtn infobtn" style="float: right;">주소 변경</button><br>
						<input class="infobtn" type="button" onclick="addrChange()" value="우편번호 찾기" style="background: #FF9C41;">
						<input style="margin-top: 5px;" class="input" name="address" type="text" id="address" placeholder="주소">
						<input style="margin-top: 5px;" class="input" name="detailAddress" type="text" id="detailAddress" placeholder="상세주소">
						<input style="margin-top: 5px;" class="input" name="extraAddress" type="text" id="extraAddress" placeholder="참고항목">
					</div>
				</div>
				<div class="form-group phone-form">
					<div class="detail">
						<input class="input" type="tel" id="phone" name="phone" placeholder="전화번호를 입력하세요.">
						<button class="phonechbtn infobtn" style="float: right;">전화번호 변경</button><br>
						<input class="infobtn" type="button" id="phoneChk" style="background: #FF9C41;" value="인증번호 받기">
						<input style="margin-top: 5px;" class="input" id="phone2" type="text" disabled required /><br>
						<input class="infobtn" type="button" id="phoneChk2" style="background: #FF9C41;display: inline-block;" value="본인인증" disabled="disabled">
						<span style="color: red;" class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
						<input type="hidden" id="phoneDoubleChk" />
					</div>
				</div>
				<div style="text-align: center;margin-top: 50px;">
					<span class="logout" style="cursor: pointer;">로그아웃</span> || <span class="out" style="cursor: pointer;">탈퇴하기</span>
				</div>
			</div>
		</div>
	</c:if>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sweetalert.min.js"></script>
		<!-- 도로명 주소 -->
	<script src="/js/postcode.v2.js"></script>

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
		
		$('.out').click(function() {
			var c = confirm('', '정말 탈퇴하시겠습니까?');
			if (c) {
				location.href = './out';
			}
		});
		
		$('.logout').click(function() {
			location.href = './logout';
		});

		function addrChange() {
			new daum.Postcode(
				{oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("extraAddress").value = extraAddr;

					} else {
						document.getElementById("extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
		}

		// 아이디 중복 검사
		var isIdChecked = false; // ID 중복 확인 여부를 저장하는 변수
		$(document).on('click','.idchk',function() {
			var id = $('.id').val().trim();
			// id 길이
			if (id.length >= 0 && id.length < 4) {
				swal("", "아이디는 4자 이상 적으세요.", "error");
				$('.id').focus();
				return false;
			}
			
			$.ajax({
				url : './idchk',
				type : 'post',
				data: {id: id},
				dataType : 'json',
				success : function(data) {
					if (data.idchk >= 1) {
						$('.id').val('');
						$('.id').focus();
						$('#idchkMsg').text('중복된 아이디가 있습니다. 다시 적으세요.').css('color', 'red');
						isIdChecked = false;// 중복된 경우 isIdChecked를 false로 설정
					} else {
						$('#idchkMsg').text('사용가능한 아이디입니다.').css('color', 'green');
						isIdChecked = true;// 중복되지 않은 경우 isIdChecked를 true로 설정
					}
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		$(document).on('click','.idchbtn',function() {
			var id = $('.id').val().trim();
			
			// id 길이
			if (id.length >= 0 && id.length < 4) {
				swal("", "아이디는 4자 이상 적으세요.", "error");
				$('.id').focus();
				return false;
			}
			
			// ID 중복 확인을 하지 않은 경우
			if (id != '' && !isIdChecked) {
				swal("", "ID 중복 확인을 해주세요.", "error");
				return false;
			}
			
			$.ajax({
				url : './idUpdate',
				type : 'post',
				data: {id: id},
				dataType : 'json',
				success : function(data) {
					$('#id').text(id);
					$('.id').val('');
					$('#idchkMsg').text('');
					swal("", "아이디가 변경되었습니다.", "success");
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});

		// 비밀번호 입력 필드의 값이 변경될 때 확인
		$(document).on('input', '.pw', function() {
			checkPw();
		});

		// 비밀번호 확인 필드의 값이 변경될 때 확인
		$(document).on('input', '.pwchk', function() {
			checkPw();
		});
	
		// pw와 pwchk 비교
		$('#pwchkMsg').text('');
		function checkPw() {
			// 여기에 pw, pwchk를 안쓰면 처음 쓴 값으로 고정된다.
			var pw = $('.pw').val();
			var pwchk = $('.pwchk').val();
			if (pw === pwchk) {
				$('#pwchkMsg').text('비밀번호와 일치합니다.').css('color', '#4682B4');
			} else {
				$('#pwchkMsg').text('비밀번호와 일치하지 않습니다.').css('color', 'red');
			}
		}
		
		$(document).on('click','.pwchbtn',function() {
			var pw = $('.pw').val().trim();
			var pwchk = $('.pwchk').val().trim();
			// pw 길이
			if (pw.length >= 0 && pw.length < 4) {
				swal("", "비밀번호는 4자 이상 적으세요.", "error");
				$('.pw').focus();
				return false;
			}
			
			// pw, pwchk 비교
			if (pw !== pwchk) {
				swal("", "비밀번호 확인칸을 다시 적으세요.", "error");
				$('.pwchk').focus();
				return false;
			}
			
			$.ajax({
				url : './pwUpdate',
				type : 'post',
				data: {pw: pw},
				dataType : 'json',
				success : function(data) {
					$('.pw').val('');
					$('.pwchk').val('');
					$('#pwchkMsg').text('');
					swal("", "비밀번호가 변경되었습니다.", "success");
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		// 주소 변경
		$(document).on('click','.addrchbtn',function() {
			var postcode = $('#postcode').val().trim();
			var address = $('#address').val().trim();
			var detailAddress = $('#detailAddress').val().trim();
			var extraAddress = $('#extraAddress').val().trim();
			
			// 주소의 모든 값이 있거나 모든 값이 없을 때만 @controller로 간다.
			const isAllEmpty = postcode === '' && address === '' && detailAddress === '' && extraAddress === '';
			if(isAllEmpty){
				return;
			}
			// 주소의 모든 입력 값이 하나라도 비어있는 경우
			if (postcode === '' || address === '' || detailAddress === '' || extraAddress === '') {
				swal("", "주소를 전부 입력하세요.", "error");
				return false;
			}
			
			var addr = '(' + postcode + ') ' + address + ' ' + detailAddress + ' ' + extraAddress;
			
			$.ajax({
				url : './addrUpdate',
				type : 'post',
				data: {addr: addr},
				dataType : 'json',
				success : function(data) {
					$('#addr').text(addr);
					var postcode = $('#postcode').val('');
					var address = $('#address').val('');
					var detailAddress = $('#detailAddress').val('');
					var extraAddress = $('#extraAddress').val('');
					swal("", "주소가 변경되었습니다.", "success");
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		

		//휴대폰 번호 인증
		var isphoneChecked = false; // 전화번호 인증 여부를 저장하는 변수
		$(document).on("click", "#phoneChk", function() {
			var phone = $("#phone").val().trim();
			if (!strToInt(phone)) {
				return;
			}
			swal("", "인증번호 발송이 완료되었습니다.휴대폰에서 인증번호 확인을 해주세요.", "success");
			$.ajax({
				type : "post",
				url : "./phoneCheck",
				data : {phone : phone},
				success : function(data) {
					
					update();
					var clickCnt = 0;
					
					// 1분(60,000 밀리초) 후에 else 블록 실행
				    var timeoutId = setTimeout(function() {
				        // 본인 인증이 1분 안에 완료되지 않은 경우
				        swal("", "인증 번호를 다시 받으세요.", "error");
				        $("#phone").attr("readonly", false);
				        $("#phone").val('');
				        $("#phone2").val('');
				        $("#phoneChk").attr("disabled", false);
				        $("#phone2").attr("disabled", true);
				    }, 180000); // 180,000 밀리초 (3분) 후에 실행
					
					$(document).on("click", "#phoneChk2", function() {
						clickCnt++;
						
						if (data == $("#phone2").val().trim()) {
							clearTimeout(timeoutId);// timeoutId를 해제
							swal("", "본인 인증이 확인되었습니다.", "success");
							$("#phoneChk2").attr("disabled", true);
							$("#phoneChk2").css("background-color", '#4682B4');
							isphoneChecked = true;
						} else if (clickCnt < 5) {
							swal("", "인증 번호가 틀렸습니다. 다시 시도하세요.", "error");
							$("#phoneChk").attr("disabled",true);
							$("#phone").attr("readonly",true);
						} else if (clickCnt >= 5) {
							swal("", "인증 번호를 다시 받으세요.", "error");
							$("#phone").attr("readonly", false);
							$("#phone").val('');
							$("#phone2").val('');
							$("#phoneChk").attr("disabled", false);
							$("#phone2").attr("disabled",true);
						}
					});
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});

		function strToInt(str) {
			if (str.length > 11 || str.length < 10) {
				swal("", "다시 입력하세요.", "error");
				return false;
			}

			for (let i = 0; i < str.length; i++) {
				if (isNaN(parseInt(str[i]))) {
					// 숫자가 아닌 문자가 중간에 포함된 경우
					swal("", "숫자만 입력하세요.", "error");
					return false;
				}
			}
			// 숫자로만 이루어진 문자열을 정수로 변환하여 반환
			return parseInt(str);
		}
		
		function update(){
			$("#phone2").attr("disabled",false);
	   		$("#phone2").attr("placeholder","인증번호를 입력하세요...");
	   		$("#phoneChk").attr("disabled",true);
	   		$("#phoneChk2").attr("disabled",false);
	   		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
	   		$(".successPhoneChk").css("color","#4682B4");
	   		$("#phone").attr("readonly",true);
		}
		
		// 전화번호 변경
		$(document).on('click','.phonechbtn',function() {
			var phone = $('#phone').val().trim();
			
			// 인증을 하지 않은 경우
			if (phone != '' && !isphoneChecked) {
				swal("", "전화번호 인증을 해주세요.", "error");
				return false;
			}
			
			$.ajax({
				url : './phoneUpdate',
				type : 'post',
				data: {phone: phone},
				dataType : 'json',
				success : function(data) {
					$(".phone-form").empty();
					
					var detailElement = '<div class="detail">' +
				    '<input class="input" type="tel" id="phone" name="phone" placeholder="전화번호를 입력하세요.">' +
				    '<button class="phonechbtn infobtn" style="float: right;">전화번호 변경</button><br>' +
				    '<input class="infobtn" type="button" id="phoneChk" style="background: #FF9C41;" value="인증번호 받기">' +
				    '<input style="margin-top: 5px;" class="input" id="phone2" type="text" disabled required /><br>' +
				    '<input class="infobtn" type="button" id="phoneChk2" style="background: #FF9C41;display: inline-block;" value="본인인증" disabled="disabled">' +
				    '<span style="color: red;" class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>' +
				    '<input type="hidden" id="phoneDoubleChk" />' +
				    '</div>';
				    
			        // HTML 엘리먼트를 삽입하거나 교체
			        $(".phone-form").html(detailElement);
					swal("", "전화번호가 변경되었습니다.", "success");
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
	</script>
</body>
</html>