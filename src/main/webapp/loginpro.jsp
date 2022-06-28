<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.SignUpDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("passwd1");

	SignUpDAO sdao = new SignUpDAO();
	
	int result = sdao.getMember(id, pass);// 1
	
	if(result == 0){

%>
	<script type="text/javascript">
		alert("회원 아이디 또는 패스워드가 틀립니다.");
		location.href='index.jsp?center=login.jsp';
	</script>

	<%
	}else{
		session.setAttribute("id", id);
		response.sendRedirect("index.jsp");
		
	}	
	%>
</body>
</html>
