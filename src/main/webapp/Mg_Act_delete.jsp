<%@page import="bna.dao.ActDAO"%>
<%@page import="bna.dao.CustomerDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	int actnum = Integer.parseInt(request.getParameter("actnum"));
	
	ActDAO adao = new ActDAO();
	adao.deleteAct(actnum);
%>

	<script type="text/javascript">
		alert("삭제 완료")
		location.href="Manager_Main.jsp?center=Mg_Customer_List.jsp"
	</script>
</body>
</html>