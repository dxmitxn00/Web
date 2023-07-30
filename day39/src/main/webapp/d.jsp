<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.MemberVO"%>
<jsp:setProperty property="*" name="mVO"/>

<%
session.removeAttribute("mname");
%>
<script>
alert("로그아웃 되었습니다!")
location.href="a.jsp";
</script>


