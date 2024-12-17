<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>
<%
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String name = request.getParameter("name");
int addressId = Integer.parseInt(request.getParameter("address_id"));
System.out.println(address1 + address2 + addressId);

if (address1 == null || address1.isBlank() || address2 == null || address2.isBlank() || name == null
		|| name.isBlank()) {
%>
<script><!--빈칸이 있다면 address_check로-->
	alert('빈칸 없이 작성해주세요');
	history.back();
</script>
<%
return;
}
try (Connection conn = new Dao().getConnection(); Statement stmt = conn.createStatement();) {
System.out.println(address1 + address2 + addressId);
stmt.executeUpdate(
		String.format("update delivery_address set name = '%s', address1='%s', address2='%s' where address_id=%d", 
		name,
		address1, 
		address2, 
		addressId));
} catch (Exception e) {
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 변경 실행</title><!-- 배송지 변경을 처리하는 페이지 -->
</head>
<body>
	<script><!-- 수정이 처리 되면 address 페이지로 다시 이동 -->
		alert('수정이 완료되었습니다.');
		//window.location="address.jsp";
		opener.location.reload(true);
		window.close();
	</script>
</body>
</html>