<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="/css/menudetail.css">

<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script src="/js/jquery-3.2.1.min.js"></script>
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
    <a href="javascript:history.back()" style="position: relative; z-index: 1; text-shadow: 3px 3px 3px gray;">
    <i class="fa-solid fa-arrow-left fa-xl" style="color: white; font-size: 2rem;  margin-top: 30px; margin-left: 10px;"></i>
</a>
   </div>
<form name="cartbutton" method="post">
   <div id="storedetail">
      <c:forEach items="${menudetail}" var="mf">
         <div id="menuimg" style="text-align: center;">
            
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
         <!-- 메인 메뉴인 경우에만 사이드 추가 선택 표시 
         <c:if test="${isMain == true}">
            <div id="sidecheck">
               <i class="fa-solid fa-plus fa-xl" style="color: #eb5757;"></i> 사이드 추가 선택
            </div>
            <br>

            <c:forEach items="${menudetail}" var="sm">
        <!-- 메인 메뉴에 해당하는 경우만 출력 
        <c:if test="${sm.mnside == 1}">
            <input id="sidecheckbox" type="checkbox" name="sidemenu"
                value="${sm.mnno}">
            <span id="sidemenu">${sm.mnname}</span>
            <span class="price"> + ${sm.mnprice}원</span>
        </c:if>
    </c:forEach>
            <br><br><br>
         </c:if>-->
              <span class="cacount" style="font-weight:bold; margin-left: 30px; font-size: 25px;">수량</span>
              &nbsp;<span class="minus" style="font-weight:bold; font-size: 20px;">-</span>&nbsp; 
              <input type="text" class="camount" name="camount" value="1">&nbsp;
               &nbsp;<span class="plus" style="font-weight:bold; font-size: 20px;" >+</span>&nbsp;
              <input type="hidden" name="ctotal" value="${mf.mnprice}">
              <!--  <span name="camount"  class="mcount" style="float: right;"> 
            <a href="#" class="minus">-</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='result'>1</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="plus">+</a></span>
             </span>-->
            <input id="sno" type="hidden" value="${mf.sno }">
            <input id="mnno" type="hidden" value="${mf.mnno }">
            <input id="mnprice" type="hidden" value="${mf.mnprice }">

      </c:forEach>
         <button type="button" class="cart_btn" data-mnno="${mf.mnno}" data-mnprice="${mf.mnprice}" data-sno="${mf.sno }">담기</button>
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

    $(".cart_btn").on("click", function() {
        const mnno = $("#mnno").val().trim();
        const mnprice = $("#mnprice").val().trim();
        const camount = $(this).siblings(".camount").val();
        const ctotal = mnprice * camount;
        var sno = $("#sno").val().trim();
        
        /* const cart = JSON.parse(sessionStorage.getItem("cart")) || [];
        
        if (cart.length > 0 && cart[0].sno === sno) {
            
            cart.push({ mnno, mnprice, camount, ctotal, sno });
        } else {
            cart.length = 0;
            cart.push({ mnno, mnprice, camount, ctotal, sno });
        }
        
        sessionStorage.setItem("cart", JSON.stringify(cart)); */
        
        $.ajax({
            url: '/menucart2',
            type: 'POST',
            data: { sno: sno, mnno: mnno, mnprice: mnprice, camount: camount, ctotal: ctotal },
            dataType: 'json',
            success: function(result) {
               if (result.result === '1') {
            	   Swal.fire("Info", "장바구니에 이미 추가되었습니다.", "info");
                } else if (result.result === '2') {
                    Swal.fire("Success", "장바구니에 추가되었습니다.", "success");
                } else if (result.result === '5') {
                    Swal.fire("Info", "로그인이 필요합니다.", "info");
                    window.location.href = '/login';
                } else if (result.result === '6') {
                    Swal.fire("Info", "같은 식당의 메뉴만 담을 수 있습니다.", "info");
                }
               
             },
            error: function() {
               Swal.fire("Error","AJAX 요청 실패", "error");
               console.log("AJAX 요청 실패:", status, error);
            }
        });
    });

    function cartalert(result) {
         
     }
});
</script>


</body>
</html>