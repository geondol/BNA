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
</head>
<body>
	<header id="header">
		<div class="header_inner">
	        <a href="index.jsp">
	        <image class="logo" src="./images/logo.png">
	        </a>
	        <div class="header_btn">
<!-- 	            <div class="area_btn">
	                <ul>
	                    <li><a href="javascript:;">숙소</a></li>
	                    <li><a href="javascript:;">체험</a></li>
	                </ul>
	            </div>
	            <form class="inputWrap" action="./lodlist.jsp" method="post">
	                    <input type="text" name="q" placeholder="장소를 검색해주세요.">
	                    <input type = "submit" value = "검색"/>
	            </form> -->
	            <script>
	            	function submit2(frm) {
	            		frm.action="./actlist.jsp";
	            		frm.submit();
	            		return true;
	            	}
	            </script>
	            <form class="inputWrap" action="./lodlist.jsp" method="post">
					<input type="text" name="q" placeholder="장소를 검색해주세요.">
					<div class="area_btn">
						<ul>
							<li><input type="submit" value="숙소 검색"></li>
							<li><input type="button" value="체험 검색" onclick="return submit2(this.form);"></li>
						</ul>
					</div>
				</form>
	        </div>
	        <div class="user_menu">
	            <ul>
	                <li><a href="javascript:;"><image class="profile btn-open-popup" src="./images/profile.png"></a></li>
	        </div>
	        <div id="public" class="modal public">
	            <ul>
	                <a href="login.jsp"><li>로그인</li></a>
	                <a href="join.jsp"><li>회원가입</li></a>
	            </ul>
	        </div>
	        <div id="private" class="modal private">
	            <ul>
	                <a href="Mypage.jsp"><li>내정보</li></a>
	                <a href="logout.jsp"><li>로그아웃</li></a>
	            </ul>
	        </div>
	        <div id="admin" class="modal admin">
	            <ul>
	                <a href="Manager_Main.jsp"><li>관리자페이지</li></a>
	                <a href="logout.jsp"><li>로그아웃</li></a>
	            </ul>
	        </div>
	    </div>
	</header>
</body>
    <script>
    const modal = document.querySelector('.modal');
    const public = document.getElementById("public");
    const private = document.getElementById("private");
    const admin = document.getElementById("admin");

    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
          var id = '<%=(String)session.getAttribute("id")%>';
          console.log("id");
          if(id=="null"){
            private.style.display = "none"
            admin.style.display = "none"
            public.style.display === "block"?public.style.display = "none":public.style.display = "block";
          } else if(id=="admin"){
            public.style.display = "none"
            private.style.display = "none"
            admin.style.display === "block"?admin.style.display = "none":admin.style.display = "block";
          } else {
            public.style.display = "none"
            admin.style.display = "none"
            private.style.display === "block"?private.style.display = "none":private.style.display = "block";
          }
    });
    </script>
</html>