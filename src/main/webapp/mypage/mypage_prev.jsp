<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*"%>

<!DOCTYPE html>
<html>
<head>
<title>my page</title>
<!-- 마이페이지 메인 -->
<meta charset="UTF-8">
</head>
<body>
	<%
	if ((String) session.getAttribute("userId") != null) {
	%>
	<main>
		<ul class="">
			<li><a href="change.jsp">프로필 변경</a> <!--프로필 변경 페이지로  --></li>
			<li><a href="">장바구니</a></li>
			<li><a href="">주문 조회</a></li>
			<li><a href="address.jsp">배송지 관리</a> <!-- 배송지 관리 페이지로 --></li>
			<li><a href="">고객센터</a></li>
			<li><a href="member_quit.jsp">회원탈퇴</a></li>
			<!-- 회원탈퇴 페이지로 -->
		</ul>


	</main>
	<!-- 세션 삭제용 임시 버튼 -->
	<form action="mypage_logout.jsp">
		<input type="submit" value="세션삭제">
	</form>

	안녕하세요
	<%=(String) session.getAttribute("userName")%>님
	<%
	} else {
	%>
	<script>
	alert("로그인 해주세요.");
	window.location = "mypage_login_form.jsp";
	<!-- 로그인 창으로 이동 근데 이부분 메인 로그인이랑 따로 해야하나? 잘 모르겠음-->
</script>
	<%
	}
	%>
</body>
</html>