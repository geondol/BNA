<%@page import="bna.dao.Act_ReservationDAO"%>
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
	int actresnum = Integer.parseInt(request.getParameter("actresnum"));
	
	Act_ReservationDAO lrdao = new Act_ReservationDAO();
	lrdao.deleteactres(actresnum);
%>

	<script type="text/javascript">
		alert("삭제 완료")
		location.href="Manager_Main.jsp?center=Mg_Act_Reservation_List.jsp"
	</script>
</body>
</html>