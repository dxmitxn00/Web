<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	function signup(){
		window.open("signup.jsp", "회원가입창", "width=350, height=300")
	}
</script>

<c:if test="${empty mid}">
	<a href="javascript:signup()">회원가입</a>
	<form action="login.do" method="post">
		<input type="text" name="mid" placeholder="아이디 입력" required>
		<input type="password" name="mpw" placeholder="비밀번호 입력" required>
		<input type="submit" value="로그인">
	</form>
</c:if>
<c:if test="${not empty mid}">
	<a href='mypage.do'>${mid}님의 마이페이지</a><br>
	<a href='logout.do'>로그아웃</a>
</c:if>