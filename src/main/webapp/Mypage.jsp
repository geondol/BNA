<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<link rel="stylesheet" href="css/style2.css">
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	String right = request.getParameter("right");
	
	if(id == null){
%>
	<script>
		alert("로그인이 필요합니다.");
		location.href="index.jsp"
	</script>
<%
	}
	
	if(right == null){
		right = "right.jsp";
	}
%>
<div id="wrap" style="margin:0 auto; width:1280px">
	<div class="wrap_inner">
		<header id="header">
			<div class="header_inner">
				<div class="logo">
					<a href="index.jsp"><img src="images/abc123.png"></a>
				</div>
				<div class="user_menu">
					<ul>
						<li>
							<a href="javascript:;"><img class="profile btn-open-popup" src="./images/profile.png"></a>
						</li>
					</ul>
				</div>
		        <div class="modal public" style="display: none";>
		             <ul>
		                 <li><a href="index.jsp">홈으로</a></li>
		                 <li><a href="logout.jsp">로그아웃</a></li>
		             </ul>
		        </div>
			</div>
		</header>
	<table style="margin: 0 auto;">
		<tr>
			<td style="width:500px; height:800px; border-right:1px solid black;">
				<jsp:include page="left.jsp"></jsp:include>
			</td>
	        <td style="padding-left: 400px;">
	            <jsp:include page="<%=right %>"></jsp:include>
	        </td>
    	</tr>
	</table>
	</div>
</div>

	<footer id="footer" style="margin: 0 auto; width: 1280px;">
            <div class="titleWrap">
                <p class="title">Bna</p>
                <img class="logo" src="./images/logo.png">
            </div>
            <p class="content">(주)BNA | 대표이사 : 김태훈 | 사업자 등록번호 : 123-45-67890 | 통신판매업신고 : 신림-12345호 | 메일 : helpMe@bna.com<br/> 
                관광사업자 등록번호 : 제2022-61호 | 주소 : 서울특별시 관악구 신림로 340, 르네상스쇼핑몰 6층  |호스팅서비스 제공자 : 주식회사 BNA
                고객센터 : 1644-1234 (오전 9시 - 익일 새벽 3시)</p>
	</footer>
	<script type="text/javascript">
	    const modal = document.querySelector('.modal');
	    const btnOpenPopup = document.querySelector('.btn-open-popup');
	
	    btnOpenPopup.addEventListener('click', () => {
	        if( modal.style.display === 'block'){
	            modal.style.display = 'none';
	        }else {
	            modal.style.display = 'block';
	        }
	    });
    </script>
</body>
</html>