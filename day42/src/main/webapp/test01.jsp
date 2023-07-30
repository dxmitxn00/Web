<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
												<!-- ㄴ> 라이브러리를 어떤 형식으로 불러낼지 -->
<jsp:useBean id="pb" class="test.ProductBean" scope="session"/>
												<!--  ㄴ> 세션을 주어서 다른 페이지에서도 pb사용 가능해짐 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택 페이지</title>
</head>
<body>

<form action="test02.jsp" method="post">
	<select name="product">
		<!-- JAVA의 for문 기능을 가지는 태그 -->
		<!-- JSTL에서 구현해놓았다! -->
		 <c:forEach var="v" items="${pb.pdatas}">
         <option>${v}</option>

				<!-- ㄴ> EL식 : 오직 뷰를 위해서만 있는,
								간단한 연산 정도 가능한 식 -->
		</c:forEach>
	</select>
	<input type="submit" value="상품 선택">
</form>

</body>
</html>