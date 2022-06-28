<%@page import="bna.vo.CustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bna.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Customer.css?ver=1">
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
	CustomerDAO cdao = new CustomerDAO();
	count = cdao.getAllCount();
	//공지사항의 전체 갯수가 들어잇음
	
	int startRow=(currentPage - 1) * pageSize + 1;
	//                  5
	//                 1,11,21,31,41,....
	int endRow = currentPage * pageSize;
	  //              10,20,30,40,....
	  // 10이들어가있다
	ArrayList<CustomerVO> arr = cdao.selectAll(startRow,endRow);
	
	number = (currentPage -1) * pageSize +1;
	//번호 순서대로 보내는 코드 
	//1,11,21,31,41,....
%>
	<table style="margin-top: 50px; width: 100%;">
		<tr>
			<td colspan="8" style="background-color: #0066FF; font-size: 30px; color: white;">회원 정보</td>
		</tr>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>나이</th>
			<th>주소</th>
		</tr>
		<!-- 반복해서 회원 전체 정보를 가져와야함 데이터베이스에서 -->
		<%
		for(int i=0; i<arr.size(); i++){
			CustomerVO cvo = arr.get(i);
		%>
		<tr>
			<td><%=cvo.getName()%></td>
			<td ><%=cvo.getId()%></td>
			<td><%=cvo.getPasswd1()%></td>
			<td><%=cvo.getMail()%></td>
			<td><%=cvo.getTele()%></td>
			<td><%=cvo.getAge()%></td>
			<td><%=cvo.getAddress()%></td>
			<td><input type="button" onclick="location.href='Mg_Customer_delete.jsp?id=<%=cvo.getId()%>'" value="삭제"></td>
		</tr>
		<%
		}
		%>
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
			<a style="font-size: 20px;" href="Manager_Main.jsp?center=Mg_Customer_List.jsp?pageNum=<%=startPage - 5 %>">[이전]</a>
			<%
		}
		for(int i=startPage; i<=endPage; i++){
			%>
			<a style="font-size: 20px;" href="Manager_Main.jsp?center=Mg_Customer_List.jsp?pageNum=<%=i%>">[<%=i %>]</a>
			<%
		}
		if(endPage < pageCount){
			%>
			<a style="font-size: 20px;" href = "Manager_Main.jsp?center=Mg_Customer_List.jsp?pageNum=<%=startPage + 5 %>">[다음]</a>
			<%
		}
	}
%>
</body>
</html>