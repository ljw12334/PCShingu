<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>
<%
	String name = request.getParameter("name");
	try(
		Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format(
				"select * from member where id='%s' and pw='%s' ", session.getAttribute("userId"), request.getParameter("pw")));
	){
		if(rs.next()) {
			session.setAttribute("isPassed", true);
%>

		<script><!--비밀번호가 맞았으면 변경하는 페이지로-->
	    	alert("비밀번호가 맞았습니다.");
	    	window.location = "change.jsp";
	    </script>
<%
	 	return;
		} else {
%>
		<script><!--틀렸다면 다시입력받기-->
			alert("비밀번호가 틀렸습니다.");
			history.back();
	    </script>
<%
	    return;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
