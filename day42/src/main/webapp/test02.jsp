<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pb" class="test.ProductBean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>

선택한 상품은 ${param.product} <br>
num1 + num2 = ${pb.num1 + pb.num2}

</body>
</html>