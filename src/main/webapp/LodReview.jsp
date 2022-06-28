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
	int lodnum = Integer.parseInt(request.getParameter("lodnum"));
	ListDAO ldao = new ListDAO();
	Vector<ListVO> v = ldao.getLodReview(lodnum);
%>
<link rel="stylesheet" href="css/review.css?v=<?php echo time(); ?>">
</head>
<body>
<!-- 바디 -->
<% 
for(int i=0;i<v.size();i++){
ListVO lvo = v.get(i);
%>
	<div class="lodrevbox">
		<div class="lodrevname"><%=lvo.getLodrevname()%></div>
		<div class="lodrevcont"><%=lvo.getLodrevcont()%></div>
	</div><br>	
<%
}
%>	
</body>
</html>