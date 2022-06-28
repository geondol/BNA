<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = (String) session.getAttribute("id");
%>
<body>
	<table>
		<tr height="50">
			<td><h3><a href="index.html">홈으로</a></h3></td>
		</tr>
		<tr height="50">
			<td><h3><a href="lodList.jsp">숙소보러가기</a></h3></td>
		</tr>
		<tr height="50">
			<td><h3><a href="actList.jsp">체험숙소보러가기</a></h3></td>
		</tr>
		<tr height="50">
			<td><h3><a href="Mypage.jsp">돌아가기</a></h3></td>
		</tr>
	</table>
</body>
</html>