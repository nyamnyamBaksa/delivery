<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게상세페이지</title>
<link rel="stylesheet" href="/css/storedetail.css">


<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>

	<div>
		<a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 2px 2px 2px gray;">
    <i class="fa-solid fa-arrow-left fa-xl" style="color: white;"></i>
</a>
<a id="cart" href="/cart"><i class="fa-solid fa-cart-shopping fa-2xl"
		style="color: white; margin-left: 95%; text-shadow: 2px 2px 2px gray;"></i></a>
<div id="storedetail">
    <div id="storeimg" style="text-align: center;">
        <c:if test="${detail.store_image == null}">
            <i class="fa-solid fa-hammer fa-rotate-270 fa-lg" style="color: #eb5757;"></i>이미지 준비중
            <i class="fa-solid fa-wrench fa-lg" style="color: #eb5757; position: relative; z-index: -1;"></i>
        </c:if>
        <c:if test="${detail.store_image != null}">
            <img style="width: 100%; height: 250px; position: relative; z-index: -1;" class="foodimg" src="/img/food/${detail.store_image} ">
        </c:if>
    </div>
    <div id="wishlist" style="float: right;">
        <button type="button" id="likebutton" data-sno="${detail.sno}">
            <i class="fa-regular fa-heart fa-2xl" style="color: #EB5757; font-size: 3rem; position: relative; z-index: 1;"></i>
        </button>
    </div>
</div>

		<br>
		<div id="storename">${detail.store_name}</div>
		<br>
		<div id="storestar">
			<i class="xi-star xi-x" style="color: #FFC633;"></i>${detail.average_rating}&nbsp;&nbsp;리뷰${detail.review_count}개

			<a href="./review?sno=${detail.sno }"><i class="fa-solid fa-chevron-right fa-2xs"
				style="color: #000000;"></i></a>

		</div>
		<button id="storeinfo"
			onclick="location.href='./storeinfo?sno=${detail.sno}'">가게정보</button>
		<hr style="width: 97%; border: solid 2px #eb5757;" />
		<br>
		<!-- <hr style="width: 95%; border: solid 2px #eb5757;" />  -->

		<div id="menumix">
			<i class="fa-solid fa-heart fa-lg" style="color: #eb5757;"></i> 메뉴 추천
			조합 <br> <br>
			<c:forEach items="${bestmenu}" var="best">
				<div id="menubest">&nbsp;${bestmenu}</div>
			</c:forEach>
		</div>

        <br>
		<h3 style="margin-left: 25px;">
			<i class="fa-solid fa-utensils fa-lg" style="color: #eb5757;"></i>&nbsp;&nbsp;메뉴
		</h3>
		<div id="menulist">
			<c:forEach items="${menulist}" var="menu">
				<table width="100%" style="text-align: left; margin-right: 10px;">
					<tr>
						<th style=""><a href="./menudetail?mnno=${menu.mnno}">${menu.mnname}</a></th>
						<td rowspan="3" style="width: 30%; text-align: center;"><c:if
								test="${menu.mnimg == null}">
								<i class="fa-solid fa-hammer fa-rotate-270 fa-lg"
									style="color: #eb5757;"></i>이미지 준비중 <i
									class="fa-solid fa-wrench fa-lg" style="color: #eb5757;"></i>
							</c:if> <c:if test="${menu.mnimg != null}"><img style="width: 160px; height: 120px;" class="menuimg" src="/img/food/${menu.mnimg}"></c:if></td>
					</tr>
					<tr>
						<td>${menu.mnprice}</td>
					</tr>

				</table>
			</c:forEach>
		</div>
	</div>

	<script type="text/javascript">
	  $(document).ready(function() {
	        let likeButton = $("#likebutton");

	        likeButton.click(function() {
	            let sno = likeButton.data("sno");
	            let mno = likeButton.data("mno");
	            let inWishlist = likeButton.data("wishlist");

	            let url = "";

	            if (inWishlist) {
	                url = "/food/storedetail/remove";  
	            } else {
	                url = "/food/storedetail"; 
	            }

	            $.ajax({
	                type: "post",
	                url: url,
	                data: {sno: sno},
	                success: function(response) {
	                    if (response.status === "success") {
	                        likeButton.data("wishlist", !inWishlist);  
	                        Swal.fire({
	                            icon: "success",
	                            title: inWishlist ? "찜 취소" : "찜 추가",
	                            text: inWishlist ? "찜이 취소되었습니다." : "찜목록에 추가되었습니다."
	                        });
	                    } else if (response.status === "removed") {
	                        likeButton.data("wishlist", !inWishlist); 
	                        Swal.fire({
	                            icon: "success",
	                            title: "찜 취소",
	                            text: "찜이 취소되었습니다."
	                        });
	                    } else if (response.status === "error") {
	                        Swal.fire({
	                            icon: "error",
	                            title: "에러",
	                            text: response.message
	                        });
	                    }
	                },
	                error: function() {
	                    Swal.fire({
	                        icon: "error",
	                        title: "에러",
	                        text: "문제가 발생했습니다."
	                    });
	                }
	            });
	        });
	    });
	</script>

</body>
</html>