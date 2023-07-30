<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

	<form action="controller.jsp" method="post">
	<input type="hidden" name="action" value="updateMember">
	<h4>비밀번호 변경</h4>
	<input type="hidden" name="mid" value="<%= session.getAttribute("mid") %>">
	<input type="hidden" name="name" value="<%= session.getAttribute("name") %>">
	<input type="password" name="mpw">
	<input type="submit" value="변경">
	</form>
	
	<br>
	<form action="controller.jsp" method="post">
	<input type="hidden" name="action" value="deleteMember">
	<input type="hidden" name="mid" value="<%= session.getAttribute("mid") %>">
	<input type="submit" value="회원탈퇴">
	</form>
	
	<br>
	<hr>
	<a href='controller.jsp?action=main'>메인으로 돌아가기</a>
	
</body>
</html>