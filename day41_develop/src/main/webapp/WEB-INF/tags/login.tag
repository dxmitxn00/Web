<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty mid}">
	<a href="signup.do">회원가입</a>
	<form action="login.do" method="post">
		<input type="hidden" name="action" value="login">
		<input type="text" name="mid" placeholder="아이디 입력" required>
		<input type="password" name="mpw" placeholder="비밀번호 입력" required>
		<input type="submit" value="로그인">
	</form>	
</c:if>
<c:if test="${not empty mid}">
		<a href='mypagePage.do'>${mid}님의 마이페이지</a>
		<a href='logout.do'>로그아웃</a>
</c:if>