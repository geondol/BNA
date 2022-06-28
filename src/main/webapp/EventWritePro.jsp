<%@page import="bna.dao.EventDAO"%>
<%@page import="bna.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기 처리</title>
</head>
<body>
	<jsp:useBean id="evo" class="bna.vo.EventVO"/>
	<jsp:setProperty property="*" name="evo"/>
	<!-- boardVO에 넘어온 값들 셋팅 -->
	
	<%
	EventDAO edao = new EventDAO();
	edao.insert(evo);
	response.sendRedirect("index.jsp?main=Event.jsp");
	%>
	
</body>
</html>