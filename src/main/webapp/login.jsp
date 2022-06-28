<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/login.css">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
</head>
<body>

<form action="loginpro.jsp" method="post"/> 
		<div class="container">	
    	<div class="insert">
		<table>
  		<caption><h2>Login</h2></caption>
		
		
		<tr>
		<td class="col1">아이디</td>
        <td class="col2">
			<input type="text" name="id" size="30"  required>
		</td>
		</tr>
		
		<tr>
		<td class="col1">패스워드</td>
        <td class="col2">
		<input type="password" name="passwd1" size="30" >
		</td>
		</tr>

		
		</table>
		</div>
		</div>
		 <div class="create">
			<input type="submit" class="button" value="로그인">
			<input type="reset"  class="button" value=" 취소 ">
		</div>
		



</body>
</html>