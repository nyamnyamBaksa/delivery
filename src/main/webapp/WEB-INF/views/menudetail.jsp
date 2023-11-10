<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세페이지</title>
<link rel="stylesheet" href="/css/menudetail.css">

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>

	<div>
		<a href="javascript:history.back()"> <i
			class="fa-solid fa-arrow-left fa-lg"
			style="color: white; z-index: 1;"></i>
		</a>
	</div>
<form name="cartbutton" method="post">
	<div id="storedetail">
		<c:forEach items="${menudetail}" var="mf">
			<div id="menuimg" style="text-align: center;">
				<c:if test="${mf.mnimg == null}">
					<i class="fa-solid fa-hammer fa-rotate-270 fa-lg"
						style="color: #eb5757;"></i>이미지 준비중
                <i class="fa-solid fa-wrench fa-lg"
						style="color: #eb5757;"></i>
				</c:if>
				<c:if test="${mf.mnimg != null}">
					<img class="menuimg"
						style="width: 100%; height: 250px; position: relative; z-index: -1;"
						src="/img/food/${mf.mnimg}">
				</c:if>
			</div>
			<br>
			<div id="menuname">${mf.mnname}</div>
			<br>
			<div id="menudesc">${mf.mndesc}</div>
			<br>

				<div id="menuprice">
					가격
					<div name="price" style="text-align: right;">${mf.mnprice}</div>
				</div>

			<br>
			<br>
			<!-- 메인 메뉴인 경우에만 사이드 추가 선택 표시 -->
			<c:if test="${isMain == true}">
				<div id="sidecheck">
					<i class="fa-solid fa-plus fa-xl" style="color: #eb5757;"></i> 사이드 추가 선택
				</div>
				<br>

				<c:forEach items="${menudetail}" var="sm">
        <!-- 메인 메뉴에 해당하는 경우만 출력 -->
        <c:if test="${sm.mnside == 1}">
            <input id="sidecheckbox" type="checkbox" name="sidemenu"
                value="${sm.mnno}">
            <span id="sidemenu">${sm.mnname}</span>
            <span class="price"> + ${sm.mnprice}원</span>
        </c:if>
    </c:forEach>
				<br><br><br>
			</c:if>
				  <span class="camount" style="font-weight:bold; margin-left: 30px; font-size: 17px;">수량</span>
				  <span class="minus">-</span> 
				  <input type="text" class="camount" name="camount" value="1">
				   <span class="plus">+</span>
				  <input type="hidden" name="ctotal" value="${mf.mnprice}">
				  <!--  <span name="camount"  class="mcount" style="float: right;"> 
				<a href="#" class="minus">-</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='result'>1</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="plus">+</a></span>
			    </span>-->
			   
			<button class="cart_btn" data-mnno="${mf.mnno}" data-mnprice="${mf.mnprice}">담기</button>

		</c:forEach>
	</div>
	</form>
	<br>
	<br>

<script type="text/javascript">
$(document).ready(function() {
    let cacount = 1; // 기본 수량 1로 설정

    $(".plus").on("click", function(){
        cacount++;
        $(".camount").val(cacount);
    });

    $(".minus").on("click", function(){
        if (cacount > 1) {
            cacount--;
            $(".camount").val(cacount);
        }
    });

    // 장바구니 담기
   $(".cart_btn").on("click", function() {
	   
	   const mnno = $(this).data("mnno");
       const mnprice = $(this).data("mnprice");
       const camount = $(this).siblings(".camount").val();
       const ctotal = mnprice * camount;
        $.ajax({
            url: '/food/menudetail',
            type: 'POST',
            data: { mnno: mnno, mnprice: mnprice, camount: camount, ctotal: ctotal},
            success: function(result) {
                cartAlert(result);
            }
        });
       
    });

  function cartAlert(result) {
        if (result === '0') {
            Swal.fire("Error", "장바구니에 추가하지 못했습니다.", "error");
        } else if (result === '1') {
            Swal.fire("Success", "장바구니에 추가되었습니다.", "success");
        } else if (result === '2') {
            Swal.fire("Info", "장바구니에 이미 추가되었습니다.", "info");
        } else if (result === '5') {
            Swal.fire("Info", "로그인이 필요합니다.", "info");
        }
    }
});
</script>


</body>
</html>