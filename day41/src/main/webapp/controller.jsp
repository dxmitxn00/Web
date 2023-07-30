<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,model.BoardVO" %>
<jsp:useBean id="bDAO" class="model.BoardDAO" />
<jsp:useBean id="mDAO" class="model.MemberDAO" />
<jsp:useBean id="mVO" class="model.MemberVO" />
<jsp:setProperty property="*" name="mVO" />
<jsp:useBean id="bVO" class="model.BoardVO" />
<jsp:setProperty property="*" name="bVO" />
<%
String action=request.getParameter("action");

	System.out.println("로그: controller.jsp");
	System.out.println("action :"+ action);
	System.out.println("bVO :"+ bVO);
	System.out.println("mVO :"+ mVO);

   if(action.equals("main")){
      ArrayList<BoardVO> datas=bDAO.selectAll(null);
      request.setAttribute("datas", datas);
      request.getRequestDispatcher("b_main.jsp").forward(request, response);
   }
   else if(action.equals("board")){
      bVO=bDAO.selectOne(bVO);
      if(bVO!=null){
         request.setAttribute("data", bVO);
         request.getRequestDispatcher("d_board.jsp").forward(request, response);
      }
   }
   
   
   else if(action.equals("login")){
      mVO = mDAO.selectOne(mVO); // mVO에 mid,mpw가 setter에 의해 저장됨
      if(mVO==null){
         out.println("<script>alert('로그인 실패...');history.go(-1);</script>");
      }
      else{
         session.setAttribute("mid", mVO.getMid());
         response.sendRedirect("controller.jsp?action=main");
      }
   }
   else if(action.equals("logout")){
      session.removeAttribute("mid");
      response.sendRedirect("controller.jsp?action=main");
   }
   
   
   else if(action.equals("signupPage")){ 
	  response.sendRedirect("e_signup.jsp"); // 회원가입 페이지로 넘기기
   }
   else if(action.equals("signup")){
	   if(mDAO.insert(mVO)){ // 입력받아오면,
		   out.println("<script>alert('회원가입 성공!')</script>"); // 성공알림
		   out.println("<script> location.href='controller.jsp?action=main';</script>"); // 메인 페이지로 이동
	   }
	   else{ // 데베에 회원정보 추가 못하면,
		   out.println("<script>alert('회원가입 실패...');history.go(-1)</script>"); // 실패 알림
	   }
   }
   
   
   else if(action.equals("myPage")){ // 마이페이지
	   response.sendRedirect("f_mypage.jsp"); // 마이페이지로 이동
   }
   else if(action.equals("updateMember")){ // 회원정보 변경
	   if(mDAO.update(mVO)){ // 비번 변경 성공
		   out.println("<script>alert('비밀번호 변경 성공!');history.go(-1)</script>");
	   }
	   else{ // 비번 변경 실패
		   out.println("<script>alert('비밀번호 변경 실패...');history.go(-1)</script>");
	   }
   }
   else if(action.equals("deleteMember")){ // 회원탈퇴
	   if(mDAO.delete(mVO)){ // 탈퇴 성공
		   session.removeAttribute("mid");
		   out.println("<script>alert('회원 탈퇴 성공!');</script>");
		   out.println("<script>location.href='controller.jsp?action=main';</script>");   
	   }
	   else{ // 탈퇴 실패
		   out.println("<script>alert('회원 탈퇴 실패...');history.go(-1)</script>");
	   }
   }
   
   
   else if(action.equals("boardPage")){ // 게시글 작성 링크
	   response.sendRedirect("c_insertBoard.jsp"); // 게시글 페이지로 이동
   }
   else if(action.equals("insertBoard")){ // 게시글 등록
	   if(bDAO.insert(bVO)){ // 등록 성공
		   out.println("<script>alert('게시글 등록 성공!');</script>");
		   out.println("<script>location.href='controller.jsp?action=main';</script>");   
	   }
	   else{
		   out.println("<script>alert('게시글 등록 실패...');history.go(-1)</script>");
	   }
   }
   
   
   else if(action.equals("updateBoard")){ // 게시글 수정
	   if(session.getAttribute("mid").equals(bVO.getWriter())){
	   		if(bDAO.update(bVO)){ // 수정 성공
		  		 out.println("<script>alert('게시글 수정 성공!');</script>");
		  		 out.println("<script>location.href='controller.jsp?action=main';</script>"); 
	   		}
	   		else{
		   		out.println("<script>alert('게시글 수정 실패...');history.go(-1)</script>");
	   		}
	   }
	   else{
		   		out.println("<script>alert('본인이 작성한 글만 수정할 수 있습니다..!');history.go(-1)</script>");		   
	   }
   }
   else if(action.equals("deleteBoard")){ // 게시글 삭제
	   if(session.getAttribute("mid").equals(bVO.getWriter())){
	   		if(bDAO.delete(bVO)){ // 수정 성공
		   		out.println("<script>alert('게시글 삭제 성공!');</script>");
		   		out.println("<script>location.href='controller.jsp?action=main';</script>"); 
	   		}
	   		else{
		   		out.println("<script>alert('게시글 삭제 실패...');history.go(-1)</script>");
	   		}
	   }
	   else{
		   		out.println("<script>alert('본인이 작성한 글만 삭제할 수 있습니다..!');history.go(-1)</script>");		   
	   }
   }
   else{
      out.println("<script>alert('action 파라미터의 값을 확인해주세요!');history.go(-1);</script>");
   }
%>