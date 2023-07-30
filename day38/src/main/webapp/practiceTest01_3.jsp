<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, practiceTest01.ProductVO" %>
<jsp:useBean id="O p" class="w MemberVO.Product" />
<jsp:setProperty property="*" name="pVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제01_결제 페이지</title>
</head>
<body>

<h1>결제 페이지</h1>
<ul>
	<%
		ArrayList<String> datas=(ArrayList<String>)session.getAttribute("datas");
		if(datas == null){
			out.println("장바구니가 비어있습니다!");
		}
		else{
			for(String v:datas){
				out.println("<li>"+v+"</li>");
			}
		}
	%>
</ul>

</body>
</html>