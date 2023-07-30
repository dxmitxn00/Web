<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="test.MemberDAO" />
<jsp:useBean id="mvo" class="test.MemberVO" />
<jsp:setProperty property="*" name="mvo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제03_못풀음,,</title>
</head>
<body>

	<form method="post">
		아이디 <input type="text" name="mid"> <br>
		비밀번호 <input type="password" name="mpw"> <br>
	</form>	
	

	<script type="text/javascript">
	function login(){
		<%
		if(request.getMethod().equals("POST")){
			if(mdao.selectOne(mvo)!=null){
		%>
				alert('로그인 가능!');
		<%	}
			else {
		%>
				alert('로그인 불가능..');
		<%	}	
		}
		%>
	}
	function print(){
		if(request.getMethod().equals("POST")){
			mdao.selectAll();
		}
	}
	</script>

	<button class=btn1 onclick="login()">버튼1</button>
	<button class=btn2 onclick="print()">버튼2</button>
</body>
</html>