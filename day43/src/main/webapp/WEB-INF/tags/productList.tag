<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="border" %>
<%@ attribute name="bgcolor" %>

<jsp:useBean id="pb" class="test.ProductBean" />

<h1><jsp:doBody /></h1>
<hr>
<table border="${border}" bgcolor="${bgcolor}">
	<% for(String v : pb.getPdatas()){ %>
		<tr><td><%=v%></td></tr>
	<% } %>
</table>