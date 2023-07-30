<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.MemberVO,java.util.ArrayList" %>
<jsp:useBean id="pD" class="w" />
<jsp:useBean id="pVO" class="model.MemberVO" />
<jsp:setProperty property="*" name="pVO" />
<%
MemberVO data = pDAO.selectOne( pVO );
	
	ArrayList<MemberVO> cart=(ArrayList<MemberVO>)session.getAttribute("cart");
	
	if(cart == null){
		cart=new ArrayList<MemberVO>();
		session.setAttribute("cart", cart);
	}
	
	cart.add(data);
%>
<script>
	alert('<%=data.getName()%>이(가) 장바구니에 추가되었습니다! :D');
	location.href='a.jsp';
</script>