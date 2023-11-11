<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/join.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
	
	let isIdChecked = false; // 아이디 중복 검사 여부를 나타내는 변수
    $("#idCheck").click(function() {
             let mid = $("#mid").val();

             if (mid == "" || mid.length < 3) {
                $("#resultMSG").text("아이디는 3글자 이상이어야 합니다.");
            /*     $("#resultMSG").css("font-weight", "bold");
                $("#resultMSG").css("font-size", "15pt"); */
             } else {
                $.ajax({
                   url : "./checkID",
                   type : "post",
                   data : {
                      "mid" : mid
                   },
                   dataType : "json",
                   success : function(data) {
                      if (data == 1) {
                         $("#resultMSG").text("이미 등록된 아이디입니다.");
                         isIdChecked = false;
                      } else {
                         $("#resultMSG").text("가입할 수 있습니다.");
                         isIdChecked = true;
                      }
                   },
                   error : function(request, status, error) {
                      $("#resultMSG").text("실패시 결과값 : " + error);
                   }
                });
             }
             return false;
          });
	
    $("#pw2").on('input', function() {
        let pw1 = $("#pw1").val();
        let pw2 = $(this).val();

        if (pw1 == pw2) {
           $("#pwresultMSG").text("비밀번호가 일치합니다.");
           return;
        } else {
           $("#pwresultMSG").text("비밀번호가 일치하지 않습니다.");
        }
     });
    
    $("#joinjoin").click(function(){
        let mid = $("#mid").val();
        let pw1 = $("#pw1").val();
        let pw2 = $("#pw2").val();
        let mname = $("#mname").val();
        let mphone = $("#mphone").val();
        let nickname = $("#nickname").val();
		let maddr = $("#maddr").val();
  
        
         if (!isIdChecked) {
            alert("아이디 중복 검사를 실행하세요.");
             return false; // 회원가입 종료
        }
        if (pw1 != pw2) {
        	alert("비밀번호를 확인하세요.");
           return false;
        }
        if (mname.length > 4 || mname.length == "" || mname.length <= 1) {
        	alert("이름을 정확히 입력해주세요.");
           return false;
        }
        if(nickname.length == ""){
        	alert("닉네임을 입력해주세요.");
        	return false;
        }
        if (maddr.length == "") {
        	alert("주소를 입력해주세요");
           return false;
        }
        
        if (mphone.length != 11) {
        	alert("핸드폰 번호 11자리를 정확히 입력해주세요.");
           return false;
        }

        
    });

});
</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("maddr").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("maddr").value = data.address; // 주소 넣기
	              /*   document.querySelector("maddr1").focus(); //상세입력 포커싱 */
	            }
	        }).open();
	    });
	}
	</script>
</head>
<body>

	<h1>회원가입</h1>
	<hr class="hr">
	<div class=joinBox>
	<form action="./join" method="post">
		<div class="idBox">
			<input class="input" type="text" name="mid" id="mid" placeholder="아이디">
			<button id="idCheck" type="button" class="idCheck">중복확인</button>
			<br><span class="resultMSG" id="resultMSG"></span>
		</div>
		<div class="pwBox1">
        	<input class="input" type="password" name="mpw1" id="pw1" placeholder="비밀번호">
        </div>
        <div class="poBox2">
         	<input class="input" type="password" name="mpw" id="pw2" placeholder="비밀번호 확인">
            <br><span class="pwresultMSG" id="pwresultMSG"></span>
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

        </div>
        <div>
        <br>
	        <button class="Jbutton" type="submit" id="joinjoin">회원가입</button>
        </div>
	</form>
	</div>
</body>
</html>