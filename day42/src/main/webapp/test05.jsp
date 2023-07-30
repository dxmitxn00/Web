<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실무 - 쇼핑몰 상품 선택 페이지</title>
</head>
<body>

	<form>
		<select name="sel">
			<option ${param.sel == 'a' ? 'selected' : ''}>a</option>
			<option ${param.sel == 'b' ? 'selected' : ''}>b</option>
			<option ${param.sel == 'c' ? 'selected' : ''}>c</option>
			<!-- a보러 페이지 들어왔으면 a를 선택해서 보여줘
				ex) 빨간색으로 검색해서 들어오면 빨간색 상품으로,
					다른 색으로 검색했으면 해당 색으로 상품 선택해놓음 -->
		</select>
		<input type="submit" value="선택">
	</form>
	
	<hr>
	
	<!-- 상대적으로 조금 오래된 문법의 JSTL -->
	<!-- when과 otherwise는 choose 안에서만 쓸 수 있음 -->
	<c:choose>
		<c:when test="${param.sel == 'a'}">
			a를 선택했습니다.
		</c:when>
		<c:when test="${param.sel == 'b'}">
			b를 선택했습니다.
		</c:when>
		<c:when test="${param.sel == 'c'}">
			c를 선택했습니다.
		</c:when>
		<c:otherwise>
			??? 잘못된 파라미터 입니다...
		</c:otherwise>
	</c:choose>

</body>
</html>