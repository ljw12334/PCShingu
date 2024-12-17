<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 로그인</title>
	<link rel="stylesheet" href="../../css/variables.css">
	<link rel="stylesheet" href="css/login_main.css">
</head>
<body>
<%
if ((String) session.getAttribute("adminId") != null) {
	response.sendRedirect("../main.jsp");
} else {
%>
	<div id="wrapper">
		<div id="top">
			<div>관리자 시스템 로그인</div>
		</div>
		<div id="login-div">
			<div id="login-div-inner">
				<form action="login.jsp" method="post">
					LOGIN ID<br>
					<input type="text" name="id"><br>
					LOGIN PASSWORD<br>
					<input type="password" name="pw"><br><br>
					<input type="submit" value="LOGIN" id="bt-submit">
				</form>
			</div>
		</div>
	</div>
<%
}
%>
</body>
</html>