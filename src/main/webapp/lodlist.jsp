<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "bna.dao.ListDAO" %>
<%@ page import = "bna.vo.ListVO" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/modal.css">
<link rel="stylesheet" href="css/item.css">
<link rel="stylesheet" href="css/search.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js">
</script>
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
<main>
<hr>

<section class="searchSection">

<div class="searchHeader"> 


<div class="largeText">숙소리스트</div>
</div>



<div id="map" style="width:50%; height:1000px; float: right;position: relative;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef7556166fc4f7a8984b1f9c339b986c"></script>
<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(35.907757, 127.766922), //지도의 중심좌표.
	level: 12 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container,options); //지도 생성 및 객체 리턴
//마커가 표시될 위치입니다 
var positions = [
    {
        title: 'Ferris wheel house', 
        latlng: new kakao.maps.LatLng(35.537597,
        		129.340255)
    },
    {
        title: '오늘,그리다', 
        latlng: new kakao.maps.LatLng(35.152234,
        		129.117017)
    },
    {
        title: '고층오션뷰17', 
        latlng: new kakao.maps.LatLng(37.868250,
        		128.843576)
    },
    {
        title: '마노아스테이',
        latlng: new kakao.maps.LatLng(35.152521,
        		129.116903)
    },
    {
        title: '라온제주독채풀빌라', 
        latlng: new kakao.maps.LatLng(33.406718,
        		126.896363)
    },
    {
        title: '아마빌레', 
        latlng: new kakao.maps.LatLng(33.511305,
        		126.893425)
    },
    {
        title: 'LAVATREE', 
        latlng: new kakao.maps.LatLng(33.477960,
        		126.355422)
    },
    {
        title: '피노앤키오', 
        latlng: new kakao.maps.LatLng(33.556370,
        		126.729668)
    },
    {
        title: '럭셔리스파펜션', 
        latlng: new kakao.maps.LatLng(37.816695,
        		128.892015)
    },
    {
        title: '하이오션경포', 
        latlng: new kakao.maps.LatLng(37.803887,
        		128.903501)
    }
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>



<div class="searchContainer" >
<%
request.setCharacterEncoding("utf-8");
ListDAO ldao = new ListDAO();
String q = request.getParameter("q");
Vector<ListVO> v = ldao.getLodList(q);
int j=0;

	for(int i = 0; i < v.size(); i++){
		ListVO lvo = v.get(i);

%>

<div class="searchItem">
<a href = "LodDetail.jsp?lodnum=<%=lvo.getLodnum()%>"><img class="roomImg" src="./images/<%=lvo.getLodimg1()%>"></a>
<div class="roomName"><%=lvo.getLodname() %></div>
<div class="roomBooking">
<div>
<div class="nightPrice"><%=lvo.getLodprice() %> 원</div>
<div>
<p><%=lvo.getLodinfo() %></p>
<p><%=lvo.getLodaddr() %></p>
</div>
</div>
</div>
</div>

<%

	
	}
%>



</div>


</section>
</main>



<footer id="footer">
            <div class="titleWrap">
                <p class="title">Bna</p>
                <image class="logo" src="../images/logo.png">
            </div>
            <p class="content">(주)BNA | 대표이사 : 김태훈 | 사업자 등록번호 : 123-45-67890 | 통신판매업신고 : 신림-12345호 | 메일 : helpMe@bna.com<br/> 
                관광사업자 등록번호 : 제2022-61호 | 주소 : 서울특별시 관악구 신림로 340, 르네상스쇼핑몰 6층  |호스팅서비스 제공자 : 주식회사 BNA
                고객센터 : 1644-1234 (오전 9시 - 익일 새벽 3시)</p>
        </footer>
</body>
</html>



