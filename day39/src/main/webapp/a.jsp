<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html> 

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8"); // 한글로 보여주기

if(session.getAttribute("mname")==null){ // 세션에 mVO의 mname이 저장되어있지 않으면,
%>
<h2>로그인</h2>
<form action="b.jsp" method="post">
	아이디 <input type="text" name="mid" required>
	비밀번호 <input type="password" name="mpw" required>
	<input type="submit" value="로그인">
</form>
<%
}
else{ // 세션에 mVO의 mname이 저장되어 있으면(로그인되어 있으면),
	out.println(session.getAttribute("mname")+"님 환영합니다 :D    |    <a href=d.jsp>로그아웃</a>");
}
%>
<hr>
<form action="c.jsp" method="post">
글 작성하기<br>
<input type="text" name="geul" required>
<input type="submit" value="등록">
</form>
<hr>
<%
ArrayList<String> word = (ArrayList<String>)application.getAttribute("word");
// 작성한 글을 담을 객체 배열 리스트 선언 ㄴ> application에 저장된 word는 String 타입이어서	
//										     ArrayList<String> 타입으로 형변환해줌

if(word == null){
	out.println("<h3>작성된 글이 없습니다..!</h3>");
}
else{
	for(String v:word){
		out.println("<li>"+v+"</li>");
	}
}
%>

</body>
</html>