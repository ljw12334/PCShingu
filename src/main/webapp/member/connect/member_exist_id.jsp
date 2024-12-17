<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
String msg = "사용할 수 있는 ID입니다.";

if (request.getParameter("id") == null || request.getParameter("id").isBlank()) {
	msg = "ID가 입력되지 않았습니다.";	
}

try (
		Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format(
				"select * from member where id='%s'",
				request.getParameter("id")));
		) {
	if (rs.next()) {
		msg = "이미 존재하는 ID입니다.";
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복확인</title>
</head>
<body>
<%= msg %>
<br>
<input type="button" value="확인" onClick="window.close()">

</body>
</html>