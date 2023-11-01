<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
/*  	let sid = getCookie("SuserID");
		let setS = getCookie("setS");
		let userID = getCookie("userID");
		let setY = getCookie("setY");  */
		
		//로그인 버튼 클릭하면 작동
		$("#loginBtn").click(function(){
			let id = $("#id").val();
			let pw = $("#pw").val();
			
			//유효성 검사
			if(id == "" || id.length < 3){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if(pw == "" || pw.length < 3){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			
/* 			//자동로그인 체크
			let autologinCheckbox = $("#autologinCheckbox").is(":checked");
			
			//자동로그인 체크했다면
			if(autologinCheckbox){
				alert("자동로그인에 체크되었습니다.");
				
				$.ajax({
					url : "./autologinCheckbox",
					type : "post",
					data : {id : id, pw : pw},
					dataType : "json",
					success : function(data) {
						
						if(data.auto == 1){
							alert("쿠키저장");
							setCookie
							
						} else if(data.auto == 0) {
							alert("정보를 다시 입력해주세요.");
						}
					},
					error : function(error){
						alert("에러");
					}
				});
			} return false;
		}); */
		
		/* // 쿠키 저장
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
		} */
	});
	});
</script>
</head>
<body>
	<h1>login</h1>


	<div class="loginBox">
		<form action="./login" method="post">
			<div>
				<input type="text" class="id" id="id" name="id" placeholder="아이디">
			</div>
			<div>
				<input type="text" class="pw" id="pw" name="pw" placeholder="비밀번호">
			</div>
			<div class="autologin">
				<input type="checkbox"  id="autologinCheckbox">
				<label for="autologinCheckbox">자동로그인</label>
			</div>
			<div>
				<button type="submit" class="loginBtn" id="loginBtn">로그인</button>
			</div>
			<div>
				<a href="join">
					<button type="button" class="joinBtn">회원가입</button>
				</a>
			</div>
		</form>
	</div>

</body>
</html>