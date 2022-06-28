<%@page import="bna.dao.NoticeDAO"%>
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
	int noticenum = Integer.parseInt(request.getParameter("noticenum"));
	
	NoticeDAO ndao = new NoticeDAO();
	ndao.deleteNotice(noticenum);
%>

	<script type="text/javascript">
		alert("삭제 완료")
		location.href="index.jsp?main=Notice.jsp"
	</script>
</body>
</html>