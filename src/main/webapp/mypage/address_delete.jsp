<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>
<%
String userId = (String) session.getAttribute("userId");
String address_id = "";
System.out.println(userId + address_id);
try (Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select * from delivery_address where id='%s'", userId));) {
	if (rs.next()) {
		address_id = rs.getString("address_id");
		stmt.executeUpdate(String.format("delete from delivery_address where address_id='%s'", address_id));
%>
<script>
	alert('삭제가 완료되었습니다.');//배송지 화면 address로 이동
	//window.location="address.jsp";
	opener.location.reload(true);
	window.close();
</script>
<%
return;
} else {
%>
<script>
<!--여기로 올리도 없고 와서는 안되지만 문제가 있다면 address로-->
	alert('삭제에 문제가 발생했습니다.');
	history.back();
</script>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
<title>배송지 삭제 실행</title>
<!-- 배송지 삭제 처리하는 페이지 -->

