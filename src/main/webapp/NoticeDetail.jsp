<%@page import="bna.vo.NoticeVO"%>
<%@page import="bna.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<link rel="stylesheet" type="text/css" href="css/noticeDetail.css?ver=2">
</head>
<%
	int noticenum =Integer.parseInt(request.getParameter("noticenum"));
	NoticeDAO ndao = new NoticeDAO();
	NoticeVO nvo = ndao.oneSelectNotice(noticenum);	
%>
		<table style="margin-top: 50px;" border="1">
		<tr>
			<td colspan="4" style="padding : 20px; background-color: #0066FF; font-size: 30px; color: white;">공지사항 상세보기</td>
		</tr>
		<tr>
			<td style="padding: 20px;">번호</td>
			<td><%=nvo.getNoticenum()%></td>
			<td>조회수</td>
			<td><%=nvo.getReadcount() %></td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">작성자</td>
			<td><%=nvo.getWriter() %></td>
			<td>작성일자</td>
			<td><%=nvo.getNoticedate()%></td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">제목</td>
			<td colspan="3"><%=nvo.getTitle()%></td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">내용</td>
			<td colspan="3"><%=nvo.getContent() %></td>
		</tr>
		<%
			String id = (String)session.getAttribute("id"); 
		if(id!=null)
			if(id.equals("admin")){
		%>
		<tr>
			<td colspan="4" align="center" style="padding: 20px;">
				<input style="font-size: 20px; padding: 5px;" type="button" value="수정하기" onclick="location.href='index.jsp?main=NoticeUpdate.jsp?writer=<%=nvo.getWriter()%>&&noticenum=<%=nvo.getNoticenum()%>&&title=<%=nvo.getTitle()%>&&content=<%=nvo.getContent()%>'">
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>