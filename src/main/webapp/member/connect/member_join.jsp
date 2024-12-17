<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
    String id = request.getParameter("id");

    String pw = request.getParameter("pw");
    String pwCheck = request.getParameter("pw-check");
    
    String name = request.getParameter("name");
    
    String email1 = request.getParameter("email1");
    String email2 = request.getParameter("email2");
    String email2Alt = request.getParameter("email2-alt");
    
    String email = email1 + "@" + email2;
    
    if (email2.equals("other")) {
    	email = email1 + "@" + email2Alt;
    }
    
    String gender = request.getParameter("gender");
    
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    
    String addr1 = request.getParameter("addr1");
    String addr2 = request.getParameter("addr2");
    
    String phone = phone1 + "-" + phone2 + "-" + phone3;
    
    if (id == null || id.isBlank() || pw == null || pw.isBlank() || pwCheck == null || pwCheck.isBlank()) {
    	%>
    	<script>
    		alert("비어있는 값이 존재합니다");
    		history.back();
    	</script>
    	<%
    	return;
    }
    
    if (!pw.equals(pwCheck)) {
    	%>
    	<script>
    		alert("비밀번호가 일치하지 않습니다");
    		history.back();
    	</script>
    	<%
    	return;
    }
    
    try (
    		Connection conn = new Dao().getConnection();
    		Statement stmt = conn.createStatement();
    		ResultSet rs = stmt.executeQuery("select * from member where id='" + id + "'");
    		) {
    	if (rs.next()) {
    		%>
        	<script>
        		alert("이미 존재하는 ID입니다");
        		history.back();
        	</script>
        	<%
        	return;
    	}
    	
    } catch (Exception e) {
    	e.printStackTrace();
    }

    String sql = 
    		"insert into member (id, pw, name, gender, email, phone, addr1, addr2)" +
    		
    		String.format(
    			"values('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",
    			id, pw, name, gender, email, phone, addr1, addr2
    		);

    try (
    		Connection conn = new Dao().getConnection();
            Statement stmt = conn.createStatement();
    		) {
        stmt.executeUpdate(sql);

        response.sendRedirect("../member_join_sucess.jsp");
        return;
        
    } catch (Exception e) {
        e.printStackTrace();
        out.println("회원가입에 실패하였습니다");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

</body>
</html>