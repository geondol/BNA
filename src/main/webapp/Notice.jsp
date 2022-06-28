<%@page import="bna.vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bna.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<link rel="stylesheet" type="text/css" href="css/notice.css?ver=2">
</head>
<body align="center" >
<%
	int pageSize = 5;
	//페이지 크기는 10

	String pageNum = request.getParameter("pageNum");
	//pageNum을 가져오는데 지금은 null
	// 10
	if(pageNum == null){
		pageNum = "1";
	}
	//pagenum은 null이기떄문에 1이 들어옴
	
	int count = 0; //전체글의 갯수 파악
	int number = 0; //페이지 넘버링 값을 저장하는 변수
	
	//현재 페이지
	int currentPage = Integer.parseInt(pageNum); // 1페이지
	//문자 1이였던 숫자가 currentPage에 숫자 1이 들어옴
	NoticeDAO ndao = new NoticeDAO();
	count = ndao.getAllCount();
	//공지사항의 전체 갯수가 들어잇음
	
	int startRow=(currentPage - 1) * pageSize + 1;
	//                  5
	//                 1,11,21,31,41,....
	int endRow = currentPage * pageSize;
	  //              10,20,30,40,....
	  // 10이들어가있다
	ArrayList<NoticeVO> arr = ndao.selectAll(startRow,endRow);
	
	number = (currentPage -1) * pageSize +1;
	//번호 순서대로 보내는 코드 
	//1,11,21,31,41,....
%>
<table class="table" style="margin-top: 50px;" border="1">
	<%
	String id = (String)session.getAttribute("id");
	if(id==null){
	%>
	<tr>
		<td colspan="5" style="background-color: #0066FF; font-size: 30px; color: white; padding: 20px;">공지사항</td>
	</tr>
	<% 
	}
	%>
	<%
	if(id!=null)
		if(id.equals("admin")) {
	%>
	<tr>
		<td colspan="6" style="background-color: #0066FF; font-size: 30px; color: white; padding: 20px;">공지사항</td>
	</tr>
	<%}else{ %>
	<tr>
		<td colspan="5" style="background-color: #0066FF; font-size: 30px; color: white; padding: 20px;">공지사항</td>
	</tr>
	<%}%>
	<tr>
		<th style="padding: 20px;">번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
		<th>조회수</th>
		<%if(id!=null)if(id.equals("admin")){ %>
		<th>관리</th>
		<%} %>
	</tr>
	<%
		
		for(int i=0; i<arr.size(); i++){
			NoticeVO nvo = arr.get(i);
		%>
		<tr>
			<td style="padding: 20px;"><%=number++%></td>
			<td><a style="color: orange;" href="index.jsp?main=NoticeDetail.jsp?noticenum=<%=nvo.getNoticenum()%>"><%=nvo.getTitle()%></a></td>
			<td><%=nvo.getWriter()%></td>
			<td><%=nvo.getNoticedate()%></td>
			<td><%=nvo.getReadcount()%></td>
			<% 
			if(id!=null)//회원
				if(id.equals("admin")){
			%>
			<td><input type="button" style="font-size: 20px; padding: 5px;" onclick="location.href='NoticeDelete.jsp?noticenum=<%=nvo.getNoticenum()%>'" value="삭제"></td>
			<%} %>
		</tr>
		<%
		}
		%>
		<%
		if(id!=null)
			if(id.equals("admin")){ %>
		<tr>
		 	<td colspan="6" style="padding: 20px;"><input style="font-size: 20px; padding: 5px;" type="button" onclick="location.href='index.jsp?main=NoticeWrite.jsp'" value="글쓰기"> </td>
		</tr>
		<%} %>
</table>
<br>

<!-- 페이지 카운터링 소스 -->
	<%
	if(count > 0 ){
		int pageCount = count/ pageSize + (count % pageSize == 0 ? 0 : 1);
		//               61/ 5     + (61  %   5  ==0 이냐? 맞으면 0 아니면 1)
		//     13
		
		int pageBlock = 5;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		
		int endPage = startPage + pageBlock -1;
		//   10 들어가있음 끝페이지 10
		
		//이전이나 다음에 대한 처리 부분
		if(endPage > pageCount){
			//  10     12        
			endPage=pageCount;
		}
		//페이지가 10 아래일때 처리 소스
		if(startPage > pageBlock){
			%>
			<a style="font-size: 20px;" href="index.jsp?main=Notice.jsp?pageNum=<%=startPage - 5 %>">[이전]</a>
			<%
		}
		for(int i=startPage; i<=endPage; i++){
			%>
			<a style="font-size: 20px;" href="index.jsp?main=Notice.jsp?pageNum=<%=i%>">[<%=i %>]</a>
			<%
		}
		if(endPage < pageCount){
			%>
			<a style="font-size: 20px;" href = "index.jsp?main=Notice.jsp?pageNum=<%=startPage + 5 %>">[다음]</a>
			<%
		}
	}
	%>
</body>
</html>