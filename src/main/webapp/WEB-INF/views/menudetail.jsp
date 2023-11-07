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
			<c:if test="${mf.mnside == 0}">
				<div id="sidecheck">
					<i class="fa-solid fa-plus fa-xl" style="color: #eb5757;"></i> 사이드
					추가 선택
				</div>
				<br>

				<c:forEach items="${menudetail}" var="sm">
					<input id="sidecheckbox" type="checkbox" name="sidemenu"
						value="${sm.mnno}">
					<span id="sidemenu">${sm.mnname}</span>
					<span class="price"> + ${sm.mnprice}원</span>
				</c:forEach>
				<br><br><br>
				<span>
				  <span class="cacount" style="font-weight:bold; margin-left: 30px; font-size: 17px;">수량</span>
				  <span class="mcount" style="float: right;"> 
				<a href="#" class="minus">-</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='result'>1</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="plus">+</a></span>
			    </span>
			<br>
			<form name="cartbutton" method="post" onclick="/cart">
			<button type="submit">담기</button>
			</form>
			</c:if>
		</c:forEach>
	</div>
	<br>
	<br>




	<script type="text/javascript">
	
	let plus = document.querySelector(".plus");
	let minus = document.querySelector(".minus");
	let result = document.querySelector("#result");
	let totalmount = document.querySelector('.totalmount');
	let i = 1;
	
	plus.addEventListener("click", () => {
		
		i++
		result.textContent = i;
		let totalcostNum = i*45000;
		totalmount.textContent = "|" + totalcostNum.toLocaleString();
		
	})
minus.addEventListener("click", () => {
	if(i > 0) {
		i--
		result.textContent = i;
		let totalcostNum = i*45000;
		totalmount.textContent = "|" + totalcostNum.toLocaleString();
	}else {
		totalmount.textContent = "|" + 0
	}	
})

</script>

<script>
/*function cart(mnno) {
	
	$.ajax({
		type : POST,
		url : "/cart",
		data : {mnno : mnno},
		success : function(response) {
			Swal.fire("장바구니에 추가되었습니다.");
		},
		error : function() {
			Swal.fire("문제가 발생했습니다");
		}
	
	});
	*/
	








/*
window.onload = function() {
    var sideMenuList = ${sideMenuList}; 

    if (sideMenuList.length > 0) {
        // 사이드 메뉴가 존재하는 경우
        document.getElementById('sideMenuAdditions').style.display = 'block'; // 사이드 메뉴 추가 선택 리스트 표시
    } else {
        // 사이드 메뉴가 존재하지 않는 경우
        document.getElementById('sideMenuAdditions').style.display = 'none'; // 사이드 메뉴 추가 선택 리스트 숨김
    }
};
*/

</script>


</body>
</html>