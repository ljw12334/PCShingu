<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>
<%
int addressId = Integer.parseInt(request.getParameter("address_id"));
String deliveryName = "";
String address1 = "";
String address2 = "";
String name = "";

try (Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from delivery_address where address_id=" + addressId);) {
	if (rs.next()) {
		deliveryName = rs.getString("name");
		address1 = rs.getString("address1");
		address2 = rs.getString("address2");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 변경 확인</title><!-- 배송지 변경 정보 받아서 처리하는 페이지로 넘기는 페이지 -->
</head>
<body>
	<form action="address_change.jsp" method="post"><!-- 배송지 정보 뵨경의 처리를 하는 페이지로 이동 -->
		<input type="hidden" name="address_id" value=<%=addressId%>>
		주소지 이름<input type="text" name="name" value=<%=deliveryName%> required><br>
		주소 <input type="text" name="address1" value=<%=address1%> required><br>
		상세주소 <input type="text" name="address2" value=<%=address2%> required><br>

		<!-- 테이블로 쓸거면 이거
		<table>
			<tr>
				<td>주소지 이름</td>
				<td><input type="text" name="name" value=<%=//deliveryName%>
					required></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address1" value=<%=//address1%>
					required></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="address2" value=<%=//address2%>
					required></td>
			</tr>
		</table> 
		-->
		<input type="submit" value="변경">
	</form>
</body>
</html>