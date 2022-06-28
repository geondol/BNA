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
			<td><h3><a href="Resr.jsp">숙소예약확인</a></h3></td>
		</tr>
		<tr height="50">
			<td><h3><a href="Mypage.jsp?right=MypageDetail.jsp">회원정보조회</a></h3></td>
		</tr>
		<tr height="50">
			<td><h3><a href="Mypage.jsp?right=MypageUpdate.jsp">회원정보수정</a></h3></td>
		</tr>
		<tr height="50">
			<td><h3><a href="Mypage.jsp?right=MypageDelete.jsp">회원탈퇴</a></h3></td>
		</tr>
	</table>
</body>
</html>