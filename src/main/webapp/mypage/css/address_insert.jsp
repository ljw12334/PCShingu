<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*" %>
<%
String userId = (String)session.getAttribute("userId");
String address1 =request.getParameter("address1");
String address2 =request.getParameter("address2");
String name =request.getParameter("name");
//System.out.println(userId+address1+address2);
	try(
		Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(String.format(         
					"select * from delivery_address where id='%s'", 
					(String)session.getAttribute("userId")));
	) {
		if (userId !=null && address1!= null && address2!= null){
		stmt.executeUpdate(String.format(
				"insert into delivery_address (id, name, address1, address2) values('%s','%s', '%s', '%s' )",
				userId,
				name,
				address1,
				address2
			));
		
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배송지 추가 실행</title>
</head>
<body>
	<script>
	alert('추가가 완료되었습니다.');
	//window.location="address.jsp";
	opener.location.reload(true);
	window.close();
	</script>
</body>
</html>