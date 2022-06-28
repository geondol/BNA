<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bna.dao.CustDAO" %>
<%@ page import = "bna.vo.CustVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
	
	CustDAO sdao = new CustDAO();
	CustVO svo = sdao.getOneUpdatemember(id);
%>
<h1 align="center">정말 탈퇴하시겠습니까?</h1><br>
<form action="MypageDeletePro.jsp" method="post">
	<table border="1" align="center" style="border-collapse:collapse;">
		<tr height="50">
			<td align="center" width="100">아이디</td>
			<td align="center" width="200">
				<%=svo.getId() %>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="100">이름</td>
			<td align="center" width="200">
				<%=svo.getName() %>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="hidden" name="id" value="<%=svo.getId() %>">
				<input type="submit" value="탈퇴">&nbsp;
				<input type="button" value="돌아가기" onclick="location.href='Mypage.jsp?right=right.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>