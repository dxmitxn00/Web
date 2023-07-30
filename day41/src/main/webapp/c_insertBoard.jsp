<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>

	<form action="controller.jsp" method=post>
		<input type="hidden" name="action" value="insertBoard">
		<input type="hidden" name="writer" value="<%= session.getAttribute("mid") %>">
		<h3> 글 작성</h3>
		제목 <input type="text" name="title"><br>
		내용 <input id="content" type="text" name="content"><br>
		<br>
		<input type="submit" value="등록">
	</form>

	<br>
	<hr>
	<a href='controller.jsp?action=main'>메인으로 돌아가기</a>
	
	</body>
</html>