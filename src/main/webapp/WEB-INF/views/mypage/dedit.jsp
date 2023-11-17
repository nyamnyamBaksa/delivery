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
<link rel="stylesheet" href="/css/mypage-diary.css">
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
<!-- Include stylesheet -->
<link href="/css/quill.snow.css" rel="stylesheet">
<!-- 폰트 -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style type="text/css">
body {
	font-family: 'NanumSquareNeo';
}
 #editor{
 	height:500px;
 	width:100%;
 	margin-bottom: 15px;
 }
 #title{
 	height:30px;
 	width:50%;
 	margin-bottom: 15px;
 }
</style>
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
	<div class="title">
		<div class="titleFont">냠냠 다이어리 수정</div>
	</div>
	<div style="margin-top: 170px;"></div>
		<div class="cart-box-main">
			<div class="container">
				<div class="col-lg-12">
				<form action="/mypage/dedit" method="post"  onsubmit="return dedit()">
					<input name="bno" style="display: none;" value="${bno }">
					<div id="editor">${result.bcontent }</div>
					<input type="hidden" id="quill_html" name="content">
					<button type="submit" class="dwrite" style="width:100px;height:35px;cursor:pointer;">글쓰기</button>
				</form>
				</div>
			</div>
		</div>
	</c:if>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sweetalert.min.js"></script>
	<!-- Include the Quill library -->
	<script src="/js/quill.js"></script>
	
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
	
		var quill = new Quill('#editor', {
	        modules:{toolbar: [
	            [{header: [1,2,false] }],
	            ['bold', 'italic', 'underline'],
	            ['image', 'code-block'],
	            [{ list: 'ordered' }, { list: 'bullet' }]
	        ]
	    },
	    theme: 'snow'
	  	});
	  	
	  	quill.on('text-change', function() {
	        document.getElementById("quill_html").value = quill.root.innerHTML;
		});
  	
	  	function dedit(){
			let content = $('#quill_html').val().trim();
			if(content === '<p><br></p>' || content == ''){
				swal('', '내용을 입력하세요.', "error");
				$('#content').focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>