<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>

<%
String mid=(String)session.getAttribute("mid");

   if(mid==null){ // 로그인안된상태
%>
	<h3>로그인</h3>
   <form action="controller.jsp" method="post">
      <input type="hidden" name="action" value="login">
      <input type="text" name="mid">
      <input type="password" name="mpw">
      <input type="submit" value="로그인">
   </form> 
   <br>
   <a href="controller.jsp?action=signupPage">회원가입</a>
<%
}
   else{
      out.println("<a href='controller.jsp?action=myPage'>"+mid+"님의 마이페이지</a> | <a href='controller.jsp?action=logout'>로그아웃</a>");
   }
%>

<hr>

<table border="1">
   <tr>
      <th>글 번호</th><th>글 제목</th><th>작성자</th>
   </tr>
   <%
   ArrayList<BoardVO> datas=(ArrayList<BoardVO>)request.getAttribute("datas");
               for(BoardVO v:datas){
   %>
   <tr>
      <td><a href="controller.jsp?action=board&num=<%=v.getNum()%>"><%=v.getNum()%></a></td>
      <td><%=v.getTitle()%></td>
      <td><%=v.getWriter()%></td>
   </tr>
   <%
      }
   %>
</table> 
<br>
<%
   if(mid!=null){
      out.println("<a href='controller.jsp?action=boardPage'>게시글 작성</a>");
   }
%>

</body>
</html>