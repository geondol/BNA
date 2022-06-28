<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ListDAO" %>
<%@ page import="bna.vo.ListVO" %>
<%@ page import ="java.util.Vector" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int actnum = Integer.parseInt(request.getParameter("actnum"));
	ListDAO ldao = new ListDAO();
	Vector<ListVO> v = ldao.getActReview(actnum);
%>
<link rel="stylesheet" href="css/review.css?v=<?php echo time(); ?>">
</head>
<body>
<!-- 바디 -->
<% 
for(int i=0;i<v.size();i++){
ListVO lvo = v.get(i);
%>
	<div class="actrevbox">
		<div class="actrevname"><%=lvo.getActrevname()%></div>
		<div class="actrevcont"><%=lvo.getActrevcont()%></div>
	</div><br>	
<%
}
%>	
</body>
</html>