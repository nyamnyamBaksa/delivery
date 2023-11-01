<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="/css/home.css">

</head>
<body>

	<h1>냠냠박사</h1>
	
	<div id="menu-list"></div>

	<script src="config.js"></script>
	<script src="utils/index.js"></script>
	<script src="components/MenuItem.js"></script>
	<script src="App.js"></script>
	<script type="text/javascript">
		// config.js에서 메뉴 데이터 가져오기
		const menus = defaultMenus; // config.js에 있는 배열명을 가져와서 사용

		// utils/index.js에서 정의한 함수를 사용하여 메뉴 데이터를 생성
		const menuData = createMenuData(menus);

		// 메뉴 데이터를 동적으로 HTML에 추가
		const menuListDiv = document.getElementById('menu-list');
		menuData.forEach(menu => {
			const menuDiv = document.createElement('div');
			menuDiv.innerHTML = `<input type="checkbox" id="menu-${menu.id}" ${menu.checked ? 'checked' : ''}>
				<label for="menu-${menu.id}">${menu.name}</label>`;
			menuListDiv.appendChild(menuDiv);
		});
	</script>

	 <div class="wrap">
        <main>
            <section class="address_search">
                 <div id="search_box">
                     <div>
                         <input type="hidden" id="deliveryAddress1" placeholder="우편번호" value="" name="address1" readonly>
                         <input type="text" value= "" onclick="execution_daum_address()"
                             id="deliveryAddress2" readonly placeholder="주소를 입력해 주세요" name="address2"><br>
                     </div>
 
                     <div class="search_btn">
                         <label for="search_btn">
                             <i class="fas fa-search"></i>
                         </label>
 
                         <input type="button" name="search" id="search_btn">
 
                     </div>
 
                 </div>
            </section>
            <section class="category_box">
                <div class="box">
                    <ul class="category">
                    
                    			<li data-category ='1' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/bibimbap.jpg" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">한식</div> 
                                </li> 
                                
                                <li data-category ='2' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/cutlet1.png" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">일식</div>
                                </li>
                                
                                <li data-category ='3' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/chinese1.png" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">중식</div>
                                </li>
                    
                                <li data-category ='4' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/pizza2.png" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">양식</div>
                                </li>
                                
                                <li data-category ='5' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/bunsik1.png" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">분식</div>
                                </li>
                    
                                <li data-category ='6' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/chicken1.png" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">아시안</div>
                                </li>
                    
                                <li data-category ='7' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/hamburger4.png" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">패스트푸드</div>
                                </li>
                    
                                <li data-category ='8' onclick="location.href=''">
									<div>
										<div class="img_box">
                                           <img src="/img/dessert2.png" alt="이미지">
										</div>
                                    </div>
                                    <div class="name">카페/디저트</div>
                                </li>
                         
                            </ul>
                	</div>
            </section>
        </main>
    </div>
    <!-- 콘텐츠 -->


	<%@ include file="menu.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/home.js"></script>

<script type="text/javascript">
//음식 카테고리를 클릭했을 때
$('.category li').click(function() {
    var selectedCategory = $(this).find('.name').text(); // 선택한 카테고리 텍스트 가져오기

    // 서버에 AJAX 요청을 보냅니다.
    $.ajax({
        url: './getStoreList', // 서버의 API 엔드포인트 주소
        method: 'GET',
        data: {
            mncatename: selectedCategory // 선택한 카테고리를 서버에 전달 
        },
        dataType: 'json',
        success: function(data) {
            var restaurantList = data.storelist; // 서버에서 받은 JSON 데이터의 키 이름을 확인하여 수정할 수 있습니다.
            var restaurantListElement = $('.restaurant-list');
            restaurantListElement.empty(); // 기존 목록을 비웁니다.

            // 받아온 데이터를 리스트에 추가합니다.
            restaurantList.forEach(function(restaurant) {
                var listItem = $('<div class="restaurant"></div>').text(restaurant);
                restaurantListElement.append(listItem);
            });
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
});
</script>
</html> 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메인화면</h1>
</body>
</html>
