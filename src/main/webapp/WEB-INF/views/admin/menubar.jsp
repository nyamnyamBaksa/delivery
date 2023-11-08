<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Insert title here</title>

<script type="text/javascript">
	
function link(url){
	location.href="./"+url
}	
	
</script>
<style>
        .menubar {
            
            background-color: white;
            color: white;
            
        }
    </style>
</head>
<body>

			<div class="menubar">
			<table>
				
				<td>
					<td><img class="img" alt="" src="/img/menubar_member.png"
						 onclick="link('list-member')"></td>
				</td>
				<td>
					<td><img class="img" alt="" src="/img/menubar_owner.png"
						 onclick="link('list-owner')"></td>
				</td>
				
			

			</table>
		</div>
</body>
</html>