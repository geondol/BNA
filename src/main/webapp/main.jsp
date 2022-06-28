<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bna.dao.ListDAO" %>
<%@ page import = "bna.vo.ListVO" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String uid = "BNA";
	String pwd = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql1 = "select * from (select * from lodtbl order by lodnum desc) where rownum <= 8";
	String sql2 = "select * from (select * from acttbl order by actnum desc) where rownum <= 8";
	String sql3 = "select * from (select * from notice order by noticenum desc) where rownum = 1";
	String sql4 = "select * from (select * from event order by eventnum desc) where rownum = 1";
%>

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
<link rel="stylesheet" href="css/main.css">
</head>
    <body>
        <main id="main">
            <div class="good_area">
                <h3>지금 여행하기 좋은 지역</h3>
                <ul>
                    <li><a href="lodlist.jsp?q=제주"><img src="https://yaimg.yanolja.com/v5/2022/05/16/15/62826af8189a81.32041133.png" alt=""><span>제주도</span></a></li>
                    <li><a href="lodlist.jsp?q=강원"><img src="https://yaimg.yanolja.com/v5/2022/05/16/15/62826af3d78366.88472574.png" alt=""><span>강원도</span></a></li>
                    <li><a href="lodlist.jsp?q=부산"><img src="https://yaimg.yanolja.com/v5/2022/05/16/15/62826b1c714e09.44266747.png" alt=""><span>부산</span></a></li>
                    <li><a href="lodlist.jsp?q=울산"><img src="https://yaimg.yanolja.com/v5/2022/05/16/15/62826b256fc254.80258343.png" alt=""><span>울산광역시</span></a></li>
                </ul>
            </div>
            <div class="notice_wrap">
                <ul>
<%-- 					<% try { Class.forName("oracle.jdbc.driver.OracleDriver"); conn =
					DriverManager.getConnection(url, uid, pwd); stmt =
					conn.createStatement(); rs = stmt.executeQuery(sql3); %> <% while
					(rs.next()) { %> --%>
                    <li>
                        <div class="notice_imgWrap">
                            <a href="index.jsp?main=Notice.jsp">
                                <img src="https://a0.muscache.com/im/pictures/miso/Hosting-45465864/original/3d966c94-4c87-479b-8eeb-4889e9fb6ac9.jpeg?im_w=720" alt="">
                                <p>제주렌트카 쉬운 가격비교, 70곳 비교 단 3초면 끝</p>
<%--                                 <p class="img"><%=rs.getString("content")%></p>
                                <p class="title"><%=rs.getString("title")%></p> --%>
                            </a>
                        </div>
                        <div class="text_box">
                            <h5>공지사항</h5>
                            <a href="index.jsp?main=Notice.jsp">모두 보기</a>
                        </div>
                    </li>
<%-- 					<% } } catch (Exception e) { e.printStackTrace(); } finally { try { if
					(rs != null) {rs.close(); } if (stmt != null) {stmt.close(); } if
					(conn != null) {conn.close(); } } catch (Exception e) {
					e.printStackTrace(); } } %> --%>
<%-- 					<% try { Class.forName("oracle.jdbc.driver.OracleDriver"); conn =
					DriverManager.getConnection(url, uid, pwd); stmt =
					conn.createStatement(); rs = stmt.executeQuery(sql4); %> <% while
					(rs.next()) { %> --%>
                    <li>
                        <div class="notice_imgWrap">
                            <a href="index.jsp?main=Event.jsp">
                                <img src="https://a0.muscache.com/im/pictures/d12de01d-61ad-48eb-8def-e3208a669dcb.jpg?im_w=720" alt="">
                                <p>호텔스컴바인에서 모든 호텔과 숙소를 한 눈에 비교하세요</p>
<%--                                 <p class="img"><%=rs.getString("content")%></p>
                                <p class="title"><%=rs.getString("title")%></p> --%>
                            </a>
                        </div>
                        <div class="text_box">
                            <h5>이벤트</h5>
                            <a href="index.jsp?main=Event.jsp">모두 보기</a>
                        </div>
                    </li>
<%-- 					<% } } catch (Exception e) { e.printStackTrace(); } finally { try { if
					(rs != null) {rs.close(); } if (stmt != null) {stmt.close(); } if
					(conn != null) {conn.close(); } } catch (Exception e) {
					e.printStackTrace(); } } %> --%>
                </ul>
            </div>
 <div class="hostel">
        <h3>최근에 등록된 숙소</h3>
        <ul>
          <% try { Class.forName("oracle.jdbc.driver.OracleDriver"); conn =
          DriverManager.getConnection(url, uid, pwd); stmt =
          conn.createStatement(); rs = stmt.executeQuery(sql1); %> <% while
          (rs.next()) { %>
          <li>
          	<a href="LodDetail.jsp?lodnum=<%=rs.getInt("lodnum")%>" target="blank">
            <p class="img"><img src="images/<%=rs.getString("lodimg1")%>"></p></a>
            <p class="title"><%=rs.getString("lodname")%></p>
            <p class="content"><%=rs.getString("lodinfo")%></p>
          </li>
          <% } } catch (Exception e) { e.printStackTrace(); } finally { try { if
          (rs != null) {rs.close(); } if (stmt != null) {stmt.close(); } if
          (conn != null) {conn.close(); } } catch (Exception e) {
          e.printStackTrace(); } } %>
        </ul>
      </div>
      <div class="experience">
        <h3>최근에 등록된 체험</h3>
        <ul>
          <% try {
          Class.forName("oracle.jdbc.driver.OracleDriver"); conn =
          DriverManager.getConnection(url, uid, pwd); stmt =
          conn.createStatement(); rs = stmt.executeQuery(sql2); %> <% while
          (rs.next()) { %>
          <li>
          	<a href="ActDetail.jsp?actnum=<%=rs.getInt("actnum")%>" target="blank">
            <p class="img"><img src="images/<%=rs.getString("actimg1")%>"></p></a>
            <p class="title"><%=rs.getString("actname")%></p>
            <p class="content"><%=rs.getString("actinfo")%></p>
          </li>
          <% } } catch (Exception e) { e.printStackTrace(); } finally { try { if
          (rs != null) {rs.close(); } if (stmt != null) {stmt.close(); } if
          (conn != null) {conn.close(); } } catch (Exception e) {
          e.printStackTrace(); } } %>
        </ul>
    </div>

        </main>
    </body>
</html>