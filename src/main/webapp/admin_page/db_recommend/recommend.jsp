<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
String name = request.getParameter("name");
String pdtKind = request.getParameter("pdt_kind");
String search = request.getParameter("search");

if (pdtKind == null || pdtKind.isBlank() || name == null || name.isBlank()) {
	response.sendRedirect("../main.jsp");
	return;
}

try (
		Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select recommend from list_" + pdtKind + " where name='" + name + "'");
		) {
	if (rs.next()) {
		if (rs.getString("recommend").equals("추천")) {
			stmt.executeUpdate("update list_" + pdtKind + " set recommend='' where name='" + name + "'");
		} else {
			stmt.executeUpdate("update list_" + pdtKind + " set recommend='추천' where name='" + name + "'");
		}
	}
	
	if (search == null || search.isBlank()) {
		response.sendRedirect("../management_" + pdtKind + ".jsp");
	} else {
		response.sendRedirect("../management_" + pdtKind + ".jsp?search=" + search);
	}
	return;
	
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천여부 수정</title>
</head>
<body>
</body>
</html>
