<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="slider.css?after" rel="stylesheet">
</head>
<body>
	<div class="slider">
		<div class="outer">
			<%
			int bannerNum = 0;
	    	try (
	    			Connection conn = new Dao().getConnection();
	    			Statement stmt = conn.createStatement();
	    			ResultSet rs = stmt.executeQuery("select * from main_banner order by id");
	    			) {
	    		if (rs.next()) {
	    			rs.last();
	    			bannerNum = rs.getRow();
	    			rs.beforeFirst();
	    			
	    			while(rs.next()) {
	    				%>
						<div class="inner">
							<a href="#"><img src="<%= "../img/banner/" + rs.getString("file_name") %>" alt="<%= rs.getString("banner_name") %>"></a>
						</div>
						<%
	    			}
	    		}
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
			%>
		</div>
		<button class="slider_bt_prev"></button>
		<button class="slider_bt_next"></button>
		<div class="slider_bt_list">
			<%
			for (int i = 0; i < bannerNum; i++) {
			%>
				<button class="slider_bt"></button>
			<%
			}
			%>
		</div>
	</div>
	<br>
	
</body>
<script src="slider.js?after"></script>
</html>