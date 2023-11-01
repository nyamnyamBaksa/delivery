<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
	<link rel="stylesheet" href="/css/mypage-main.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<!-- sweetalert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	
</head>
<body>
    <c:if test="${sessionScope.mid ne null}">
		<div class="mypage">
			<div class="mypageFont">마이페이지</div>
		</div>
		
    	<div class="myid" style="display: none;">${sessionScope.mid }</div><!-- 내 아이디 -->
    	<div class="id" style="display: none;">${id }</div><!-- 방문자 아이디 -->
    	<div class="babfriend" style="display: none;">${babfriend }</div><!-- 밥친구 -->
        <div class="profile"><!-- onclick="popup('${sessionScope.mid}')" 작은 따옴표로 감싸기 -->
            <img class="profile-image" src="/img/profileImg/${result.mprofile}" onerror="this.src='/img/profileImg/basic_profile.png'" id="userProfileImage"/>
        </div>
        <div class="nickname">${result.mname }&nbsp;<c:if test="${id eq null || sessionScope.mid eq id }"><a href="/mypage/info"><img src="/img/profileImg/arrow_right.png"></a></c:if></div>
        <c:if test="${sessionScope.mid ne id }">
	        <c:choose>
	        	<c:when test="${babfriend eq 0 }">
	        		<button class="babfriend-btn follow">+ 밥 친구 신청</button>
	        	</c:when>
	        	<c:when test="${babfriend eq 1 }">
	        		<button class="babfriend-btn unfollow1">+ 밥 친구 신청 취소</button>
	        	</c:when>
	        	<c:when test="${babfriend eq 2 }">
	        		<button class="babfriend-btn followAccept">+ 밥 친구 신청 수락</button>
	        	</c:when>
	        	<c:when test="${babfriend eq 3 }">
	        		<button class="babfriend-btn unfollow3">+ 밥 친구 취소</button>
	        	</c:when>
	        </c:choose>
        </c:if>
        
        <div class="HowManyfollow">밥 친구&nbsp;${follow.friend }&nbsp;
        	<c:if test="${id eq null || sessionScope.mid eq id }">|&nbsp; <span style="cursor: pointer;" class="followAsk">친구 요청&nbsp;${follow.friendreq }</span></c:if>
        </div>
        <c:if test="${id eq null || sessionScope.mid eq id }">
        	<div class="diary"><a href="/mypage/diary"><img src="/img/profileImg/diary.png"></a><p>냠냠 다이어리</p></div>
        	<div class="zzim"><a href="/wishlist"><img src="/img/profileImg/heart.png"></a><p>나의 찜</p></div>
        	<div class="review"><a href="/mypage/review"><img src="/img/profileImg/review.png"></a><p>리뷰관리</p></div>
        	<div class="coupon"><a href="/mypage/coupon"><img src="/img/profileImg/coupon.png"></a><p>쿠폰함</p></div>
	        <div class="pay"><a href="/mypage/pay"><img src="/img/profileImg/credit_card.png"></a><p>냠냠페이</p></div>
        </c:if>
        <c:if test="${sessionScope.mid ne id }">
        	<div class="diary"><a href="/mypage/diary/${id }"><img src="/img/profileImg/diary.png"></a><p>냠냠 다이어리</p></div>
        	<div class="zzim"><a href="/wishlist/${id }"><img src="/img/profileImg/heart.png"></a><p>나의 찜</p></div>
        	<div class="review"><a href="/mypage/review/${id }"><img src="/img/profileImg/review.png"></a><p>리뷰관리</p></div>
        </c:if>
        
        <div class="favoriteStore">'${result.mname }'님의 최애 맛집은?</div>
        <c:forEach items="${toplist }" var="row" varStatus="loopStatus">
	        <div class="favoriteStoreComponent">
	        	&nbsp;<i class="bi bi-trophy-fill" style="color:
		            <c:choose>
		                <c:when test="${loopStatus.index % 3 == 0}"> gold </c:when>
		                <c:when test="${loopStatus.index % 3 == 1}"> silver </c:when>
		                <c:when test="${loopStatus.index % 3 == 2}"> #cd7f32 </c:when>
		            </c:choose>
		        "></i>&nbsp;
	        	<span style="font-size:large;font-weight:bold;">${row.sname }</span>
	        	<span style="float:right;font-size:large;font-weight:bold;">${row.count }회 주문</span>
	        </div>
	    </c:forEach>
	    
	    <div class="favoriteCate">
	    	'${result.mname }'님은&nbsp;<span class="topCate">${favoritecate[0].mncatename }</span>&nbsp;러버!
	    </div>
	    <div class="favoriteCateGoogleChart" id="donutchart" style="width: 700px; height: 300px;"></div>    
    </c:if>
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width: 500px;">
			<div class="modal-content">
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
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<!-- Google Charts 라이브러리 로드 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<script type="text/javascript">
	
	$(document).on("click", ".profile", function() {
		var myid = $(".myid").text();
		var id = $(".id").text();
		if(myid == id || id == ''){
			$("#exampleModal").modal("show");
		}
		
		// 파일 선택(input)의 변경 이벤트 리스너
	    $('#profileImageInput').on('change', function () {
	        let selectedFile = this.files[0];

	        if (!selectedFile) {
	            return; // 파일을 선택하지 않았을 때 처리
	        }

	        let formData = new FormData();
	        formData.append('file', selectedFile);

	        $.ajax({
	            url: '/mypage/updateProfileImg',
	            type: 'POST',
	            data: formData,
	            contentType: false,
	            dataType:'json',
	            processData: false,
	            success: function (data) {
	            	$("#exampleModal").modal("hide");
	            	// 이미지를 업데이트
	                var newImageSrc = '/img/profileImg/' + data.profileImg;
	                $("#userProfileImage").attr('src', newImageSrc);
	            },
	            error: function () {
	            	swal('', '서버와 통신 중 오류 발생', "error");
	            }
	        });
		
		});
		
	    $('.notok').on('click', function() {
            $('#exampleModal').modal('hide');
        });
	});
	
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
	
	$(document).on("click", ".follow, .unfollow1, .followAccept, .unfollow3 , .followAcceptModal", function() {
		var myid = $(".myid").text();
		var id = $('.id').text();
		var modal = $('.followerMid').text();
		let i = 0;
	    let $icon = $(this);
	    if ($icon.hasClass('follow')) {
	        i = 0;
	    } else if ($icon.hasClass('unfollow1')) {
	    	i = 1;
	    } else if ($icon.hasClass('followAccept')) {
	    	i = 2;
	    } else if ($icon.hasClass('followAcceptModal')){
	    	i = 4;
	    } else {
	    	i = 3;
	    }
	    
	    if(id == ''){
	    	id = 'String';
	    }
	    
		$.ajax({
            url: '/mypage/updateFollow',
            type: 'post',
            data: {myid:myid, id:id, i:i, modal:modal},
            dataType:'json',
            success: function (data) {
            	if(data.result == 1){
            		if(data.i == 0){
	            		swal('', '밥친구 신청을 완료했어요.', "success");
            		} else if(data.i == 1){
            			swal('', '밥친구 신청을 취소했어요.', "success");
            		} else if(data.i == 2){
            			swal('', '밥친구가 되었어요.', "success");
            		} else if(data.i == 4){
            			swal('', '밥친구가 되었어요.', "success");
                        $("#exampleModal").modal("hide");
            			// HowManyfollow 업데이트
                        var $howManyFollow = $(".HowManyfollow");
                        $howManyFollow.html('밥 친구 ' + data.follow.friend + ' ');
                        $howManyFollow.append('|&nbsp;<span class="followAsk">친구 요청 ' + data.follow.friendreq + '</span>');
            		} else {
            			swal('', '밥친구를 취소했어요.', "success");
            		}
            		
            		$('.babfriend').text(data.babfriend);
            		var button = $('.babfriend-btn');

                    button.removeClass('follow unfollow1 followAccept unfollow3');

                    if (data.babfriend == 0) {
                        button.addClass('follow');
                        button.text('+ 밥 친구 신청');
                    } else if (data.babfriend == 1) {
                        button.addClass('unfollow1');
                        button.text('+ 밥 친구 신청 취소');
                    } else if (data.babfriend == 2) {
                        button.addClass('followAccept');
                        button.text('+ 밥 친구 신청 수락');
                    } else {
                        button.addClass('unfollow3');
                        button.text('+ 밥 친구 취소');
                    }
                    
                    
            	}
            },
            error: function () {
                swal('', '서버와 통신 중 오류 발생', "error");
            }
        });
	});
	
	$(document).on("click", ".followAsk", function() {
	    var myid = $(".myid").text();
	    $.ajax({
	        url: '/mypage/followAsk',
	        type: 'POST',
	        data: { myid: myid },
	        dataType: 'json',
	        success: function (data) {
	        	if(data.list.length == 0){
	        		return;
	        	}
	            var modalContent = $(".modal-content");
	            modalContent.empty();

	            $.each(data.list, function (index, row) {
	                var newContent = '<div class="modal-header">' +
	                    '<h5 class="modal-title" id="exampleModalLabel"><img class="profile-image-follow" src="/img/profileImg/' + row.mprofile + '" onerror="this.src=\'/img/profileImg/basic_profile.png\'" />' + row.mname + '</h5>' +
	                    '<div class="modal-body"><div class="detail">' +
	                    '<div class="detail-date-read"><div class="detail"><button class="followAcceptModal">+ 밥 친구 신청 수락</button><div>' +
	                    '</div></div></div>' +
	                    '<div class="followerMid" style="display: none;">' + row.mid + '</div>';
	                modalContent.append(newContent);
	            });
	            $("#exampleModal").modal("show");
	        },
	        error: function () {
	        	swal('', '서버와 통신 중 오류 발생', "error");
	        }
	    });
	});
	
	
		 // 차트
		 google.charts.load("current", {packages:["corechart"]});
	     google.charts.setOnLoadCallback(drawChart);
	    
	     function drawChart() {
	   	 
	     
    	 var data = google.visualization.arrayToDataTable([
    	      ['카테고리', '횟수'],
    	      <c:forEach items="${favoritecate}" var="item" varStatus="loop">
    	        ['${item.mncatename}', ${item.count}]<c:if test="${not loop.last}">,</c:if>
    	      </c:forEach>
    	 ]);

	
	      var options = {
	        title: '',
	        pieHole: 0.5,
	        colors: ['#FF7518', '#FFA36D', '#ED9121', '#FFD073'],
	      };
	
	      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	      chart.draw(data, options);
	    }
    </script>
</body>
</html>