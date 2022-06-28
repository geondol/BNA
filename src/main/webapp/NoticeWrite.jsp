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
	<form action="NoticeWritePro.jsp" method="post">
		<table border="1" style="margin-top: 50px;">
			<tr>
			 	<td colspan="2" style="padding:20px; background-color: #0066FF; font-size: 30px; color: white;">공지사항 글쓰기</td>
		 	</tr>
		 	<tr>
			 	<td style="padding: 20px;">작성자</td>
			 	<td>관리자</td>
		 	</tr>
		 	<tr>
			 	<td style="padding: 20px;">글제목</td>
			 	<td><input type="text" name="title" size="40" style="font-size: 20px;" ></td>
		 	</tr>
		 	<tr>
			 	<td style="padding: 20px;">글내용</td>
			 	<td><textarea style="width: 100%; font-size: 18px;" rows="20" cols="100" name="content"></textarea> </td>
		 	</tr>
		 	<tr>
		 		<td colspan="2" style="padding: 20px;">
			 		<input style="font-size: 20px; padding: 5px;" type="submit" value="등록">&nbsp;&nbsp;&nbsp;
			 		<input style="font-size: 20px; padding: 5px;" type="button" value="공지사항 전체" onclick="location.href='index.jsp?main=Notice.jsp'">
			 		<input type="hidden" name="writer" value="관리자">
		 		</td>
		 	</tr>
		 </table>
	</form>
</body>
</html>