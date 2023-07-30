<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.MemberVO,java.util.ArrayList" %>
<jsp:useBean id="mDAO" class="test.MemberDAO" />
<jsp:useBean id="mVO" class="test.MemberVO" />
<jsp:setProperty property="*" name="mVO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제03_강사님풀이</title>
</head>
<body>

<script type="text/javascript">
<%
if(request.getMethod().equals("POST")){
   
   if(request.getParameter("action").equals("login")){
   
   MemberVO data=mDAO.selectOne(mVO);
   if(data != null){
      out.println("alert('"+data.getMid()+"님, 로그인 성공!');");
   }
   else{
      out.println("alert('로그인 실패...');");
   }
   
   }
   else if(request.getParameter("action").equals("signup")){
      boolean flag=mDAO.insert(mVO);
      if(flag){
         out.println("alert('회원가입 성공!');");
      }
      else{
         out.println("alert('회원가입 실패...');");
      }
   }
}
%>
</script>

<script type="text/javascript">
   function signup(){
      var ans=confirm('입력하신 정보로 회원가입을 할까요?');
      if(ans==true){
         document.test.action.value="signup";
         document.test.submit();
      }
      else {
         return;
      }
   }
</script>

<form method="post" name="test">
   <input type="hidden" name="action" value="login">
   아이디 <input type="text" name="mid"> <br>
   비밀번호 <input type="password" name="mpw"> <br>
   <input type="button" value="회원가입" onClick="signup()">
   <input type="submit" value="로그인">
</form>

<hr>

<h2>회원목록</h2>
<ul>
<%
   ArrayList<MemberVO> datas=mDAO.selectAll(null);
   for(MemberVO v:datas){
      // out.println("<li>"+v+"</li>");
%>
   <li><%=v%></li>
<%
   }
%>
</ul>

</body>
</html>