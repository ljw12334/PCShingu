<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*"%>
<%
String name = request.getParameter("name");
String gender = "";
String phone0 = "";
String phone1 = "";
String phone2 = "";
String address1 = "";
String address2 = "";
if ((Boolean) session.getAttribute("isPassed") != null) {
	try (Connection conn = new Dao().getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(
			String.format("select * from member where id='%s'", (String) session.getAttribute("userId")));) {
		if (rs.next() && rs.getString("gender").equals("남")) {
	gender = "남자";
		} else {
	gender = "여자";
		}
		phone0 = rs.getString("phone").substring(0, 3);
		phone1 = rs.getString("phone").substring(4, 8);
		phone2 = rs.getString("phone").substring(9, 13);
		address1 = rs.getString("addr1");
		address2 = rs.getString("addr2");
		if (address1 == null) {
	address1 = " ";
		}
		if (address2 == null) {
	address2 = " ";
		}
%>
<!DOCTYPE html>
<html>
<head>
<title>프로필 변경</title>
<!-- si_passed라는 세션이 있다면 프로필 변경 정보를 입력하는 페이지 -->
<meta charset="UTF-8">
<body>
	<main>
		<ul class="">
			<li><a href="change.jsp">프로필 변경</a></li>
			<li><a href="cart.jsp">장바구니</a></li>
			<li><a href="#">주문 조회</a></li>
			<li><a href="address.jsp">배송지 관리</a></li>
			<li><a href="#">고객센터</a></li>
			<li><a href="member_quit">회원탈퇴</a></li>
		</ul>

		프로필 변경<br> <img src="../img/profile.png" style="width: 120px">
		<form action="change_profil.jsp" method="post">
			<!-- 회원정보 변경을 처리하는 페이지로 이동  -->


			이름 <input type="text" name="changeName"
				value="<%=rs.getString("name")%>" required><br> 아이디
			<%=rs.getString("id")%><input type="hidden" name="changeId"
				value="<%=rs.getString("id")%>"><br> 비밀번호 <input
				type="password" name="changePw" required><br> 비밀번호 확인 <input
				type="password" name="changePwCheck" required><br> 성별
			<%=gender%><br> 연락처 <input type="text" maxlength="4" size="4"
				value="010"> - <input type="text" maxlength="4" size="4"
				name="phone1" value="<%=phone1%>" required> - <input
				type="text" maxlength="4" size="4" name="phone2"
				value="<%=phone2%>" required><br> 이메일 <input
				type="text" name="changeEmail" value="<%=rs.getString("email")%>"
				required><br> 주소 <input type="text"
				name="changeAddress1" value="<%=address1%>" required><br>
			세부 주소 <input type="text" name="changeAddress2" value="<%=address2%>"
				required><br> <input type="submit" value="수정하기">
		</form>
	</main>

	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	} else {
	%>
	<form action="change_check.jsp" method="post">
		<!-- is_passed 라는 세션이 없다면 비밀번호 확인받는 페이지 보여주기, 
	change_check라는 비밀번호 확인 처리후 세션 생성하는 페이지로 이동 -->
		비밀번호 : <input type="password" name="pw"> <input type="submit"
			value="확인">
	</form>
	<%
	}
	%>
</body>
</html>