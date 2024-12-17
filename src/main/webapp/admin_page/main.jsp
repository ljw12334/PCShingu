<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
String adminName = "";

if ((String) session.getAttribute("adminId") == null) {
	response.sendRedirect("login/login_main.jsp");
	return;
} else {
	adminName = (String) session.getAttribute("adminName");
}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="../css/variables.css">
	<link rel="stylesheet" href="css/admin_page.css">
</head>
<body>
<div id ="wrapper">
	
<div id="sidebar">
	<div id="sidebar-top">
		<a href="../index.jsp"><img src="../img/logo_white.png" alt="로고 이미지" class="logo"></a>
		<img src="img/logo_admin_page.png" alt="관리자 로고 이미지" class="admin-logo"><br>
		<form action="login/logout.jsp" method="post">
			<div style="margin-left: 16px; margin-right: 16px; display: flex; align-items: center; justify-content: space-between; color:white;">
				<div><%= adminName %>님</div>
				<div><input type="submit" value="LOGOUT"></div> 
			</div>	
		</form>
		
		<a href="main.jsp"><div><img src="../img/test_128x128.png">메인</div></a>
	</div>
	<div id="scroll-area">
		<div>
			<div class="list-name">페이지 관리</div>
			<a href="management_banner.jsp"><div class="list"><img src="../img/test_128x128.png">배너 변경</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-조립PC</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">게이밍PC</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">사무용PC</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">전문용PC</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-PC주요부품</div>
			<a href="management_cpu.jsp"><div class="list"><img src="../img/test_128x128.png">CPU</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">메인보드</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">RAM</div></a>
			<a href="management_vga.jsp"><div class="list"><img src="../img/test_128x128.png">그래픽카드</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">파워서플라이</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">SSD</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">HDD</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">케이스</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">팬/쿨러</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-주변기기</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">모니터</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">키보드</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">마우스</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">스피커</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">외부 저장장치</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-소프트웨어</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">OS</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">응용 소프트웨어</div></a>
		</div>
		<div>
			<div class="list-name">회원 관리</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">주문내역 조회</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">회원정보 수정</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">비밀번호 초기화</div></a>
		</div>
		<div>
			<div class="list-name">주문 관리</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">새 주문 조회</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">주문상태 변경</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">배송 완료된 주문 </div></a>
		</div>
		<br><br>
	</div>
</div>

<div id="content">
	<div class="top-bar">
		<div>관리자 페이지 - 메인</div>
	</div>
	<div class="bottom-area">
		<div class="management">

		</div>
		
		<div class="registed">
			
		</div>
	</div>
</div>

</div>


</body>
</html>