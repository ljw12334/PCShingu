<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("userId");
session.removeAttribute("userName");
%>
<script>
	alert('로그아웃 되었습니다.');
	//history.back();전으로 돌아가면서 새로고침 하는법?? 을 알면 로그인,로그아웃은 전체 페이지 공유 할수 있을거같은데 ㅁ?ㄹ
	window.location = "../index.jsp";//메인으로 이동
</script>