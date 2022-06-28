<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
 <title> 연습하기 </title>
    <style>
        form fieldset {
            margin: 10px 0px;
        }

        form legend {
            font-size: 18px;
            color: #0066ff;
            font-weight: 600;
        }

        form label.reg {
            font-size: 14px;
            width: 120px;
            float: left;
        }

        form label em {
            font-size: 15px;
            color: red;
            font-weight: 800;
        }

        form ul li {
            list-style: none;
        }

        form fieldset.sendform {
            text-align: center;
        }
    </style>
</head>

<body>

    <body>
        <!-- 주소에 줄줄이 붙어보내면 get / 값만 모내면 post -->
        <form action="2_process.jsp" method="post" />
        
            <legend> 회원가입 </legend>
            <ul>
                <!-- em : 진하게, 강조 -->
                <!-- id : lable의 for랑 연결된 부분 / name은 다른 파일로 넘겨줄 파라미터 명 -->
                <li> <label class="reg" for="new_id"> 아이디 <em> * </em> </label>
                    <input type="text" id="new_id" name="new_id" size="20" autocomplete="on" required>
                </li>
                <li> <label class="reg" for="new_pw1"> 비밀번호 <em> * </em> </label>
                    <input type="password" id="new_pw1" name="new_pw1" size="20" required>
                </li>
                <li> <label class="reg" for="new_pw2"> 비밀번호 확인 <em> * </em> </label>
                    <input type="password" id="new_pw2" name="new_pw2" size="20" required>
                </li>
                <li> <label class="reg" for="user_name"> 이름 <em> * </em> </label>
                    <input type="text" id="user_name" name="user_name" size="20" required>
                </li>
                <li> <label class="reg" for="user_mail"> 메일주소 <em> * </em> </label>
                    <input type="email" id="user_mail" name="user_mail" size="20" required>
                </li>
                <li> <label class="reg" for="user_tel"> 전화 번호 </label>
                    <input type="tel" id="user_tel" name="user_tel" size="20">
                </li>
            </ul>
      
            <input type="submit" value="가입하기">
            <input type="reset" value="다시쓰기">

    </body>
</html>