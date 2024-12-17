<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
// 상대경로 (Relation Path)
String rp = "../";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메인 페이지</title>
	<link rel="stylesheet" href="<%= rp %>css/variables.css">
	<link rel="stylesheet" href="<%= rp %>css/common.css">
	<link rel="stylesheet" href="<%= rp %>css/menu.css">
	<link rel="stylesheet" href="css/member.css">
</head>
<body>

<div id="wrapper">
	<header>
		<div class="member-top">
			<div>
				<a href="<%=rp %>index.jsp">
					<img src="<%=rp %>img/logo.png" alt="로고 이미지" style="width: 200px;">
				</a>
			</div>
			<div>
				<ul>
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
	</header>
    
    <main>
    	<!-- ================================================================================= -->
    	<!--                                   이 안에 내용 삽입                                    -->
    	<!-- ================================================================================= -->
    	<div class="member-content">
    		<div class="login-wrap" style="margin-bottom: 300px; margin-top: 200px;">
    			<div class="page-name">회원가입 완료</div>
    	
		    	<div class="title-space">
		    	회원가입 성공! 저희 (사이트이름)의 새로운 회원이 되신 것을 환영합니다.
		    	</div>
		    	
		    	<br><br>
		    	<input type="button" value="로그인 페이지로" id="form-submit" onClick="window.location = 'member_login_form.jsp';">
    		</div>
    	</div>
    	
    	
    	
    	
    </main>
    <footer>
    	<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">서비스이용약관</a></li>
			<li><a href="#">개인정보처리방침</a></li>
			<li><a href="#">전자금융거래약관</a></li>
		</ul>
    	<div>
			<p>
				<img src="<%= rp %>img/logo_grayscale.png" alt="하단 로고 이미지" style="width: 200px;">
			</p>
			<p>
				<strong>상호명</strong><br>
				신오지방 연고시티 흔들풍손로 209<br>
				사업자등록번호 : 123-45-67890<br>
				통신판매업신고 : 연고 12345호<br>
				대표이사 : 이수진
			</p>
			<p>
				<strong>고객센터</strong><br>
				Tel : 1234-5678<br>
				Fax : 12-345-6789 | Mail : sanghoname@sangho.com
			</p>
		</div>
    </footer>
    <button type="button" id="bt-top" onclick="moveToTop()">상단이동버튼</button>
</div>

</body>

<script src="<%= rp %>js/main.js"></script>

</html>