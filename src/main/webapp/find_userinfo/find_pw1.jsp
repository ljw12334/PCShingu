<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기(유저 화면)</title>
</head>
<body>

<div id="wrapper">
    <header>
        <div class="logo">
            <div>
                <a href="example.jsp"><img src="" alt="로고"></a>
            </div>
        </div>
    </header>
    <main id="member">
        <div class="login">
            <nav>
                <h1>비밀번호 찾기</h1>
            </nav>
            <form action="find_pw2.jsp" method="post">
                <table border="1">
                    <tr>
                        <td>아이디 입력</td>
                        <td>
                            <input type="text" name="id" placeholder="아이디를 입력하세요." style="width:500px;height:45px;font-size:20px;">
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 입력</td>
                        <td>
                            <input type="password" name="pw" placeholder="변경하실 비밀번호를 입력하세요" style="width:500px;height:45px;font-size:20px;">
                        </td>
                    </tr>
                    <tr>   
                         <td>비밀번호확인</td>
                         <td>
                             <input type="password" name="pw-check" placeholder="비밀번호 확인" style="width:500px;height:45px;font-size:20px;">                             
                         </td>
                    </tr>
                </table>
                <span>						
	                    <a href="find_id1.jsp">아이디 찾기</a>
	                    <a href="member_join_form.jsp">회원가입</a>
               	</span>
               	<br>
               	
               	               	
               	<span><input type="submit" style="width:500px;height:45px;font-size:20px; "value="비밀번호 변경하기"></span>
            
            
            </form>
        </div>
    </main>
</div>   
</body>
</html>