<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="v" items="${datas}">
	<form action="insertReply.do" method="post">
		<input type="text" name="rcontent" required placeholder="댓글을 작성하세요.">
		<input type="submit" value="댓글 등록하기">
	</form>
</c:forEach>