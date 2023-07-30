<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.MemberVO,java.util.ArrayList"%>
<jsp:useBean id="mDAO" class="model.MemberDAO"/>
<jsp:useBean id="mVO" class="model.MemberVO"/>
<jsp:setProperty property="*" name="mVO"/>


<%
request.setCharacterEncoding("UTF-8");

mVO = mDAO.selectOne(mVO); // mVO 변수에 selectOne에서 반환된 값 가져오기

if(mVO==null){ // 해당 회원이 없으면,
	out.println("<script>alert('로그인 실패...');</script>");
	out.println("<script>location.href='a.jsp';</script>");
	
}
else{ // 해당 회원이 있으면,
	session.setAttribute("mname", mVO.getMname()); // mname 변수에 mVO 이름값을 세션에 저장
	out.println("<script>location.href='a.jsp';</script>");
}
%>

