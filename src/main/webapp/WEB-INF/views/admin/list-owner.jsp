<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || 사장님관리</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/member.css">
<style type="text/css">
.div-table {
	margin: 0 auto;
	display: table;
	width: 900px;
	height: auto;
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

.table-head {
	background-color: #EB5757;
	height: 40px;
	font-weight: bold;
	text-align: center;
}

.gray {
	background-color: #c0c0c0;
}

.yellow {
	background-color: yellow;
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
	<h1 style="text-align: center;">냠냠박사</h1>
		<%@ include file="menubar.jsp"%>
		<div class="main">
			<div class="article">
				<h1>사장님관리</h1>
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
								<input type="checkbox" name="selectedMembers" value="${row.ono}"
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
									<optgroup label="탈퇴">
										<option value="0"
											<c:if test="${row.ograde eq 0}">selected="selected"</c:if>>탈퇴</option>
									</optgroup>
									<optgroup label="일반">
										<option value="1"
											<c:if test="${row.ograde eq 1}">selected="selected"</c:if>>일반</option>
									</optgroup>
									<optgroup label="관리자">
										<option value="2"
											<c:if test="${row.ograde eq 2}">selected="selected"</c:if>>관리자</option>
									</optgroup>

								</select>
							</div>
						</div>
					</c:forEach>

					<button type="button" class="btn btn-lg text-white float-end"
						style="background-color: #EB5757;"
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
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>
