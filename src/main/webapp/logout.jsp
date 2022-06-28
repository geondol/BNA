<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
</head>
<body>
<%
	String logout = request.getParameter("logout");
	
	if(logout == null){
		session.setAttribute("id", null);
		session.setMaxInactiveInterval(0);//유지시간 0으로 변경
		session.invalidate();//세션 해제
	}
	response.sendRedirect("index.jsp");
%>
</body>
</html>