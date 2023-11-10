<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
<link rel="stylesheet" href="/css/mypage-pay.css">
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
<style>
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}

.hov-in {
	font-size: larger;
	font-weight: bolder;
	background-color: rgba(255, 156, 65, 0.5);
}

.hover:hover {
	color: black;
}

.search {
	position: absolute;
	left: 15%;
	right: 15%;
	top: 9.77%;
	bottom: 85.55%;
	background: #EB5757;
	border: 1px solid #E8E8E8;
	border-radius: 50px;
	padding-left: 10px;
	color: white;
	font-size: larger;
	font-weight: bolder;
}

.search::placeholder {
	padding-left: 5px;
	color: white;
	font-size: larger;
	font-weight: bolder;
}

.fa-search{
	position: absolute;
	left: 78%;
	right: 17%;
	top: 11%;
	bottom: 85%;
	cursor: pointer;
	color: white;
	font-size: larger;
}
</style>
</head>
<body>
	<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    	<i class="bi bi-arrow-left" style="color: black;font-size: 2rem;"></i>
	</a>
	<div class="cart-box-main">
		<div class="container">
			<input type="text" class="search" required="required" placeholder="검색어를 입력해주세요.">
			<i class="fa fa-search"></i>
			<div style="margin-top: 50px;"></div>
			<div class="col-lg-12">
				<div class="searchcate toolbar-sorter-right">
		       		<select class="cate selectpicker show-tick form-control" id="cate">
						<option selected="selected" value="0"> 기본순 ▼</option>
						<option value="1">주문 많은 순 ▼</option>
						<option value="2">별점 높은 순 ▼</option>
						<option value="3">찜 많은 순 ▼</option>
					</select>
		       	</div>
		    </div>
		    <div id="searchcount" style="display: none;">${searchcount }</div>
			<div class="col-lg-12">
				<div style="margin-bottom: 35px;"></div>
				<table class="table">
				</table>
				<button style="margin: 0 auto;" class="morebtn">+ 더보기</button>
			</div>
			<div class="recommend">
			<c:if test="${sessionScope.mid ne null && list[0].sno ne null}">
				<h2 style="font-weight: bolder;text-align: center;">'${sessionScope.mname }'님이 최근에 드신 메뉴 별 추천 맛집</h2>
					<div class="instagram-box">
					<div class="main-instagram owl-carousel owl-theme">
						<c:forEach items="${list}" var="row">
							<div class="item">
								<div class="ins-inner-box">
									<img style="width: 215px;height: 180px;" src="/img/food/${row.simg }"
										onerror="this.src='/img/profileImg/20231026101912스크린샷%202023-10-18%20171343.png'"
										alt="" />
									<div class="hov-in">
										<a class="hover" href="/food/storedetail?sno=${row.sno }">${row.sname }</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<c:if test="${sessionScope.mid eq null || list[0].sno eq null}">
				<h2 style="font-weight: bolder;text-align: center;">주문량 많은 추천 맛집</h2>
					<div class="instagram-box">
					<div class="main-instagram owl-carousel owl-theme">
						<c:forEach items="${rlist}" var="row">
							<div class="item">
								<div class="ins-inner-box">
									<img src="${row.simg }"
										onerror="this.src='/img/profileImg/20231026101912스크린샷%202023-10-18%20171343.png'"
										alt="" />
									<div class="hov-in">
										<a class="hover" href="/food/storedetail?sno=${row.sno }">${row.sname }</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			</div>
		</div>
	</div>
	<!-- ALL JS FILES -->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="/js/jquery.superslides.min.js"></script>
	<script src="/js/bootstrap-select.js"></script>
	<script src="/js/inewsticker.js"></script>
	<script src="/js/bootsnav.js."></script>
	<script src="/js/images-loded.min.js"></script>
	<script src="/js/isotope.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/baguetteBox.min.js"></script>
	<script src="/js/form-validator.min.js"></script>
	<script src="/js/contact-form-script.js"></script>
	<script src="/js/custom.js"></script>
	<script src="/js/sweetalert.min.js"></script>

	<script type="text/javascript">
		
		// 총 개수
		var searchcount = $('#searchcount').text();
		// 조회 인덱스
		var offset = 0;	// 인덱스 초기값
		var count = 7;	// 7개씩 로딩
		$('.searchcate').hide();
		$('.morebtn').hide();
		if(offset + count >= searchcount){
			$('.morebtn').remove();
		}
	
		// 더보기 클릭시
		$(document).on("click", ".morebtn", function(){
			$('.searchcate').show();
			offset += count;
			readOldNotify(offset);
		});
			
		// 더보기 실행함수
		function readOldNotify(offset){
			let endIndex = offset+count-1;	// endIndex설정
			$.ajax({
				url: "/search",
				type: "post",
				async: "true",
				dataType: "json",
				data: {
					offset: offset,
					endIndex: endIndex
				},
				success: function (data) {
					if(data.search == ''){
						swal("", "검색 결과가 없습니다.", "warning");
					} else {
						var placeholder = search + '  ' + data.search[0].count + '개';
						$('.search').val('');
						$('.search').attr('placeholder', placeholder);
						updateTable(data);
						$('.recommend').empty();
						
						// mnname과 sname 텍스트를 노란색으로 변경
					      $('.mnname').each(function() {
						    if ($(this).text().includes(search)) {
						        var text = $(this).text();
						        var modifiedText = '';
						        for (let i = 0; i < text.length; i++) {
						            if (text.substring(i, i + search.length) === search) {
						                modifiedText += '<span style="color: #FF9C41;">' + search + '</span>';
						                i += search.length - 1;
						            } else {
						                modifiedText += text[i];
						            }
						        }
						        $(this).html(modifiedText);
						    }
						});
	
						  
					      $('.ssname').each(function() {
					    	  if ($(this).text().includes(search)) {
							        var text = $(this).text();
							        var modifiedText = '';
							        for (let i = 0; i < text.length; i++) {
							            if (text.substring(i, i + search.length) === search) {
							                modifiedText += '<span style="color: #FF9C41;">' + search + '</span>';
							                i += search.length - 1;
							            } else {
							                modifiedText += text[i];
							            }
							        }
							        $(this).html(modifiedText);
							    }
					      });
					}
				}
			});
		}
		
		function getParameterByName(name, url) {
	    	const urlParams = new URL(location.href).searchParams;
	    	return urlParams.get(name);
	    }
	
		// URL에서 cate 매개변수를 가져와서 기본값으로 설정
	    var defaultCate = getParameterByName('cate');
	    $('#cate').val(defaultCate);
		
	    var search = '';
	    
	    $('#cate').on('change', function(){
	    	$('.searchcate').show();
			var cate = $('#cate').val();
			$.ajax({
				url:'/cateChange',
				type:'post',
				data:{cate:cate, search:search,offset: offset},
				dataType:'json',
				success:function(data){
					if(data.search == ''){
						swal("", "검색 결과가 없습니다.", "warning");
					} else {
						var placeholder = search + '  ' + data.search[0].count + '개';
						$('.search').val('');
						$('.search').attr('placeholder', placeholder);
						updateTable(data);
						$('.recommend').empty();
						
						// mnname과 sname 텍스트를 노란색으로 변경
					      $('.mnname').each(function() {
						    if ($(this).text().includes(search)) {
						        var text = $(this).text();
						        var modifiedText = '';
						        for (let i = 0; i < text.length; i++) {
						            if (text.substring(i, i + search.length) === search) {
						                modifiedText += '<span style="color: #FF9C41;">' + search + '</span>';
						                i += search.length - 1;
						            } else {
						                modifiedText += text[i];
						            }
						        }
						        $(this).html(modifiedText);
						    }
						});
	
						  
					      $('.ssname').each(function() {
					    	  if ($(this).text().includes(search)) {
							        var text = $(this).text();
							        var modifiedText = '';
							        for (let i = 0; i < text.length; i++) {
							            if (text.substring(i, i + search.length) === search) {
							                modifiedText += '<span style="color: #FF9C41;">' + search + '</span>';
							                i += search.length - 1;
							            } else {
							                modifiedText += text[i];
							            }
							        }
							        $(this).html(modifiedText);
							    }
					      });
					}
				},
				error:function(error){
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		var confirm = function(msg, title, valueArr) {
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
			});
		}
		
		$(document).on('click', '.fa-search', function(){
			$('.searchcate').show();
			search = $('.search').val().trim();
			
			if(search == '') return;
			
			$.ajax({
				url: '/search',
				type: 'post',
				data: {search:search},
				dataType:'json',
				success:function(data){
					if(data.search == ''){
						swal("", "검색 결과가 없습니다.", "warning");
					} else {
						var placeholder = search + '  ' + data.search[0].count + '개';
						$('.search').val('');
						$('.search').attr('placeholder', placeholder);
						updateTable(data);
						$('.recommend').empty();
						
						// mnname과 sname 텍스트를 노란색으로 변경
					      $('.mnname').each(function() {
						    if ($(this).text().includes(search)) {
						        var text = $(this).text();
						        var modifiedText = '';
						        for (let i = 0; i < text.length; i++) {
						            if (text.substring(i, i + search.length) === search) {
						                modifiedText += '<span style="color: #FF9C41;">' + search + '</span>';
						                i += search.length - 1;
						            } else {
						                modifiedText += text[i];
						            }
						        }
						        $(this).html(modifiedText);
						    }
						});
	
						  
					      $('.ssname').each(function() {
					    	  if ($(this).text().includes(search)) {
							        var text = $(this).text();
							        var modifiedText = '';
							        for (let i = 0; i < text.length; i++) {
							            if (text.substring(i, i + search.length) === search) {
							                modifiedText += '<span style="color: #FF9C41;">' + search + '</span>';
							                i += search.length - 1;
							            } else {
							                modifiedText += text[i];
							            }
							        }
							        $(this).html(modifiedText);
							    }
					      });
					}
				},
				error:function(error){
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
		});
		
		function strToColor(str, search) {
			
		}
		
		function updateTable(data) {
		    var newTableHTML = '<table class="table">';
		    
		    // 중복된 sno 값을 가진 데이터를 그룹화하기 위한 객체 생성
		    var groupedData = {};

		    // 데이터 그룹화
		    $.each(data.search, function(index, row) {
		        var sname = row.sname;
		        if (!groupedData[sname]) {
		            groupedData[sname] = {
		            	sno: row.sno,
		            	simg: row.simg,
		                count: row.count,
		                sname: sname,
		                mnnameList: [],
		                average_rating: row.average_rating
		            };
		        }
		        $.each(data.mnsearch, function(index2, row2) {
			     	// 최대 두 개의 mnname만 추가
			        if (groupedData[sname].sname == row2.sname) {
			            groupedData[sname].mnnameList.push(row2.mnname);
			        }
		        });
		    });

		    // 그룹화된 데이터로 테이블 생성
		    $.each(groupedData, function(sno, group) {
		        newTableHTML += '<tr style="border-top: 1px solid #c0c0c0;border-bottom: 1px solid #c0c0c0;">';
		        newTableHTML += '<td class="name-pr" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 100px;">';
		        newTableHTML += '<input class="sno" type="hidden" value="' + group.sno + '">';
		        newTableHTML += '<a href="/food/storedetail?sno=' + group.sno + '"><img style="width: 150px;height: 130px;" src="/img/food/' + group.simg + '" /></a>';
		        newTableHTML += '</td>';
		        newTableHTML += '<td class="name-pr sname" style="font-size: larger; font-weight: bolder; border: 0; border-style: dashed; width: 150px;vertical-align: middle;">';
		        newTableHTML += '<a href="/food/storedetail?sno=' + group.sno + '"><span class="ssname">' + group.sname + '</span></a>';
		        newTableHTML += '</td>';
		        newTableHTML += '<td class="name-pr mnname" style="font-size: large; font-weight: bold; border: 0; border-style: dashed; width: 200px;vertical-align: middle;">';
		        newTableHTML += group.mnnameList.join(', ');
		        newTableHTML += '</td>';
		        newTableHTML += '<td class="name-pr" style="border: 0; border-style: dashed; width: 100px;vertical-align: middle;">';
		        newTableHTML += '<div class="star-ratings">';
		        newTableHTML += '<div class="rscore" style="display: none;">' + group.average_rating + '</div>';
		        newTableHTML += '<div class="star-ratings-fill space-x-2 text-lg" style="width: ' + (group.average_rating * 20) + '%;">';
		        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
		        newTableHTML += '</div>';
		        newTableHTML += '<div class="star-ratings-base space-x-2 text-lg">';
		        newTableHTML += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
		        newTableHTML += '</div>';
		        newTableHTML += '</div>&nbsp;(' + group.average_rating + ')';
		        newTableHTML += '</td>';
		        newTableHTML += '</tr>';
		    });

		    newTableHTML += '</table>';
		    
		    // 테이블 업데이트
		    $('.table').html(newTableHTML);
		    $('#searchcount').text(data.searchcount);
		    
		    if(offset + count >= searchcount){
				$('.morebtn').remove();
			}
		}
	</script>
</body>
</html>