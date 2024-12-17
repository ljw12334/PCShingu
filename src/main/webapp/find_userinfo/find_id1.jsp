<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기(유저 화면)</title>
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
                <h1>아이디 찾기</h1>
            </nav>
            <form action="find_id2.jsp" method="post">
                <table border="1">
                	<tr>
                        <td>아이디 입력</td>
                        <td>
                            <input type="text" name="id" placeholder="아이디를 입력하세요." style="width:500px;height:45px;font-size:20px;">
                        </td>
                    </tr>
                    <tr>
                        <td>이름입력</td>
                        <td>
                            <input type="text" name="name" placeholder="이름을 입력하세요." style="width:500px;height:45px;font-size:20px;">
                        </td>
                    </tr>
                    <tr>
                        <td>전화번호 입력</td>
                        <td>                            
                        	<input type="number" name="phone1" class="phone1" value="010" required> -
                       		<input type="number" name="phone2" class="phone2" required> -
                        	<input type="number" name="phone3" class="phone2" required>
                        </td>
                    </tr>
                </table>
                <span>						
	                    <a href="find_pw1.jsp">비밀번호찾기</a>
	                    <a href="member_join_form.jsp">회원가입</a>
               	</span>
               	<br>
               	
               	               	
               	<span><input type="submit" style="width:500px;height:45px;font-size:20px; "value="아이디 찾기"></span>
            
            
            </form>
        </div>
    </main>
</div>   
            	
</body>
</html>