<%@page import="bna.dao.LodDAO"%>
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
	int lodnum = Integer.parseInt(request.getParameter("lodnum"));
	
	LodDAO ldao = new LodDAO();
	ldao.deleteLod(lodnum);
%>

	<script type="text/javascript">
		alert("삭제 완료")
		location.href="Manager_Main.jsp?center=Mg_Lod_List.jsp"
	</script>
</body>
</html>