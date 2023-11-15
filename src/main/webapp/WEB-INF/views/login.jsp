<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet">
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
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
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
	});
});
</script>
<script type="text/javascript">
function naverLogin(){
	location.href="https://nid.naver.com/oauth2.0/authorize?client_id=59vsSNIzNRQBcSk4rubJ&redirect_uri=http://localhost/login/naver&response_type=code";
}
</script>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>
<body>
	<h1>login</h1>
	<hr class="hr">

	<div class="loginBox">
		<form action="./login" method="post">
			<div>
				<input type="text" class="id" id="id" name="id" placeholder="아이디">
			</div>
			<div>
				<input type="password" class="pw" id="pw" name="pw" placeholder="비밀번호">
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