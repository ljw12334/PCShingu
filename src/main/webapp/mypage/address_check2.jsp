<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pcmall.javaClass.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배송지 추가</title><!-- 배송지를 추가할때 입력받는 페이지 -->
</head>
<body>
<form action="address_insert.jsp" method="post"><!-- 배송지 추가 쿼리를 처리하는 페이지로 이동 -->
			주소지 이름<input type="text" name="name" required><br>
			주소<input type="text" name="address1" required><br>
			상세주소<input type="text" name="address2" required>
	<!--  
	<table>
		<tr>
			<td>주소지 이름</td>
			<td><input type="text" name="name" required></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address1" required></td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td><input type="text" name="address2" required></td>
		</tr>
	</table>-->
<input type="submit" value="등록"> 
</form>
</body>
</html>