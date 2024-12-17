<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.pcmall.javaClass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/member.css">
</head>
<body>
	
	<div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <a href="member_login_form.jsp">로그인</a>
                    <a href="member_join_form.jsp">회원가입</a>
                    <a href="#">마이페이지</a>
                    <a href="#">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니</a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="example.jsp">
                        <img src="../cs/img/header_logo.png" alt="로고">
                    </a>    
                </div>
                
            </div>
        </header> 
        <main id="member">
            <div class="register">
                <nav>
                    <h1>일반 회원가입</h1>
                </nav>
                <form action="member/member_join.jsp" method="post">
                    <section>
                        <table>
                            <caption>필수 정보입력</caption>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    아이디
                                </th>
                                <td>
                                    <input type="text" name="id" placeholder="아이디를 입력" required>
                                    <span class="msgId">&nbsp;&nbsp;영문, 숫자로 4~12자까지 설정해 주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    비밀번호
                                </th>
                                <td>
                                    <input type="password" name="pw" placeholder="비밀번호를 입력" required>
                                    <span class="msgPass">&nbsp;&nbsp;영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해 주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    비밀번호확인
                                </th>
                                <td>
                                    <input type="password" name="pw-check" placeholder="비밀번호를 확인" required>
                                    <span class="msgPass">&nbsp;&nbsp;비밀번호 재입력</span>
                                </td>
                            </tr>
                        </table>
                    </section>
                    <section>
                        <table>
                            <caption>기본 정보입력</caption>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    이름
                                </th>
                                <td>
                                    <input type="text" name="name" placeholder="이름을 입력" required>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    성별
                                </th>
                                <td>
                                    <label>
                                        <input type="radio" name="gender" value="M" checked>
                                        남
                                    </label>
                                    <label>
                                        <input type="radio" name="gender" value="F">
                                        여
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    이메일
                                </th>
                                <td>
                                    <input type="email" name="email" placeholder="이메일 입력" required>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    휴대폰
                                </th>
                                <td>
                                    <input type="number" name="phone1" class="phone1" value="010" required> -
                                    <input type="number" name="phone2" class="phone2" required> -
                                    <input type="number" name="phone3" class="phone2" required>
                                </td>
                            </tr>
                            <tr class="addr">
                                <th>
                                    <span class="essential">*</span>
                                    주소
                                </th>
                                <td>
                                    <div>
                                        <input type="text" name="addr1" id="addr1" size="50" placeholder="주소를 입력하세요." required>
                                    </div>
                                    <div>
                                        <input type="text" name="addr2" id="addr2" size="50" placeholder="상세주소를 입력하세요.">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </section>
                    <div>
                        <input type="submit" class="join" value="회원가입">
                    </div>
                </form>
            </div>
        </main>
        <footer>
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금육거래약관</a></li>
            </ul>       
        </footer>
    </div>
</body>
</html>