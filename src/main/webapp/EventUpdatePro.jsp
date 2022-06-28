<%@page import="bna.dao.EventDAO"%>
<%@page import="bna.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="evo" class="bna.vo.EventVO"/>
<jsp:setProperty property="*" name="evo"/>
<%
//업데이트 결과부터 시작	
	EventDAO edao = new EventDAO();
	edao.eventUpdate(evo);
	response.sendRedirect("index.jsp?main=Event.jsp");
%>
</body>
</html>