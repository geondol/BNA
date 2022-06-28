<%@page import="bna.vo.LodVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bna.dao.LodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Lod_List.css?ver=1">
</head>
<body align="center">
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
	LodDAO ldao = new LodDAO();
	count = ldao.getAllCount();
	//공지사항의 전체 갯수가 들어잇음
	
	int startRow=(currentPage - 1) * pageSize + 1;
	//                  5
	//                 1,11,21,31,41,....
	int endRow = currentPage * pageSize;
	  //              10,20,30,40,....
	  // 10이들어가있다
	ArrayList<LodVO> arr = ldao.selectAll(startRow,endRow);
	
	number = (currentPage -1) * pageSize +1;
	//번호 순서대로 보내는 코드 
	//1,11,21,31,41,....
%>
<table style="margin-top: 50px; width: 100%;">
		<tr>
			<td colspan="7" style="background-color: #0066FF; font-size: 30px; color: white;">숙소</td>
		</tr>
		<tr>
			<th style="width: 100px;">숙소 번호</th>
			<th>숙소 이미지</th>
			<th>숙소 이름</th>
			<th>가격</th>
			<th>정보</th>
			<th>주소</th>
		</tr>
		<!-- 반복해서 회원 전체 정보를 가져와야함 데이터베이스에서 -->
		<%
		for(int i=0; i<arr.size(); i++){
			LodVO lvo = arr.get(i);
		%>
		<tr>
			<td><%=number++%></td>
			<td><img src="images/<%=lvo.getLodimg1()%>"></td>
			<td><a style="color: orange;" href="LodDetail.jsp?lodnum=<%=lvo.getLodnum()%>"><%=lvo.getLodname()%></a></td>
			<td><%=lvo.getLodprice()%></td>
			<td><%=lvo.getLodinfo()%></td>
			<td><%=lvo.getLodaddr()%></td>
			<td><input type="button" onclick="location.href='Mg_Lod_delete.jsp?lodnum=<%=lvo.getLodnum()%>'" value="삭제"></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
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
			<a style="font-size: 20px;" href="Manager_Main.jsp?center=Mg_Lod_List.jsp?pageNum=<%=startPage - 5 %>">[이전]</a>
			<%
		}
		for(int i=startPage; i<=endPage; i++){
			%>
			<a style="font-size: 20px;" href="Manager_Main.jsp?center=Mg_Lod_List.jsp?pageNum=<%=i%>">[<%=i %>]</a>
			<%
		}
		if(endPage < pageCount){
			%>
			<a style="font-size: 20px;" href = "Manager_Main.jsp?center=Mg_Lod_List.jsp?pageNum=<%=startPage + 5 %>">[다음]</a>
			<%
		}
	}
%>
</body>
</html>