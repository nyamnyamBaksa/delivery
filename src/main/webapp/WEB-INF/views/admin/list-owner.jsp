<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, width=device-width, user-scalable=no"/> 
<title>admin || 사장님관리</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/member.css">
<style type="text/css">
body {
            background-color: white;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        .main {
            padding: 20px;
            margin-left: 0;
            margin-bottom: 50px; 
        }

        .article {
            margin-bottom: 20px;
        }

        .table-head {
            background-color: #EB5757;
            height: 40px;
            font-weight: bold;
            text-align: center;
        }

        .div-table {
            width: 100%;
            display: table;
            margin-bottom: 15px;
            font-size:90%;
        }

        .div-row {
            display: table-row;
            height: 30px;
            line-height: 30px;
        }

        .div-cell {
            display: table-cell;
            border-bottom: 1px solid gray;
            text-align: center;
        }
        
        
        
.div-cell:nth-child(1) { width: 30px; } /* 선택 열 */
.div-cell:nth-child(2) { width: 30px; } /* 번호 열 */
.div-cell:nth-child(3) { width: 150px; } /* 아이디 열 */
.div-cell:nth-child(4) { width: 150px; } /* 점주명 열 */
.div-cell:nth-child(5) { width: 220px; } /* 사업자번호 열 */
.div-cell:nth-child(6) { width: 170px; } /* 등록날짜 열 */
.div-cell:nth-child(7) { width: 100px; } /* 상호등급 열 */

        .grade {
            width: 100%;
            padding: 5px;
        }

        .btn-delete {
            background-color: #EB5757;
            border-color : #EB5757;
            font-family: 'NanumSquareNeo';
            margin-top: 20px;
            width:100px;
            height:50px;
            padding: 10% 20%;
        }
        
        .OSearch {
        
        height: 40px;
        width: 300px;
        border: 2px solid #EB5757;
        background: #ffffff;
        
        }
        
        .OSearchInput {
        
        font-size: 16px;
        width: 225px;
        padding: 10px;
        border: 0px;
        outline: none;
        float: left;
        
        }
        
        .OSearchBtn {
        
        width: 50px;
        height: 100%;
        border: 1px solid #EB5757;
        background: #EB5757;
        outline: none;
        float: right;
        color: #ffffff;
        }
        
</style>
<script type="text/javascript">
function ogradeCh(ono, name, value){
  if(confirm(name + "님의 등급을 변경합니다.")){
    location.href="./gradeOwner?ono="+ono+"&grade="+value;
  }
}
</script>
</head>
<body>
	<div class="container">
	<h1 style="text-align: center; margin-top: 20px;">냠냠박사</h1>
		<%@ include file="menubar.jsp"%>
		<div class="main">
			<div class="article">
				<h1>사장님관리</h1>
				
				  <div class="moveBottomBtn">
            <img alt="" src="/img/down_icon.png">
           </div>
            
			
            
            <script type="text/javascript">
            const $bottomBtn = document.querySelector(".moveBottomBtn");

         // 버튼 클릭 시 페이지 하단으로 이동
         $bottomBtn.onclick = () => {
           window.scrollTo({ 
             top: document.body.scrollHeight, // <- 페이지 총 Height
             behavior: "smooth" 
           });
         };
            </script>
            
				<div class="div-table">
					<div class="div-row table-head">
						<div class="div-cell table-head">선택</div>
						<div class="div-cell table-head">번호</div>
						<div class="div-cell table-head">아이디</div>
						<div class="div-cell table-head">상호명</div>
						<div class="div-cell table-head">사업자번호</div>
						<div class="div-cell table-head">등록날짜</div>
						<div class="div-cell table-head">상호등급</div>
					</div>
					<c:forEach items="${ownerList}" var="row">
						<div class="div-row">

							<div class="div-cell">
								<input style="zoom:1.5;" type="checkbox" name="selectedMembers" value="${row.ono}"
									onclick="toggleSelection(${row.ono})">
							</div>

							<div class="div-cell">${row.ono}</div>
							<div class="div-cell">${row.oid}</div>
							<div class="div-cell">${row.oname}</div>
							<div class="div-cell">${row.obiz}</div>
							<div class="div-cell">${row.ojoindate}</div>
							<div class="div-cell">

								<select class="grade"
									onchange="ogradeCh(${row.ono}, '${row.oname}', this.value)">
									<optgroup label="폐점">
										<option value="0"
											<c:if test="${row.ograde eq 0}">selected="selected"</c:if>>폐점</option>
									</optgroup>
									<optgroup label="일반">
										<option value="1"
											<c:if test="${row.ograde eq 1}">selected="selected"</c:if>>일반</option>
									</optgroup>
									<optgroup label="우수식당">
										<option value="2"
											<c:if test="${row.ograde eq 2}">selected="selected"</c:if>>우수식당</option>
									</optgroup>

								</select>
							</div>
						</div>
					</c:forEach>

					<button type="button" class="btn-delete"
						
						onclick="deleteSelectedMembers()">상점삭제</button>

					<script>
// 선택된 회원을 추적하기 위한 배열
var selectedMembers = [];

// 체크박스 클릭 이벤트 핸들러
function toggleSelection(ono) {
    if (selectedMembers.includes(ono)) {
        selectedMembers = selectedMembers.filter(item => item !== ono);
    } else {
        selectedMembers.push(ono);
    }
}

// 회원 삭제 버튼 클릭 이벤트 핸들러
function deleteSelectedMembers() {
    if (selectedMembers.length === 0) {
        alert("삭제할 상점을 선택해주세요.");
        return;
    }

    if (confirm("선택한 상점을 삭제하시겠습니까?")) {
        // 서버로 선택된 상점 목록을 보내서 삭제 작업을 수행
        var selectedMembersStr = selectedMembers.join(',');
        location.href = "./deleteOwners?onoList=" + selectedMembersStr;
    }
}
</script>

				</div>
				      <!-- 검색 기능 -->
   <form action="./search-owner" method="get">
      <div class="OSearch">
    <input type="text" name="keyword" class="OSearchInput" placeholder="검색어 입력">
    <button type="submit" class="OSearchBtn">검색</button>
            </div>
</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script type="text/javascript">
</body>
</html>
