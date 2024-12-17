<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>

<%
String name = request.getParameter("name");

new Dao().deleteOne("main_banner", name, application.getRealPath("/img/banner/"));

response.sendRedirect("../management_banner.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cpu데이터 삭제</title>
</head>
<body>
</body>
</html>
