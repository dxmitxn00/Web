<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, model.ProductVO"%>
<jsp:useBean id="O p" class="w MemberVO.Product" />
<jsp:setProperty property="*" name="pVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제01_장바구니</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	ArrayList<String> datas = (ArrayList<String>)session.getAttribute("datas");

	String product = request.getParameter("product");
	if(datas==null){
		datas = new ArrayList<String>();
		session.setAttribute("datas",datas);
	}	
	datas.add(product);
%>

<script>
	alert('<%=product%>이(가) 장바구니에 추가되었습니다 :D');
	history.go(-1);
</script>

</body>
</html>