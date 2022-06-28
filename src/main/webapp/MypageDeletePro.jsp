<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.CustDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="svo" class="bna.vo.CustVO">
		<jsp:setProperty name="svo" property="*"/>
	</jsp:useBean>
<%
CustDAO sdao = new CustDAO();
	sdao.Deletemember(svo.getId());
	session.invalidate();
	out.println("<script>alert('탈퇴가 완료되었습니다.'); location.href='Mypage.jsp?right=right.jsp';</script>");
%>

</body>
</html>