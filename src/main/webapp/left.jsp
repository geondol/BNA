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

	if(id == null){
		id = "guest";
	}
%>
<table>
	<tr height="50">
		<td colspan="2" align="center" style="padding-top:30px;">
			<img src="images/profile2.png" width="200" height="150" alt="image">
		</td>
	</tr>
	<tr height="50">
		<td colspan="2" align="center">
			<h3 align="center"><%=id %>님 안녕하세요.</h3>
		</td>
	</tr>
</table>
</body>
</html>