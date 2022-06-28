<%@page import="bna.vo.CustVO"%>
<%@page import="bna.dao.CustDAO"%>
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
	String id = (String) session.getAttribute("id");

	CustDAO sdao = new CustDAO();
	CustVO svo = sdao.getOneSelectmember(id);
%>
<h1 align="center">회원 정보 조회</h1><br>
	<table border="1" style="border-collapse:collapse;">
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
		<tr height="50">
			<td align="center" width="100">패스워드</td>
			<td align="center" width="200">
				<%=svo.getPasswd1() %>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="100">이메일</td>
			<td align="center" width="200">
				<%=svo.getMail() %>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="100">전화번호</td>
			<td align="center" width="200">
				<%=svo.getTele() %>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="100">주소</td>
			<td align="center" width="200">
				<%=svo.getAddress() %>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="300">나이</td>
			<td align="center" width="200">
				<%=svo.getAge() %>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2"><button onclick="location.href='Mypage.jsp?right=right.jsp'">돌아가기</button></td>
		</tr>
	</table>
</body>
</html>