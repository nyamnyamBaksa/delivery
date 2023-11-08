<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Basic -->
<head>
<meta charset="UTF-8">
<title>냠냠박사</title>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/css/mypage-main.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/custom.css">
	<!-- sweetalert -->
	<link rel="stylesheet" href="/css/sweetalert.css" />
	<!-- 아이콘 -->
	<link rel="stylesheet" href="/css/bootstrap-icons.css">
</head>

<body>
<c:if test="${sessionScope.mid ne null}">
	<div class="mypage">
		<div class="mypageFont">장바구니</div>
	</div>
    <!-- Start Cart  -->
    <div class="cart-box-main">
    <c:if test="${list[0].sname eq null }">
    	<h1 style="text-align: center;font-size: 50px;color: #EB5757;"><i class="bi bi-cart-x"></i>장바구니가 비었어요</h1>
    </c:if>
    <c:if test="${list[0].sname ne null }">
        <div class="container">
            <div class="row">
            <div style="margin: 10px;"></div>
            	<div class="col-lg-12"><h1>${list[0].sname }</h1></div>
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead style="background-color: #EB5757;">
                                <tr>
                                    <th></th>
                                    <th>메뉴 이름</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총 가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="row">
	                                <tr>
	                                    <td class="thumbnail-img">
	                                        <a href="food/storedetail?sno=${list[0].sno}">
												<img class="img-fluid" src="/img/food/${row.mnimg}" alt="" />
											</a>
	                                    </td>
	                                    <td class="name-pr">${row.mnname }</td>
	                                    <td class="price-pr">
	                                        <span class="mnprice">${row.mnprice }</span>원
	                                    </td>
	                                    <td class="quantity-box">
											<div class="cno" style="display: none;">${row.cno }</div>
	                                    	<input style="width: 50px;margin-bottom: 15px;" type="number" value="${row.camount }" min="1" step="1" class="c-input-text qty text">
						                    &nbsp;<button class="qtyChange" style="background-color: black;">수량변경</button>
	                                    </td>
	                                    <td class="price-pr">
	                                        <span class="ctotal">${row.ctotal }</span>원
	                                    </td>
	                                    <td class="remove-pr">
											<i style="cursor:pointer;" class="fas fa-times cartdel"></i>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <hr style="border: 1px solid black;">
                        <div>
                        	<h2 onclick="location.href='/food/storedetail?sno=${list[0].sno}'" style="font-weight:bold;text-align: center;cursor: pointer;">+ 더 담으러 가기</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row my-5">
            	<div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    <div class="order-box">
                        <div class="d-flex">
                            <h4>총 주문금액</h4>
                            <div class="ml-auto font-weight-bold"><span class="total">${list[0].total }</span>원 </div>
                        </div>
                        <div class="d-flex">
                            <h4>배달비</h4>
                            <div class="ml-auto font-weight-bold" style="color: #EB5757;"> 0원 </div>
                        </div>
                        <hr>
                        <div class="d-flex gr-total">
                            <h5  style="color: #EB5757;">결제 예정금액</h5>
                            <div class="ml-auto h5"><span class="total">${list[0].total }</span>원 </div>
                        </div>
                        <hr>
                     </div>
	                <div><button class="cartbtn" style="float: right;cursor:pointer;">주문하기</button></div>
                  </div>
            </div>

        </div>
    </c:if>
    </div>
    <!-- End Cart -->
</c:if>

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
    
	    var qty = $('.qty').val();
	    $(document).on("change",".qty", function() {
	        qty = $(this).val();
	    });
	    
	    $(document).on("click",".qtyChange",function() {
	    	let $this = $(this); // this 저장하지 않으면 success에서 작동안함
	    	let cno = $this.closest('tr').find('.cno').text();
	    	let mnprice = $this.closest('tr').find('.mnprice').text();
	    	$.ajax({
				url : '/updateQty',
				type : 'post',
				data : {cno : cno, qty:qty, mnprice:mnprice},
				dataType : 'json',
				success : function(data) {
					$this.closest('tr').find('.qty').val(qty);
					$this.closest('tr').find('.ctotal').text(data.ctotal);
					$('.total').text(data.list[0].total);
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
	    });
	    
	    $(document).on("click",".cartbtn",function() {
	    	location.href = "/purchase";
	    });
	    
	    $(document).on("click",".cartdel",function() {
	    	let $this = $(this);
	    	let cno = $this.closest('tr').find('.cno').text();
	    	$.ajax({
				url : '/cartdel',
				type : 'post',
				data : {cno : cno},
				dataType : 'json',
				success : function(data) {
					
				},
				error : function(error) {
					swal("실패", "작업수행에 실패하였습니다.", "error");
				}
			});
	    });
    </script>
</body>

</html>