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
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="./js/wnInterface.js"></script> 
<script src="./js/mcore.min.js"></script> 
<script src="./js/mcore.extends.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(function() M.net.http.upload{
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
});
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

  })


$(function () {

    let selectImagePath = '';
    let $previewImg = null;
    let $uploadImg = null;
    const $box = $('#box');
    const $uploadBox = $('#upload-box');
    const $progress = $('#progress');
    const $picker = $('#picker');
    const $upload = $('#upload');



    $picker.on('click', () => {
      if ($previewImg !== null) {
        $previewImg.remove();
        $previewImg = null;
      }
      selectImagePath = '';
      $.imagePicker()
        .then(({ status, result }) => {
          if (status === 'SUCCESS') {
            selectImagePath = result.path;
            return $.convertBase64ByPath(selectImagePath)
          } else {
            return Promise.reject('이미지 가져오기 실패')
          }
        })
        .then(({ status, result }) => {
          if (status === 'SUCCESS') {
            $previewImg = $(document.createElement('img'))
            $previewImg.attr('height', '200px')
            $previewImg.attr('src', "data:image/png;base64," + result.data)
            $box.append($previewImg);
          } else {
            return Promise.reject('BASE64 변환 실패')
          }
        })
        .catch((err) => {
          if (typeof err === 'string') alert(err)
          console.error(err)
        })
    })

    $upload.on('click', () => {
      if (selectImagePath === '') return alert('이미지를 선택해주세요.')
      if ($uploadImg) {
        $uploadImg.remove();
        $uploadImg = null;
      }
      $progress.text('')
      $.uploadImageByPath(selectImagePath, (total, current) => {
        console.log(`total: ${total} , current: ${current}`)
        $progress.text(`${current}/${total}`)
      })
        .then(({
          status, header, body
        }) => {
          // status code
          if (status === '200') {
            $progress.text('업로드 완료')
            const bodyJson = JSON.parse(body)
            $uploadImg = $(document.createElement('img'))
            $uploadImg.attr('height', '200px')
            $uploadImg.attr('src', bodyJson.fullpath)
            $uploadBox.append($uploadImg)
          } else {
            return Promise.reject('업로드를 실패하였습니다.')
          }
        })
        .catch((err) => {
          if (typeof err === 'string') alert(err)
          console.error(err)
        })
    })
  });
</script>
</head>
<body>
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    <i class="fa-solid fa-arrow-left fa-xl" style="color: black;"></i>
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