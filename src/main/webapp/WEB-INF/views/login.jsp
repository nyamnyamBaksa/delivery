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
				alert("아이디를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			
			//자동로그인 체크
			let autologinCheckbox = $("#autologinCheckbox").is(":checked");
			
			//자동로그인 체크했다면
			if(autologinCheckbox){
				alert("자동로그인에 체크되었습니다.");
			}
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