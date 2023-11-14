<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || 회원관리</title>
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
function gradeCh(mno, name, value){
  if(confirm(name + "님의 등급을 변경합니다.")){
    location.href="./gradeChange?mno="+mno+"&grade="+value;
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
				<h1>회원관리</h1>
				<div class="div-table">
					<div class="div-row table-head">
						<div class="div-cell table-head">선택</div>
						<div class="div-cell table-head">번호</div>
						<div class="div-cell table-head">아이디</div>
						<div class="div-cell table-head">닉네임</div>
						<div class="div-cell table-head">주소</div>
						<div class="div-cell table-head">가입날짜</div>
						<div class="div-cell table-head">고객등급</div>
					</div>
					<c:forEach items="${memberList}" var="row">
						<div class="div-row">


							<div class="div-cell">
								<input type="checkbox" name="selectedMembers" value="${row.mno}"
									onclick="toggleSelection(${row.mno})">
							</div>

							<div class="div-cell">${row.mno}</div>
							<div class="div-cell">${row.mid}</div>
							<div class="div-cell">${row.mnickname}</div>
							<div class="div-cell">${row.maddr}</div>
							<div class="div-cell">${row.mjoindate}</div>
							<div class="div-cell">

								<!-- 회원 등급 변경 선택 및 onchange 이벤트 -->

								<select class="grade"
									onchange="gradeCh(${row.mno}, '${row.mnickname}', this.value)">
									<optgroup label="탈퇴">
										<option value="0"
											<c:if test="${row.mgrade eq 0}">selected="selected"</c:if>>탈퇴</option>
									</optgroup>
									<optgroup label="일반">
										<option value="1"
											<c:if test="${row.mgrade eq 1}">selected="selected"</c:if>>일반</option>
									</optgroup>
									<optgroup label="관리자">
										<option value="2"
											<c:if test="${row.mgrade eq 2}">selected="selected"</c:if>>관리자</option>
									</optgroup>

								</select>
							</div>


						</div>
					</c:forEach>
					<!-- 회원삭제버튼 -->


					<button type="button" class="btn btn-lg text-white float-end"
						style="background-color: #EB5757;"
						onclick="deleteSelectedMembers()">회원삭제</button>
					<!-- button type="button" class="btn text-white" style="background-color: #EB5757;">회원삭제</button -->

					<script>
// 선택된 회원을 추적하기 위한 배열
var selectedMembers = [];

// 체크박스 클릭 이벤트 핸들러
function toggleSelection(mno) {
    if (selectedMembers.includes(mno)) {
        selectedMembers = selectedMembers.filter(item => item !== mno);
    } else {
        selectedMembers.push(mno);
    }
}

// 회원 삭제 버튼 클릭 이벤트 핸들러
function deleteSelectedMembers() {
    if (selectedMembers.length === 0) {
        alert("삭제할 회원을 선택해주세요.");
        return;
    }

    if (confirm("선택한 회원을 삭제하시겠습니까?")) {
        // 서버로 선택된 회원 목록을 보내서 삭제 작업을 수행
        var selectedMembersStr = selectedMembers.join(',');
        location.href = "./deleteMembers?mnoList=" + selectedMembersStr;
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
