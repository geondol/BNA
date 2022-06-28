<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bna.dao.CustDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("passwd1");
	String mail = request.getParameter("mail");
	String tele = request.getParameter("tele");
	String add = request.getParameter("address");
	String age = request.getParameter("age");
%>
	<jsp:useBean id="svo" class="bna.vo.CustVO">
		<jsp:setProperty name="svo" property="*"/>
	</jsp:useBean>
<%
	CustDAO sdao = new CustDAO();
	if(pass == null || pass == ""){
		out.println("<script>alert('패스워드를 입력해주세요'); location.href='Mypage.jsp?right=MypageUpdate.jsp';</script>");
	}else if(mail == null || mail == ""){
		out.println("<script>alert('이메일을 입력해주세요'); location.href='Mypage.jsp?right=MypageUpdate.jsp';</script>");
	}else if(tele == null || tele == ""){
		out.println("<script>alert('전화번호를 입력해주세요'); location.href='Mypage.jsp?right=MypageUpdate.jsp';</script>");
	}else if(add == null || add == ""){
		out.println("<script>alert('주소를 입력해주세요'); location.href='Mypage.jsp?right=MypageUpdate.jsp';</script>");
	}else if(age == null || age == ""){
		out.println("<script>alert('나이를 입력해주세요'); location.href='Mypage.jsp?right=MypageUpdate.jsp';</script>");
	}else{
		sdao.updatemember(svo);
		out.println("<script>alert('수정이 완료되었습니다.'); location.href='Mypage.jsp?right=right.jsp';</script>");
	}
%>
</body>
</html>