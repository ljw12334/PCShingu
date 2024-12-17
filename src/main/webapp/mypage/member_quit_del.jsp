<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*"%>


<%
try (Connection conn = new Dao().getConnection(); Statement stmt = conn.createStatement();) {
	stmt.executeUpdate(String.format("delete from member where id = '%s'", session.getAttribute("userId")));
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	//System.out.println(session.getAttribute("userId"));
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member quit delete</title>
<!-- 회원 정보 삭제 처리 페이지 -->
</head>
<body>
	<script>
		alert('정상적으로 회원 탈퇴되었습니다.');
		window.location = "../index.jsp"; //로그인 세션을 지우고 메인페이지(인덱스)로 이동
	</script>
</body>
</html>