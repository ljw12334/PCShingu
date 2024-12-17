<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	
	if ((name == null || name.isBlank()) || (phone1 == null || phone1.isBlank())
			|| (phone2 == null || phone2.isBlank()) || (phone3 == null || phone3.isBlank())) {
		%>
		<script>
			alert("이름 또는 전화번호가 입력되지 않았습니다");
			history.back();
		</script>
		<%
		return;
	}
	
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	
	try (
			Connection conn = new Dao().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(String.format(
					"select * from member where name='%s' and phone='%s'",
					name, phone));
			){
		
		if (rs.next()) {
			String Name = rs.getString("name");
			String PW = rs.getString("phone");
			String Id = rs.getString("id");
			if((name.equals(Name)) && (phone.equals(PW))) {
			}
			%>
				<script>
					alert("아이디는 <%= rs.getString("id") %> 입니다" );
					window.location.href ="member_login_form.jsp";
		    	</script>  
		    <%
		} else {
			%>
			<script>
				alert("이름 또는 전화번호가 틀렸거나 존재하지 않는 ID입니다");
				history.back();				
			</script>
			<%
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기(백그라운드)</title>
</head>
<body>

</body>
</html>