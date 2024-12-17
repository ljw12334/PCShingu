<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>

<%
String name = request.getParameter("name");
String kind = request.getParameter("kind");

new Dao().deleteOne("list_" + kind, name, application.getRealPath("/img/product/img/"));

response.sendRedirect("../management_" + kind + ".jsp");
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
