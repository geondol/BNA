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
	String id = request.getParameter("id");
	
	CustomerDAO cdao = new CustomerDAO();
	cdao.deleteCustomer(id);
%>

	<script type="text/javascript">
		alert("삭제 완료")
		location.href="Manager_Main.jsp?center=Mg_Customer_List.jsp"
	</script>
</body>
</html>