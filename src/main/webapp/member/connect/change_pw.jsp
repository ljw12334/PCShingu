<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
	Boolean isPassed = true;

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwCheck = request.getParameter("pw-check");
	
	
	
	if (!pw.equals(pwCheck)) {
    	%>
    	<script>
    		alert("비밀번호가 일치하지 않습니다");
    		history.back();
    	</script>
    	<%
    	return;
    }
	
	String sql = String.format("UPDATE member SET pw = '%s' WHERE id = '%s'", pw, id);

    try (
    		Connection conn = new Dao().getConnection();
            Statement stmt = conn.createStatement();    		
    		) {
        stmt.executeUpdate(sql);
        
    } catch (Exception e) {
        e.printStackTrace();
        out.println("변경 실패");
        isPassed = true;
    }

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기(백그라운드)</title>
</head>
<body>
<script>
	<%
	if (isPassed) {
	%>
		alert("비밀번호 변경이 완료되었습니다" );
		window.location.href ="member_login_form.jsp";
	<%
	} else {
	%>
		alert("변경 실패" );
		history.back();
	<%
	}
	%>
</script>
</body>
</html>