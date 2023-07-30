<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<h3>회원가입</h3>
<form action="controller.jsp" method="post">
	<input type="hidden" name="action" value="signup">
	아이디 <input type="text" name="mid"><br>
	비밀번호 <input type="password" name="mpw"><br>
	이름 <input type="text" name="name"><br>
	<br>
	<input type="submit" value="가입">
</form>

<hr>
<a href='controller.jsp?action=main'>메인으로 돌아가기</a>

</body>
</html>