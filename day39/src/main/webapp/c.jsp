<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("UTF-8");

ArrayList<String> word = (ArrayList<String>) application.getAttribute("word");
// 작성한 글을 저장하려고 만든 객체 배열
String geul = request.getParameter("geul");
// 가져온 글을 저장하려고 만든 변수

if (session.getAttribute("mname") != null) { // 세션에 mVO의 name값이 저장 안되어 있으면,
											// == 로그인이 안되어있으면,
	if (word == null) { // 작성한 글을 담을 객체 배열이 없으면,
		word = new ArrayList<String>(); // 객체 배열 새로 초기화

		application.setAttribute("word", word); // application에 작성한 글 저장
		/*
		session : 일정시간 동안은 데이터가 남아있지만, 일정 시간 후에 날라감
		application : 서버가 닫히기 전까지는 데이터가 계속 저장됨 -> 페이지 닫았다 열어도 데이터 그대로
		*/
	}

	word.add(0,"["+session.getAttribute("mname")+"] "+geul);
%>
<script>
	alert("글이 성공적으로 등록되었습니다!");
	location.href = "a.jsp"; // location : 데이터 가지고 이동
							 // response : 데이터 안가지고 이동
</script>
<%
} else {
%>
<script>
	alert("로그인을 먼저 진행해주세요!");
	history.go(-1);
</script>
<%
}
%>
