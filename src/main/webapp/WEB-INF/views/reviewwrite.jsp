<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<link href="css/reviewwrite.css" rel="stylesheet">
<script src="./js/wnInterface.js"></script> 
<script src="./js/mcore.min.js"></script> 
<script src="./js/mcore.extends.js"></script> 
<script>
/* function M.net.http.upload({
	alert("클리댐");
    url: "http://lab.morpheus.kr/api/test/file/upload",
    header: {},
    params: {},
    body: [
    { content: "파일업로드", type: "TEXT" },
    { name: "imgs", content: "test.zip", type: "FILE" },
    { name: "imgs", content: "test/test1.txt", type: "FILE" },
    { name: "imgs", content: "test/test2.txt", type: "FILE" }
    ],
    encoding : "UTF-8",
    finish : function(status, header, body, setting) {
    console.log(status);
    },
    progress : function(total, current) {
    console.log(total, current);
    }
}); */
$(function () {

    $.imagePicker = function () {
      return new Promise((resolve) => {
        M.media.picker({
          mode: "SINGLE",
          media: "PHOTO",
          // path: "/media", // 값을 넘기지않아야 기본 앨범 경로를 바라본다.
          column: 3,
          callback: (status, result) => {
            resolve({ status, result })
          }
        });
      })
    }

    $.convertBase64ByPath = function (imagePath) {
      if (typeof imagePath !== 'string') throw new Error('imagePath must be string')
      return new Promise((resolve) => {
        M.file.read({
          path: imagePath,
          encoding: 'BASE64',
          indicator: true,
          callback: function (status, result) {
            resolve({ status, result })
          }
        });
      })
    }

    $.uploadImageByPath = function (targetImgPath, progress) {
      return new Promise((resolve) => {
        const _options = {
          url: `${location.origin}/file/upload`,
          header: {},
          params: {},
          body: [
            // multipart/form-data 바디 데이터
            { name: "file", content: targetImgPath, type: "FILE" },
          ],
          encoding: "UTF-8",
          finish: (status, header, body, setting) => {
            resolve({ status, header, body })
          },
          progress: function (total, current) {
            progress(total, current);
          }
        }
        M.net.http.upload(_options);
      })
    }

  });
</script>
</head>
<body>
	<a href="/trade">뒤로가기</a>
	<h1>리뷰쓰기</h1>
	<hr class="hr">
	<c:choose>
	<c:when test="${sessionScope.mname ne null }">
	
	<div class="reviewBox">
		<div>
			<c:forEach items="${reviewgroup}" var="row" varStatus="loop">
				<c:if test="${loop.first || row.sno ne reviewgroup[loop.index - 1].sno}">
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
					  <button type="submit" class="reviewBtn">
					  	<span class="reviewBtntext">완료</span>
					  </button>
					</form>
					<div>
    <button id="picker">M.media.picker</button>
  </div>
  <div id="box"></div>
  <div>
    <button id="upload">Upload Current Image</button>
  </div>
  <div id="progress"></div>
  <div id="upload-box"></div>
					<button class="cemeraimg" onclick="M.net.http.upload()">사진 업로드</button>
					  <hr>
					  <div class="menutitle">추천하고 싶은 메뉴가 있나요?</div>
				</c:if>
					<div class="mnname">${row.mnname }<img alt="추천엄지" src="/img/thumbs.png" style="height:15px; width:15px;"></div>
			</c:forEach>

		
		
		</div>
	</div>
	</c:when>
		
		<c:otherwise>
			<li>로그인을 해주세요.</li>
		</c:otherwise>
	</c:choose>
</body>
</html>