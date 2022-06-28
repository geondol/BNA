<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bna.vo.CustVO"%>
<%@page import="bna.dao.CustDAO"%>
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
<h1 align="center">회원 정보 수정</h1><br>
<form action="MypageUpdatePro.jsp" method="post">
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
		<tr height="50">
			<td align="center" width="100">패스워드</td>
			<td align="center" width="200">
				<input type="text" name="passwd1" size="20" value=<%=svo.getPasswd1() %>>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="100">이메일</td>
			<td align="center" width="200">
				<input type="email" name="mail" size="20" value=<%=svo.getMail() %>>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="100">전화번호</td>
			<td align="center" width="200">
				<input type="text" name="tele" size="20" value=<%=svo.getTele() %>>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="100">주소</td>
			<td align="center" width="200">
				<input type="text" name="address" size="20" value=<%=svo.getAddress() %>>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="300">나이</td>
			<td align="center" width="200">
				<input type="text" name="age" size="20" value=<%=svo.getAge() %>>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="hidden" name="id" value="<%=svo.getId() %>">
				<input type="hidden" name="passwd1" value="<%=svo.getPasswd1() %>">
				<input type="hidden" name="mail" value="<%=svo.getMail() %>">
				<input type="hidden" name="tele" value="<%=svo.getTele() %>">
				<input type="hidden" name="address" value="<%=svo.getAddress() %>">
				<input type="hidden" name="age" value="<%=svo.getAge() %>">
				<input type="submit" value="수정">&nbsp;
				<input type="reset" value="취소">&nbsp;
				<input type="button" value="돌아가기" onclick="location.href='Mypage.jsp?right=right.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>