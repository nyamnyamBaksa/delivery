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
  if(confirm(name + "님의 등급을 변경하시겠습니까?")){
    location.href="./gradeChange?mno="+mno+"&grade="+value;
  }
}
</script>
</head>
<body>
	<div class="container">
		<%--@ include file="menubar.jsp"--%>
		<div class="main">
			<div class="article">
				<h1>회원관리</h1>
				<div class="div-table">
					<div class="div-row table-head">
						<div class="div-cell table-head">번호</div>
						<div class="div-cell table-head">아이디</div>
						<div class="div-cell table-head">닉네임</div>
						<div class="div-cell table-head">주소</div>
						<div class="div-cell table-head">가입날짜</div>
						<div class="div-cell table-head">고객등급</div>
					</div>
					<c:forEach items="${memberList}" var="row">
						<div class="div-row">
							<div class="div-cell">${row.mno}</div>
							<div class="div-cell">${row.mid}</div>
							<div class="div-cell">${row.mnickname}</div>
							<div class="div-cell">${row.maddr}</div>
							<div class="div-cell">${row.mjoindate}</div>
							<div class="div-cell">
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>
