<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("userId");
session.removeAttribute("userName");
%>
<script>
	alert('정상적으로 로그아웃 되었습니다.');
	//history.back();전으로 돌아가면서 새로고침 하는법??
	window.location = "../../index.jsp";
</script>