<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>
<%
String name = request.getParameter("name");
	try (
      	Connection conn = new Dao().getConnection();
      	Statement stmt = conn.createStatement();
	  	ResultSet rs = stmt.executeQuery(String.format(
		  "select * from member where id = '%s' and pw='%s' ", 
				request.getParameter("id"), request.getParameter("pw")));
	){
		if(rs.next()) {
			session.setAttribute("userId", rs.getString("id"));
			session.setAttribute("userName", rs.getString("name"));
				
			response.sendRedirect("mypage.jsp");//로그인 세션 만들고 마이페이지로
			return;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page login</title><!-- 로그인을 처리하는 페이지 -->
</head>
<body>
<script>
	alert('아이디 또는 비밀번호가 틀렸습니다.');
	history.back();
</script>
</body>
</html>