<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	
	<div>
	<form action="./join" method="post">
		<div class="idBox">
			<input class="input" type="text" name="mid" placeholder="아이디">
			<button id="idCheck" type="button" class="idbutton">중복검사</button>
			<br><span id="resultMSG"></span>
		</div>
		<div class="pwBox1">
        	<input class="input" type="password" name="mpw1" id="pw1" placeholder="비밀번호">
        </div>
        <div class="poBox2">
         	<input class="input" type="password" name="mpw" id="pw2" placeholder="비밀번호 확인">
            <br><span id="pwresultMSG"></span>
        </div>  
        <div class="nameBox">
        	<input class="input" type="text" name="mname" id="mname" placeholder="이름">
        </div>
      	<div class="nickname">
        	<input class="input" type="text" name="mnickname" id="nickname" placeholder="닉네임">
        </div>
        <div class="addrBox">
           <input class="input" type="text" name="maddr" id="maddr" placeholder="주소">
        </div>
        <div class="phoneBox">
          	<input class="input" type="text" name="mphone" id="mphone" placeholder="전화번호">
          	<button id="idCheck" type="button" class="idbutton">본인인증</button>
        </div>
        <div>
        <br>
	    	<button class="Jbutton" type="reset">취소</button>
	        <button class="Jbutton" type="submit" id="joinjoin">회원가입</button>
        </div>
	</form>
	</div>
</body>
</html>