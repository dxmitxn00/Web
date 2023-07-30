<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.MemberVO,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=t(session.getAttribute("mid%>님이 구매한 상품들입니다.
<hr>
<ol>
<%
p

	ArrayList<MemberVO> cart=(ArrayList<MemberVO>)session.getAttribute("cart");
	for(MemberVO v:cart){
		out.println("<li>"+v+"</li>");
	}
%>
</ol>
<hr>
<a href="a.jsp">메인으로 돌아가기</a>

</body>
</html>