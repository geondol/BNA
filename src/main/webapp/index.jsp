<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0">
<meta name="description" content="">
<meta property="og:type" content="website">
<!-- <meta property="og:title" content=""> -->
<!-- <meta property="og:url" content=""> -->
<!-- <meta property="og:image" content=""> -->
<!-- <meta property="og:description" content=""> -->
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<!-- <link rel="shortcut icon" type="image/png" href="favicon.ico?v=1"> -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<meta name="naver-site-verification" content="0c1d99ae034f039e5d0267330f66c6648607f0a9" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/jquery-ui.min.css">

<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
<% 
String main = request.getParameter("main"); 
	if(main==null)
	main="main.jsp";
%>
<div id="wrap">
    <div class="wrap_inner">
		<ul>
			<li>
				<jsp:include page="header.jsp" flush="false"/>
			</li>
		</ul>
		<ul>
			<li>
				<jsp:include page="<%=main%>" flush="false"/>
			</li>
		</ul>
		<ul>
			<li>
				<jsp:include page="footer.jsp" flush="false"/>
				
			</li>
		</ul>
   </div>
</div>
</body>
</html>