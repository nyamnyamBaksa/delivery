<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<link href="css/reviewwrite.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="./js/wnInterface.js"></script> 
<script src="./js/mcore.min.js"></script> 
<script src="./js/mcore.extends.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
const M = window.M;
$(document).on("click", ".cameraimg", function() {
	M.media.picker({
		  mode: "SINGLE",
		  media: "PHOTO",
		  column: 3,
		  callback: function( status, result ) {
	            console.log("Picker callback executed with status:", status);
	            console.log("Selected file path:", result.path);
		    var fileList = [], fileCont = {};
		    fileCont.name = "file";
		    fileCont.content = result.path;
		    fileCont.type = 'FILE';
		    fileList.push(fileCont);
		    M.net.http.upload({
		      url: "http://172.30.1.87/reviewwrite/img",
		      header: {},
		      params: {index : "3"},
		      body: fileList,
		      encoding : "UTF-8",
		      finish : function(code, header, body, status, error) {
		        if (status == 'SUCCESS') {
		         	// 이미지를 업데이트
		         	var jsonObject = JSON.parse(body);
		         	var reviewImg = jsonObject.reviewImg;
		         	var imgSrc = $('.imgSrc').val(reviewImg); 
	                var newImageSrc = '/img/review/' + reviewImg;
                    var rphotoElement = '<img class="rphoto" src="' + newImageSrc + '"style="width:150px;height:150px;border-radius: 70px;margin: 0 auto">';
                    $(".rphoto").replaceWith(rphotoElement);
		        } else{
		            M.pop.alert( status + " / " + error );
		        }
		     }
		   });
	  	}
	});
});
</script>
</head>
<body>
<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 3px 3px 3px gray;">
    <i class="fa-solid fa-arrow-left fa-xl" style="color: black; font-size: 2rem;  margin-top: 30px;"></i>
</a>
	<h1>리뷰쓰기</h1>
	<hr class="hr">
	<c:choose>
	
	<c:when test="${sessionScope.mname ne null }">
	
	<div class="reviewBox">
		<div>
			<c:forEach items="${reviewgroup}" var="row" varStatus="loop">
				<c:if test="${loop.first || row.sno ne reviewgroup[loop.index - 1].sno}">
				<br>
				<div class="sname">${row.sname }</div>
					<form action="/reviewwrite" method="post">
						 <fieldset class="rate">
						   <span style="width: 50%"></span>
		                   		<input type="radio" id="rating5" name="rating" value="5" checked><label for="rating5" title="5점">★</label>
		                        <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="4점">★</label>
		                        <input type="radio" id="rating3" name="rating" value="3"><label for="rating3" title="3점">★</label>
		                        <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="2점">★</label>
		                        <input type="radio" id="rating1" name="rating" value="1"><label for="rating1" title="1점">★</label>
		                  </fieldset>
					  <textarea class="reviewtextarea" name="review" placeholder="음식에 대한 솔직한 리뷰를 남겨주세요."></textarea>
					  <input type="hidden" value="${row.sno }" name="sno">
					  <input type="hidden" value="${row.tgroup}" name="tgroup">
					  <input name="rphoto" class="imgSrc" style="display:none;">
					  <button type="submit" class="reviewBtn">
					  	<span class="reviewBtntext">완료</span>
					  </button>
					</form>
					
					<button class="cameraimg" ">사진 업로드</button>
					  <hr>
					  <img class="rphoto" src="" style="width:150px;height:150px; margin: 0 auto;">
					  <div class="menutitle">추천하고 싶은 메뉴가 있나요?</div>
				</c:if>
					<div class="mnname">${row.mnname }<img alt="추천엄지" src="/img/thumbs.png" style="height:15px; width:15px;"></div>
			</c:forEach>

		
		
		</div>
	</div>
	</c:when>
		
		<c:otherwise>
			<li>로그인을 해주세요.</li>
			<a href="login">
        		<button>로그인하러 가기</button>
        	</a>
		</c:otherwise>
	</c:choose>
</body>
</html>