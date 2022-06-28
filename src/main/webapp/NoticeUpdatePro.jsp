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
<jsp:useBean id="nvo" class="bna.vo.NoticeVO"/>
<jsp:setProperty property="*" name="nvo"/>
<%
//업데이트 결과부터 시작	
	NoticeDAO ndao = new NoticeDAO();
	ndao.noticeUpdate(nvo);
	response.sendRedirect("index.jsp?main=Notice.jsp");
%>
</body>
</html>