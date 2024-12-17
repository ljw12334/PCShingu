<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member quit</title>
<!--회원 삭제 확인하기 -->
</head>
<body>
	<%=session.getAttribute("userName")%>님, 정말로 탈퇴하시겠습니까?
	<button type="button" id="#"
		onclick="location.href='member_quit_del.jsp'">회원탈퇴</button>
	<!-- 회원 삭제 처리 페이지로 이동 -->
</body>
</html>