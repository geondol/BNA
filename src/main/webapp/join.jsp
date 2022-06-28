<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/join.css">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
</head>
<script language="javascript">
   function validate() {
       var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       // 이메일이 적합한지 검사할 정규식

       var id = document.getElementById("id");
       var passwd1 = document.getElementById("passwd1");
       var passwd2 = document.getElementById("passwd2");
       var mail = document.getElementById("mail");
       var tele = document.getElementById("tele");
       var address = document.getElementById("address");
       var age = document.getElementById("age");
       
       if(join.id.value=="") {
           alert("아이디를 입력해 주세요");
           join.id.focus();
           return false;
       }
       if(join.name.value=="") {
           alert("이름을 입력해 주세요");
           join.name.focus();
           return false;
       }
       if(join.passwd1.value=="") {
           alert("패스워드를 입력해 주세요");
           join.passwd1.focus();
           return false;
       }
       if(join.passwd2.value=="") {
           alert("패스워드확인을 입력해 주세요");
           join.passwd2.focus();
           return false;
       }
       if(join.passwd1.value != join.passwd2.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           join.passwd2.value = "";
           join.passwd2.focus();
           return false;
       }
       if(join.mail.value=="") {
           alert("이메일을 입력해 주세요");
           join.mail.focus();
           return false;
       }
       if(join.name.value=="") {
           alert("이름을 입력해 주세요");
           join.name.focus();
           return false;
       }
       if(join.tele.value=="") {
           alert("전화번호를 입력해 주세요");
           join.tele.focus();
           return false;
       }
       if(join.address.value=="") {
           alert("주소를 입력해 주세요");
           join.address.focus();
           return false;
       }
       if(join.age.value=="") {
           alert("나이를 입력해 주세요");
           join.age.focus();
           return false;
       } 
       alert("회원가입이 완료되었습니다.");
   }

   function check(re, what, message) {
       if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       //return false;
   }
</script>
<body>
		<form name="join" onsubmit="return validate();"action="joinpro.jsp" method="post">
		 <div class="container">
    	<div class="insert">
		<table>
  		<caption><h2>회원가입</h2></caption>
		<tr>
		<td class="col1">아이디</td>
        <td class="col2">
		<input type="text" name="id" size="30" >
		</td>
		</tr>
		
		<tr>
		<td class="col1">이름</td>
        <td class="col2">
		<input type="text" name="name" size="30" >
		</td>
		</tr>
		
		<tr>
		<td class="col1">패스워드</td>
        <td class="col2">
		<input type="password" name="passwd1" size="30" >
		</td>
		</tr>
		
		<tr>
		<td class="col1">패스워드확인</td>
        <td class="col2">
		<input type="password" name="passwd2" size="30"><p>※ <span class="num">동일한 패스워드를 입력해주세요.
        </span></p>
		</td>
		</tr>
		
		
		<tr>
		<td class="col1">이메일</td>
        <td class="col2">
		<input type="email" name="mail" size="30">
		</td>
		</tr>
		
		<tr>
		<td class="col1">전화번호</td>
        <td class="col2">
		<input type="tel" name="tele" size="30">
		</td>
		</tr>
			
		<tr>
		<td class="col1">주소</td>
        <td class="col2">
		<input type="text" name="address" size="30"> <p>※예) <span class="num">서울시 관악구 신림동
        </span></p>
		</td>
		</tr>
			
		<tr>
		<td class="col1">나이</td>
        <td class="col2">
					<input type="radio" name="age" value="10">10대 
					<input type="radio" name="age" value="20">20대 
					<input type="radio" name="age" value="30">30대 
					<input type="radio" name="age" value="40">40대 
					<input type="radio" name="age" value="50">50대
					<input type="radio" name="age" value="60">60대
		</td>
		</tr>
		</table>
		</div>
		</div>
		  
		 <div class="create">
		<input type="submit" class="button" value="회원가입"/>&nbsp;
		<input type="reset"  class="button" value="가입취소"/>
		</div>
		
		
		
		
		</form>
</body>
</html>