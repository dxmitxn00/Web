<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>

	<%
	BoardVO data=(BoardVO)request.getAttribute("data");
	%>
	
	<h3>제목 | <%= data.getTitle() %></h3>
	글 번호 | <%= data.getNum() %><br>
	작성자 | <%= data.getWriter() %><br>
	
	<hr>
	<br>
	내용 : <%= data.getContent() %>
	
	<br>
	<br>
	<br>
	<br>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="action" value="deleteBoard">
		<input type="hidden" name="writer" value="<%=data.getWriter() %>">
		<input type="hidden" name="num" value="<%=data.getNum() %>"><br>
		<input type="submit" value="글 삭제">
	</form>
	<hr>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="action" value="updateBoard">
		<h3>게시글 수정</h3>
		제목 <input type="text" name="title"><br>
		내용 <input type="text" name="content"><br>
		<input type="hidden" name="writer" value="<%=data.getWriter() %>">
		<input type="hidden" name="num" value="<%=data.getNum() %>"><br>
		<input type="submit" value="글 수정">
	</form>
	<hr>
	<a href='controller.jsp?action=main'>메인으로 돌아가기</a>

</body>
</html>