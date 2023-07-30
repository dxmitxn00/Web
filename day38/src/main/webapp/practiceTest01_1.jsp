<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.ProductVO"%>
<%-- <jsp:useBean id="pDAO" class="practiceTest01.ProductDAO" /> --%>
<jsp:useBean id="O p" class="w MemberVO.Product" />
<jsp:setProperty property="*" name="pVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제01_상품선택</title>
</head>
<body>

<form action="practiceTest01_2.jsp">
상품 <select name="product">
	<option>티셔츠</option>
	<option>목도리</option>
	<option>청바지</option>
	<option>운동화</option>
	<option>가방</option>
</select>
<input type="submit" value="장바구니에 추가하기">
</form>
<hr>
<a href="practiceTest01_3.jsp">최종 결제하기</a>

</body>
</html>