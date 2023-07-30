<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫 페이지</title>
</head>
<body>

<h1>첫 페이지</h1>
<hr>
${ data.name } | ${ data.age } <br>
<ul>
	<c:forEach var="v" items="${ datas }">
		<li><c:out value="${ v.name }"escapeXml="false"><font color='red'>이름없음</font></c:out></li>
		<!-- cout에서 value가 없으면 이름없음으로 뜨게 함 -->
	</c:forEach>
</ul>

</body>
</html>