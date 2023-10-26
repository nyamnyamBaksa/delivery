<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style type="text/css">
.comment{
	background-color: #F0F8FF;
}
</style>
</head>
<body>
	<div class="title">
		<div class="titleFont">냠냠 다이어리</div>
	</div>
	<div style="margin-top: 100px;"></div>
	<c:if test="${sessionScope.mid ne null}">
		<div class="cart-box-main">
			<div class="container">
				<div class="col-lg-12">
					<table class="table">
						<c:forEach items="${list }" var="row">
							<tr style="height: 200px;">
								<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed; width: 800px;">${row.bcontent }</td>
								<td class="quantity-box" style="border: 0; border-style: dashed; width: 100px;">${row.bdate }</td>
								<td class="bbno" style="display: none;">${row.bno }</td>
								<td class="remove-pr" style="border: 0; border-style: dashed;">
									<c:if test="${id eq null || sessionScope.mid eq id }">
										<i style="cursor: pointer;" class="fas fa-times"></i>
									</c:if>
								</td>
							</tr>
							<tr style="border-bottom: 1px solid black;">
								<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed; width: 800px;"></td>
								<td class="bno" style="display: none;">${row.bno }</td>
								<td class="myid" style="display: none;">${sessionScope.mid }</td>
								<td class="total-pr" style="border: 0; border-style: dashed; width: 60px;">
									<c:choose>
									    <c:when test="${row.mylike ge 1}">
									        <p>
									            <i class="bi bi-heart-fill" style="margin-top: 5px; font-size: 32px; color: #EB5757; cursor: pointer;"></i>
									            &nbsp;<span class="blike">${row.blike}</span>
									        </p>
									    </c:when>
									    <c:otherwise>
									        <p>
									            <i class="bi bi-heart" style="margin-top: 5px; font-size: 32px; color: #EB5757; cursor: pointer;"></i>
									            &nbsp;<span class="blike">${row.blike}</span>
									        </p>
									    </c:otherwise>
									</c:choose>
								</td>
								<td class="total-pr" style="border: 0; border-style: dashed; width: 60px;">
								 	<p><i class="bi bi-chat-dots" style="font-size: 32px; color: #EB5757; cursor: pointer;"></i>&nbsp;${row.commentcount }</p>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
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
	<script src="/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
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
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({
			            url: './bdelete',
			            type:'post',
			 			data:{bno:bno},
			 			dataType:'json',
			 			success: function(data){
			 				// 표의 내용을 삭제
			 		        var table = $(".table");
			 		        table.empty();
							
			 		       // 업데이트된 데이터로 표 채우기, <c:choose>쓰면 안됨 
			 		        $.each(data.list, function (index, row) {
			 		            var newRow = '<tr style="height: 200px;">' +
			 		                '<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed; width: 800px;">' + row.bcontent + '</td>' +
			 		                '<td class="quantity-box" style="border: 0; border-style: dashed; width: 100px;">' + row.bdate + '</td>' +
			 		                '<td class="bbno" style="display: none;">' + row.bno + '</td>' +
			 		                '<td class="remove-pr" style="border: 0; border-style: dashed;">';
			 		            
			 		               
			 		            if ('${sessionScope.mid}' === '${id}') {
			 		                newRow += '<i style="cursor: pointer;" class="fas fa-times"></i>';
			 		            }
			 		            
			 		            newRow += '</td>' +
			 		                '</tr>' +
			 		                '<tr style="border-bottom: 1px solid black;">' +
			 		                '<td class="name-pr" style="font-size: larger; font-weight: bolder;border: 0; border-style: dashed; width: 800px;"></td>' +
			 		                '<td class="bno" style="display: none;">' + row.bno + '</td>' +
			 		                '<td class="myid" style="display: none;">' + '${sessionScope.mid}' + '</td>' +
			 		                '<td class="total-pr" style="border: 0; border-style: dashed; width: 60px;">';

			 		            if (row.mylike >= 1) {
			 		                newRow += '<p>' +
			 		                    '<i class="bi bi-heart-fill" style="margin-top: 5px; font-size: 32px; color: #EB5757; cursor: pointer;"></i>' +
			 		                    '&nbsp;<span class="blike">' + row.blike + '</span>' +
			 		                    '</p>';
			 		            } else {
			 		                newRow += '<p>' +
			 		                    '<i class="bi bi-heart" style="margin-top: 5px; font-size: 32px; color: #EB5757; cursor: pointer;"></i>' +
			 		                    '&nbsp;<span class="blike">' + row.blike + '</span>' +
			 		                    '</p>';
			 		            }

			 		            newRow += '</td>' +
			 		                '<td class="total-pr" style="border: 0; border-style: dashed; width: 60px;">' +
			 		                '<p><i class="bi bi-chat-dots" style="font-size: 32px; color: #EB5757; cursor: pointer;"></i>&nbsp;' + row.commentcount + '</p>' +
			 		                '</td>' +
			 		                '</tr>';

			 		            table.append(newRow);
			 		        });
			 				
			 				swal('', '삭제되었습니다.', "success");
			            },
			            error: function(err){
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
		
		$(document).on("click", ".bi-heart, .bi-heart-fill", function() {
		    let bno = $(this).closest('tr').find('.bno').text();
		    let id = $(this).closest('tr').find('.myid').text();
		    let i = 0;
		    let $icon = $(this);
		    if ($icon.hasClass('bi-heart')) {
		        i = 0;
		    } else {
		    	i = 1;
		    }

		    $.ajax({
		        url: '/mypage/updateLike',// 경로 조심
		        type: 'post',
		        data: {bno: bno, i: i, id: id},
		        dataType: 'json',
		        success: function(data) {
		            // 성공 시 아이콘 클래스와 ${row.blike}를 변경
		            if (i === 0) {
		                $icon.removeClass('bi-heart').addClass('bi-heart-fill');
		                $icon.closest('tr').find('.blike').text(data.blike);
		            } else {
		                $icon.removeClass('bi-heart-fill').addClass('bi-heart');
		                $icon.closest('tr').find('.blike').text(data.blike);
		            }
		        },
		        error: function(err) {
		            alert('오류' + err);
		        }
		    });
		});
		
		$(document).on("click", ".bi-chat-dots", function() {
			let bno = $(this).closest('tr').find('.bno').text();
	 		$.ajax({
	 			url:'/mypage/comment',
	 			type:'post',
	 			data:{bno:bno},
	 			dataType:'json',
	 			success:function(data){
	 		        var modal-content = $(".modal-content");
	 		        modal-content.empty();
					
	 		       $.each(data.comment, function (index, row) {
	 		            var newContent = '<div class="modal-header" style="background-color: #E6E6FA;">' +
	 		                '<h5 class="modal-title" id="exampleModalLabel">' + row.cmcontent + '</h5>' +
	 		                '</div>' +
	 		                '<div class="modal-body">' +
	 		                '<div class="detail">' +
	 		                '<div class="detail-date-read">' +
	 		                '<div class="detail-date">' + row.cmdate + '</div>' +
	 		                '<div class="detail-read">' + row.mid + '</div>' +
	 		                '</div>' +
	 		                '<div style="font-weight: bold; font-size: larger;" class="detail-content">본문내용</div>' +
	 		                '</div>' +
	 		                '</div>';
			 		        modalContent.append(newContent);
	 		       		});
	 				$("#exampleModal").modal("show");
	 			},
	 			error:function(error){
	 				alert('에러');
	 			}
	 		});
		});

	</script>
</body>
</html>