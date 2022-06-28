<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.SignUpDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>

<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="snp" class="bna.vo.SignUpVO" > 
<jsp:setProperty name="snp" property="*"/>
</jsp:useBean>



<%
	SignUpDAO sdao = new SignUpDAO();
	sdao.insertmember(snp);
	
	response.sendRedirect("login.jsp");
	
%>

</body>
</html>