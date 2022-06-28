<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<link rel="stylesheet" type="text/css" href="css/Manager_main.css?ver=2">
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	//세션으로 세팅한 아이디 값을 가져온다
	
	String center = request.getParameter("center");
	if(center==null){
		center = "center.jsp";
	}
%>
	<nav class="navbar">
		<div class="">
			<a href="index.jsp"><img class="logo" src="images/logo1.png"></a>
		</div>
		
		<div class="title">
			<a href="Manager_Main.jsp" style="text-shadow : 5px 5px 5px grey;">BNA 관리자</a>
		</div>
		
		<div class="login" >
			<font><%=id %>님</font> 
			<input type="button" style="font-size: 24px;" onclick="location.href='logout.jsp'" value="로그아웃">
		</div> 
	</nav>
	<ul class="nav">
			<li><a href="Manager_Main.jsp?center=Mg_Customer_List.jsp">회원 정보</a></li>
			<li><a href="Manager_Main.jsp?center=Mg_Lod_List.jsp">숙소</a></li>
			<li><a href="Manager_Main.jsp?center=Mg_Lod_Reservation_List.jsp">숙소 예약</a></li>
			<li><a href="Manager_Main.jsp?center=Mg_Act_List.jsp">체험</a></li>
			<li><a href="Manager_Main.jsp?center=Mg_Act_Reservation_List.jsp">체험 예약</a></li>
	</ul>
	<jsp:include page="<%=center%>"/>
</body>
</html>