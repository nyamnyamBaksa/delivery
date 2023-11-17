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
	<!-- 폰트 -->
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
	<style type="text/css">
	* {
	font-family: 'NanumSquareNeo';	
}
		.col-lg-12{
			position: absolute;
			top: 24%;
			left: 3%;
			right: 3%;
			bottom: 35%;
		}
		
		.col-lg-13{
			position: absolute;
			top: 12%;
			left: 10%;
			right: 3%;
		}
		td{
			font-size: 20px;
			vertical-align: middle;
		}
	</style>
</head>
<body>
	<c:if test="${sessionScope.mid ne null}">
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
	<div class="title">
		<div class="titleFont">냠냠 다이어리</div>
	</div>
		<div class="cart-box-main">
			<c:if test="${list[0].count eq null}">
			<div class="container">
				<div class="col-lg-13">
					<h1 style="text-align: center;">다이어리 글이 없습니다.</h1>
				</div>
				<c:if test="${id eq null || sessionScope.mid eq id }">
					<button class="dwrite">글쓰기</button>
				</c:if>	
			</div>
		</c:if>
		<c:if test="${list[0].count ne null}">
			<div id="mid" style="display: none;">${sessionScope.mid }</div>
			<div id="id" style="display: none;">${id }</div>
			<div class="container">
				<span id="diarycount" style="display: none;">${list[0].count }</span>
				<c:if test="${id eq null || sessionScope.mid eq id }">
					<button class="dwrite">글쓰기</button>
				</c:if>
			</div>
			<div class="container">
				<div class="col-lg-12">
					<table class="table">
						<c:forEach items="${list }" var="row">
							<tr style="height: 100px;">
								<td class="name-pr"
									style="font-weight: bolder; border: 0; border-style: dashed; width: 300px;">${row.bcontent }</td>
								<td class="bbno" style="display: none;">${row.bno }</td>
								<td style="border: 0; border-style: dashed;">
									<c:if test="${id eq null || sessionScope.mid eq id }">
										<a href="/mypage/dedit/${row.bno}"><button class="dedit">수정</button></a>
									</c:if>
								</td>
								<td class="remove-pr" style="border: 0; border-style: dashed;">
									<c:if test="${id eq null || sessionScope.mid eq id }">
										<i style="cursor: pointer;align-items: center;" class="fas fa-times"></i>
									</c:if>
								</td>
							</tr>
							<tr style="border-bottom: 1px solid #c0c0c0;">
								<td class="quantity-box"
									style="border: 0; border-style: dashed; width: 100px;">${row.bdate }</td>
								<td class="bno" style="display: none;">${row.bno }</td>
								<td class="total-pr" style="border: 0; border-style: dashed; width: 60px;"><c:choose>
										<c:when test="${row.mylike eq 1}">
											<p>
												<i class="bi bi-heart-fill"
													style="margin-top: 5px;color: #EB5757; cursor: pointer;"></i>
												&nbsp;<span class="blike">${row.blike}</span>
											</p>
										</c:when>
										<c:otherwise>
											<p>
												<i class="bi bi-heart"
													style="margin-top: 5px;color: #EB5757; cursor: pointer;"></i>
												&nbsp;<span class="blike">${row.blike}</span>
											</p>
										</c:otherwise>
									</c:choose></td>
								<td class="total-pr"
									style="border: 0; border-style: dashed; width: 100px;">
									<p style="white-space: nowrap">
										<i class="bi bi-chat-dots"
											style="color: #EB5757; cursor: pointer; margin-right:5px; "></i>
											&nbsp;<span class="commentcount" data-bno="${row.bno}">${row.commentcount }</span>
									</p>
								</td>
							</tr>
						</c:forEach>
					</table>
					<button style="margin: 0 auto;" class="morebtn">+ 더보기</button>
		<div class="mouse" style="text-align: center;">
		<a href="#" class="mouse-icon">
			<div class="mouse-wheel"><i class="fa fa-chevron-up"></i></div>
		</a>
		</div>
				</div>
			</div>
			</c:if>
		</div>
	</c:if>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width: 500px;">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #E6E6FA;">
					<h5 class="modal-title" id="exampleModalLabel">본문제목</h5>
				</div>
				<div class="modal-body">
					<div class="detail">
						<div class="detail-date-read">
							<div class="detail-date">날짜</div>
							<div class="detail-read">조회수</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="/js/sweetalert.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
		// 총 개수
		var diarycount = $('#diarycount').text();
		// 조회 인덱스
		var offset = 0;	// 인덱스 초기값
		var count = 7;	// 7개씩 로딩
		
		// 더보기 버튼 삭제
		if(offset + 7 >= diarycount){
			$('.morebtn').remove();
		}

		// 더보기 클릭시
		$(document).on("click", ".morebtn", function(){
			offset += 7;
			readOldNotify(offset);
		});
			
		// 더보기 실행함수
		function readOldNotify(offset){
			var id = $("#id").text();
			var mid = $("#mid").text();
			if(id == ''){
				id = $('#mid').text();
			}
			let endIndex = offset+count-1;	// endIndex설정
			$.ajax({
				url: "/mypage/moreDiary",
				type: "post",
				async: "true",
				dataType: "json",
				data: {
					id: id,mid:mid,
					offset: offset,
					endIndex: endIndex
				},
				success: function (data) {
					var newRow = '';
					// 업데이트된 데이터로 표 채우기
					$.each(data.list,function(index, row) {
						newRow = '<tr style="height: 100px;">'
								+ '<td class="name-pr" style="font-weight: bolder;border: 0; border-style: dashed; width: 300px;">'
								+ row.bcontent
								+ '</td>'
								+ '<td class="bbno" style="display: none;">'
								+ row.bno
								+ '</td><td style="border: 0; border-style: dashed;">'

						if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
							newRow += '<a href="/mypage/dedit/${row.bno}"><button class="dedit">수정</button></a>';
						}
						newRow += '</td><td class="remove-pr" style="border: 0; border-style: dashed;">';
						
						if('${sessionScope.mid}' === '${id}' || '${id}' == ''){
							newRow += '<i style="cursor: pointer;" class="fas fa-times"></i>';
						}

						newRow += '</td>'
								+ '</tr>'
								+ '<tr style="border-bottom: 1px solid #c0c0c0;">'
								+ '<td class="quantity-box" style="border: 0; border-style: dashed; width: 100px;">'
								+ row.bdate
								+ '</td>'
								+ '<td class="bno" style="display: none;">'
								+ row.bno
								+ '</td>'
								+ '<td class="myid" style="display: none;">'
								+ '${sessionScope.mid}'
								+ '</td>'
								+ '<td class="total-pr" style="border: 0; border-style: dashed; width: 60px;">';

						if (row.mylike >= 1) {
							newRow += '<p>'
									+ '<i class="bi bi-heart-fill" style="margin-top: 5px;color: #EB5757; cursor: pointer;"></i>'
									+ '&nbsp;<span class="blike">'
									+ row.blike
									+ '</span>'
									+ '</p>';
						} else {
							newRow += '<p>'
									+ '<i class="bi bi-heart" style="margin-top: 5px;color: #EB5757; cursor: pointer;"></i>'
									+ '&nbsp;<span class="blike">'
									+ row.blike
									+ '</span>'
									+ '</p>';
						}

						newRow += '</td>'
								+ '<td class="total-pr" style="border: 0; border-style: dashed; width: 100px;">'
								+ '<p><i class="bi bi-chat-dots" style="color: #EB5757; cursor: pointer;"></i>&nbsp;<span class="commentcount" data-bno="${row.bno}">'
								+ row.commentcount
								+ '</span></p>'
								+ '</td>'
								+ '</tr>';
					
						$(newRow).appendTo($(".table")).slideDown();
					});
				 	
					// 더보기 버튼 삭제
					if(offset + 7 >= diarycount){
						$('.morebtn').remove();
					}
				 	
				}
			});
		}	
	
		$(document).on("click", ".dwrite", function() {
			location.href = "/mypage/dwrite";
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
				},
				function(isConfirm) {
					if (isConfirm) {
						diarycount -=  1;
						if((offset + 7 >= diarycount && offset < diarycount) || (offset + 7 < diarycount && offset < diarycount)){
							count = offset + 7;
						} else if(offset >= diarycount){
							count = offset;
						}
						$.ajax({
						url : '/mypage/bdelete',
						type : 'post',
						data : {
							bno : bno, offset:offset, count:count
						},
						dataType : 'json',
						success : function(data) {
							offset = count - 7;
							count = 7;
							// 표의 내용을 삭제
							var table = $(".table");
							table.empty();
							// 업데이트된 데이터로 표 채우기
							$.each(data.list,function(index, row) {
								newRow = '<tr style="height: 100px;">'
										+ '<td class="name-pr" style="font-weight: bolder;border: 0; border-style: dashed; width: 300px;">'
										+ row.bcontent
										+ '</td>'
										+ '<td class="bbno" style="display: none;">'
										+ row.bno
										+ '</td><td style="border: 0; border-style: dashed;">'
		
								if ('${sessionScope.mid}' === '${id}' || '${id}' == '') {
									newRow += '<a href="/mypage/dedit/${row.bno}"><button class="dedit">수정</button></a>';
								}
								newRow += '</td><td class="remove-pr" style="border: 0; border-style: dashed;">';
								
								if('${sessionScope.mid}' === '${id}' || '${id}' == ''){
									newRow += '<i style="cursor: pointer;" class="fas fa-times"></i>';
								}
		
								newRow += '</td>'
										+ '</tr>'
										+ '<tr style="border-bottom: 1px solid #c0c0c0;">'
										+ '<td class="quantity-box" style="border: 0; border-style: dashed; width: 100px;">'
										+ row.bdate
										+ '</td>'
										+ '<td class="bno" style="display: none;">'
										+ row.bno
										+ '</td>'
										+ '<td class="myid" style="display: none;">'
										+ '${sessionScope.mid}'
										+ '</td>'
										+ '<td class="total-pr" style="border: 0; border-style: dashed; width: 60px;">';
		
								if (row.mylike >= 1) {
									newRow += '<p>'
											+ '<i class="bi bi-heart-fill" style="margin-top: 5px;color: #EB5757; cursor: pointer;"></i>'
											+ '&nbsp;<span class="blike">'
											+ row.blike
											+ '</span>'
											+ '</p>';
								} else {
									newRow += '<p>'
											+ '<i class="bi bi-heart" style="margin-top: 5px;color: #EB5757; cursor: pointer;"></i>'
											+ '&nbsp;<span class="blike">'
											+ row.blike
											+ '</span>'
											+ '</p>';
								}
		
								newRow += '</td>'
										+ '<td class="total-pr" style="border: 0; border-style: dashed; width: 100px;">'
										+ '<p><i class="bi bi-chat-dots" style="color: #EB5757; cursor: pointer;"></i>&nbsp;<span class="commentcount" data-bno="${row.bno}">'
										+ row.commentcount
										+ '</span></p>'
										+ '</td>'
										+ '</tr>';
							
								table.append(newRow);
							});

							swal('', '삭제되었습니다.', "success");
							diarycount = data.list[0].count;
							$('#diarycount').text(diarycount);
							// 더보기 버튼 삭제
							if(offset + count >= diarycount){
								$('.morebtn').remove();
							}
						},
						error : function(err) {
							swal("실패", "작업수행에 실패하였습니다.", "error");
						}
					});
				}
			});
		}
		

		$(document).on("click", ".fa-times", function() {
			let bno = $(this).closest('tr').find('.bbno').text();
			confirm('', '삭제하시겠습니까?', bno);
		});

		$(document).on("click",".bi-heart, .bi-heart-fill",function() {
			let bno = $(this).closest('tr').find('.bno').text();
			let i = 0;
			let $icon = $(this);
			if ($icon.hasClass('bi-heart')) {
				i = 0;
			} else {
				i = 1;
			}

			$.ajax({
				url : '/mypage/updateLike',// 경로 조심
				type : 'post',
				data : {bno:bno, i:i},
				dataType : 'json',
				success : function(data) {
					// 성공 시 아이콘 클래스와 ${row.blike}를 변경
					if (i === 0) {
						$icon.removeClass('bi-heart').addClass(
								'bi-heart-fill');
						$icon.closest('tr').find('.blike').text(
								data.blike);
					} else {
						$icon.removeClass('bi-heart-fill').addClass(
								'bi-heart');
						$icon.closest('tr').find('.blike').text(
								data.blike);
					}
				},
				error : function(err) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});

		$(document).on("click",".bi-chat-dots",function() {
			let bno = $(this).closest('tr').find('.bno').text();
			$.ajax({
				url : '/mypage/comment',
				type : 'post',
				data : {
					bno : bno
				},
				dataType : 'json',
				success : function(data) {
					updateComment(data, bno);
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		$(document).on("click",".cbtn",function() {
			var cwrite = $(".cwrite").val();
			if(cwrite.length == 0) return;
			var bno = $(".bbbno").text();
			$.ajax({
				url : '/mypage/cwrite',
				type : 'post',
				data : {cwrite:cwrite, bno:bno},
				dataType : 'json',
				success : function(data) {
					updateComment(data, bno);
					var count = data.comment[0].count;
					var commentcount = $('.commentcount[data-bno="' + bno + '"]').text(count);
				},
				error : function(err) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		function updateComment(data, bno){
			var modalcontent = $(".modal-content");
			modalcontent.empty();
			
			if(data.comment.length == 0){
				var newContent = '<div class="modal-body" style="display: flex; justify-content: space-between;background-color: #FF9C41;">'
				+ '<div class="detail" style="margin: 0 auto;">'
				+ '<div class="detail-date-read">'
				+ '<div class="detail-read" style="font-size:large;font-weight:bold;text-align:center;"><i class="bi bi-pencil"></i>&nbsp;댓글쓰기</div>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '<div class="modal-header">'
				+ '<div class="bbbno" style="display:none;">' + bno + '</div>'
				+ '<input placeholder="댓글을 작성하세요" class="modal-title cwrite" id="exampleModalLabel" style="width:800px;height:100px;font-weight: bolder;">'
				+ '</div>'
				+ '<div class="modal-header" style="margin: 0 auto;">'
				+ '<button class="modal-title cbtn" style="width:100px;height:35px;cursor:pointer;">댓글쓰기</button>'
				+ '</div>';
				
				modalcontent.append(newContent);
			} else {
				$.each(data.comment, function(index, row) {
					var newContent = '<div class="modal-body" style="display: flex; justify-content: space-between;background-color: #FF9C41;">'
							+ '<div class="detail" style="margin: 0 auto;">'
							+ '<div class="detail-date-read">'
							+ '<a href="/mypage/main/' + row.mid + '"><div class="detail-read" style="fon-size:large;font-weight:bold;">'
							+ row.mnickname
							+ '</a>&nbsp;('
							+ row.cmdate
							+ ')</div>'
							+ '</div>'
							+ '</div>'
							+ '</div>'
							+ '<div class="modal-header" style="margin: 0 auto;">'
							+ '<h5 class="modal-title" id="exampleModalLabel" style="font-weight: bolder;">'
							+ row.cmcontent
							+ '</h5>'
							+ '</div>'
					modalcontent.append(newContent);
				});
				 newContent = '<div class="modal-body" style="display: flex; justify-content: space-between;background-color: #FF9C41;">'
							+ '<div class="detail" style="margin: 0 auto;">'
							+ '<div class="detail-date-read">'
							+ '<div class="detail-read" style="fon-size:large;font-weight:bold;"><i class="bi bi-pencil"></i>&nbsp;댓글쓰기</div>'
							+ '</div>'
							+ '</div>'
							+ '</div>'
							+ '<div class="modal-header">'
							+ '<div class="bbbno" style="display:none;">' + bno + '</div>'
							+ '<input class="modal-title cwrite" id="exampleModalLabel" style="width:800px;height:100px;font-weight: bolder;">'
							+ '</div>'
							+ '<div class="modal-header" style="margin: 0 auto;">'
							+ '<button class="modal-title cbtn" style="width:100px;height:35px;cursor:pointer;">댓글쓰기</button>'
							+ '</div>';
				modalcontent.append(newContent);
			}

			$("#exampleModal").modal("show");
		}
	</script>
	
</body>
</html>