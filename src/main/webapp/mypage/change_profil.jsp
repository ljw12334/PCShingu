<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>
<%
String name = request.getParameter("name");
request.setCharacterEncoding("utf-8");

String userId;
String changePw;
String changePwCheck;
String changeName;
String changeEmail;
String changePhone;
String changeAddress0, changeAddress1, changeAddress2;
try (Connection conn = new Dao().getConnection(); Statement stmt = conn.createStatement();) {
	userId = request.getParameter("changeId");
	changePw = request.getParameter("changePw");
	changePwCheck = request.getParameter("changePwCheck");
	changeName = request.getParameter("changeName");
	changeEmail = request.getParameter("changeEmail");
	changePhone = request.getParameter("phone0") + request.getParameter("phone1") + "-" + request.getParameter("phone2");
	changeAddress1 = request.getParameter("changeAddress1");
	changeAddress2 = request.getParameter("changeAddress2");
	if (userId != null && changePw.equals(changePwCheck) && changePw != null && changeName != null
	&& changeEmail != null && request.getParameter("phone1") != null
	&& request.getParameter("phone2") != null) {
		stmt.executeUpdate(String.format(
		"update member set pass='%s', name='%s', phone = '%s', email = '%s',addr1 = '%s', addr2='%s' where id='%s'",
		changePw, changeName, changePhone, changeEmail, changeAddress1, changeAddress2, userId));
	}
	//각각 따로 쿼리 실행하려다 말은
	//System.out.print(changePhone, changeEmail, changeName, changePwCheck, changePw, userId);
	/*
	if (changePw!=null && changePwCheck!=null && changePw==changePwCheck){
	stmt.executeUpdate(String.format
	("update member set pass='%s' where id = '%s'", request.getParameter("changePw"), request.getParameter("changeId")));
	}
	if (changeName!=null){
	stmt.executeUpdate(String.format
	("update member set name='%s' where id = '%s'", changeName, request.getParameter("changeId")));
	}
	if (changeEmail!=null){
	stmt.executeUpdate(String.format
	("update member set email='%s' where id = '%s'", changeEmail, request.getParameter("changeId")));
	}
	if (changeEmail!=null){
		stmt.executeUpdate(String.format
		("update member set phone where id = '%s'", changePhone, request.getParameter("changeId")));
	}
	*/
	session.removeAttribute("isPassed");
} catch (Exception e) {
	e.printStackTrace();
}
%>
<script>
<!--수정이 완료되면 마이페이지 메인으로-->
	alert('수정이 완료되었습니다.');
	window.location = "mypage.jsp";
</script>