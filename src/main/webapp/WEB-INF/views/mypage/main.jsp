<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
<link rel="stylesheet" href="../css/mypage-main.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
	<div class="mypage">
		<div class="mypageFont">마이페이지</div>
	</div>
    <c:if test="${sessionScope.mid ne null}">
        <div class="profile" onclick="popup('${sessionScope.mid}')"><!-- 작은 따옴표로 감싸기 -->
            <img class="profile-image" src="/img/profileImg/${result.mprofile}" onerror="this.src='/img/profileImg/basic_profile.png'" id="userProfileImage"/>
        </div>
        <div class="nickname">${result.mname }&nbsp;<img src="/img/profileImg/arrow_right.png" onclick=""></div>
        <button class="follow" onclick="">+ 밥 친구 추가</button>
        <div class="HowManyfollow">밥 친구&nbsp;${follow.friend } &nbsp;|&nbsp; 친구 요청&nbsp;${follow.friendreq }</div>
        <div class="diary"><a href="./diary"><img src="/img/profileImg/diary.png" onclick=""></a><p>냠냠 다이어리</p></div>
        <div class="zzim"><img src="/img/profileImg/heart.png" onclick=""><p>나의 찜</p></div>
        <div class="review"><img src="/img/profileImg/review.png" onclick=""><p>리뷰관리</p></div>
        <div class="coupon"><img src="/img/profileImg/coupon.png" onclick=""><p>쿠폰함</p></div>
        <div class="pay"><img src="/img/profileImg/credit_card.png" onclick=""><p>냠냠페이</p></div>
        <div class="favoriteStore">${result.mname }님의 최애 맛집은?</div>
    </c:if>
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width: 500px;">
			<div class="modal-content"">
				<div class="modal-header" style="color: blue;">
					<!-- 프로필 이미지 업로드 폼 -->
					<form id="profileImageForm" enctype="multipart/form-data">
					    <input type="file" name="profileImage" id="profileImageInput" accept="image/*" style="display: none">
					    <h5 class="modal-title ok" id="exampleModalLabel">
						    <label for="profileImageInput" style="cursor: pointer;">
						    	프로필 사진 바꾸기
						    </label>
					    </h5>
					</form>
				</div>
				<div class="modal-header" style="color: red;">
					<h5 class="modal-title notok" id="exampleModalLabel" style="cursor: pointer;">취소</h5>
				</div>
			</div>
		</div>
	</div>
	<!-- ALL JS FILES -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function popup(mid){
		$("#exampleModal").modal("show");
		
		// 파일 선택(input)의 변경 이벤트 리스너
	    $('#profileImageInput').on('change', function () {
	        let selectedFile = this.files[0];

	        if (!selectedFile) {
	            return; // 파일을 선택하지 않았을 때 처리
	        }

	        let formData = new FormData();
	        formData.append('file', selectedFile);

	        $.ajax({
	            url: './updateProfileImg',
	            type: 'POST',
	            data: formData,
	            contentType: false,
	            processData: false,
	            success: function (response) {
	            	location.href="./main";
	            },
	            error: function () {
	                alert('서버와 통신 중 오류 발생');
	            }
	        });
		
		});
		
	    $('.notok').on('click', function() {
            $('#exampleModal').modal('hide');
        });
	}

	</script>
</body>
</html>