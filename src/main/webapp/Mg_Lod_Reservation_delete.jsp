<%@page import="bna.dao.Lod_ReservationDAO"%>
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
	int lodresnum = Integer.parseInt(request.getParameter("lodresnum"));
	
	Lod_ReservationDAO lrdao = new Lod_ReservationDAO();
	lrdao.deletelodres(lodresnum);
%>

	<script type="text/javascript">
		alert("삭제 완료")
		location.href="Manager_Main.jsp?center=Mg_Lod_Reservation_List.jsp"
	</script>
</body>
</html>