<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>
<%
String userId = (String) session.getAttribute("userId");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String name = request.getParameter("name");

if (address1 == null || address1.isBlank() || address2 == null || address2.isBlank() || name == null
|| name.isBlank()) {
%>
<script><!--문제가 있다면 address_check2 로-->
	alert('빈칸 없이 작성해주세요');
	history.back();
</script>
<%
return;
}
try (Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select * from delivery_address where id='%s'",
		userId));) {
	if (userId != null && address1 != null && address2 != null) {
		stmt.executeUpdate(String.format(
		"insert into delivery_address (id, name, address1, address2) values('%s','%s', '%s', '%s' )", 
		userId,
		name, 
		address1, 
		address2));
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
<title>배송지 추가 실행</title>
<!-- 배송지 추가하는 쿼리를 처리하는 페이지 -->

<script>
<!--배송지 변경 메인 페이지로 (address.jsp) -->
	alert('추가가 완료되었습니다.');
	//window.location="address.jsp";
	opener.location.reload(true);
	window.close();
</script>