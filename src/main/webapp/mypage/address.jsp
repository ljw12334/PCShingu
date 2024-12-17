<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>
<%
String id = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<title>배송지</title><!-- 배송지 기본페이지 -->
<link href="css/delivery.css" rel="stylesheet">
</head>
<body>
	<main>
		<ul class="">
			<li><span> <a href="change.jsp">프로필 변경</a>
			</span></li>
			<li><span> <a href="#">장바구니</a>
			</span></li>
			<li><span> <a href="#">주문 조회</a>
			</span></li>
			<li><span> <a href="address.jsp">배송지 관리</a>
			</span></li>
			<li><span> <a href="#">고객센터</a>
			</span></li>
			<li><a href="member_quit.jsp"> 회원탈퇴</a></li>
		</ul>
		배송지 관리<br>
		<div class="delivery-list">
			<%
			try (Connection conn = new Dao().getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from delivery_address where id='" + id + "'");) {
				if (rs.next()) {
					do {
				int addressId = rs.getInt("address_id");
			%>
			<div class="item">
				<div class="name"><%=rs.getString("name")%></div>
				<div>
					<div class="addr1"><%=rs.getString("address1")%></div>
					<div class="addr2"><%=rs.getString("address2")%></div>
				</div>
				<!-- 배송지 수정 입력 페이지로 -->
				<input type="button" value="수정"
					onclick="window.open('address_check.jsp?address_id=<%=addressId%>', 'popup', 'width= 500, height=200')">
				<!-- 배송지 삭제 처리 페이지로 -->
				<input type="button" value="삭제"
					onclick="window.open('address_delete.jsp', 'popup', 'width= 500, height=200')">
			</div>
			<%
			} while (rs.next());
			} else {
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</div>
		<!-- 배송지 추가 입력 페이지로 -->
		<input type="button" value="배송지 추가"
			onclick="window.open('address_check2.jsp', 'popup', 'width= 500, height=200')">
	</main>
</body>
</html>