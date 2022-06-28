<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<link rel="stylesheet" type="text/css" href="css/noticewrite.css?ver=1">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String writer = request.getParameter("writer");
	int noticenum = Integer.parseInt(request.getParameter("noticenum"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>
	<form action="NoticeUpdatePro.jsp" method="post">
		<table style="margin-top: 50px;" border="1">
			<tr>
			 	<td colspan="2" style="padding: 20px; background-color: #0066FF; font-size: 30px; color: white;">공지사항 수정</td>
		 	</tr>
		 	<tr>
			 	<td style="padding: 20px;">작성자</td>
			 	<td><%=writer%></td>
		 	</tr>
		 	<tr>
			 	<td style="padding: 20px;">글제목</td>
			 	<td><input style="font-size: 20px;" type="text" name="title" size="40" value="<%=title%>"></td>
		 	</tr>
		 	<tr>
			 	<td style="padding: 20px;">글내용</td>
			 	<td><textarea style="width: 100%; font-size: 18px;" rows="20" cols="100" name="content"><%=content%></textarea></td>
		 	</tr>
		 	<tr>
		 		<td colspan="2" style="padding: 20px;">
			 		<input style="font-size: 20px; padding: 5px;" type="submit" value="수정하기">
			 		<input type="hidden" name="noticenum" value="<%=noticenum%>">
		 		</td>
		 	</tr>
		 </table>
	</form>
</body>
</html>