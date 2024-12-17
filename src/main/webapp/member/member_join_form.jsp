<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
// 상대경로 (Relation Path)
String rp = "../";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="<%= rp %>css/variables.css">
	<link rel="stylesheet" href="<%= rp %>css/common.css">
	<link rel="stylesheet" href="<%= rp %>css/menu.css">
	<link rel="stylesheet" href="css/member.css">
</head>
<body>

<div id="wrapper">
	<header>
		<div class="member-top">
			<div>
				<a href="<%=rp %>index.jsp">
					<img src="<%=rp %>img/logo.png" alt="로고 이미지" style="width: 200px;">
				</a>
			</div>
			<div>
				<ul>
					<li><a href="member_login_form.jsp">로그인</a></li>
					<li><a href="member_join_form.jsp">회원가입</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
	</header>
    
    <main>
    	<!-- ================================================================================= -->
    	<!--                                   이 안에 내용 삽입                                    -->
    	<!-- ================================================================================= -->
    	<div id="member-content">
    		<div class="page-name">회원 가입</div>
		   <form action="connect/member_join.jsp" method="post">
		   	<div class="title-space">필수 정보</div>
		   	<!-- 아이디 ======================================================================== -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required">*</span>
		   			아이디
		   		</div>
		   		<div class="input-content">
		   			<input type="text" id="input-id" name="id" required>
		   			<input type="button" value="중복확인" onClick="idCheck()">
		   			<br>
		   			영문, 숫자로 4~12자로 설정해주세요
		   		</div>
		   	</div>
		   	<!--  비밀번호 ===================================================================== -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required">*</span>
		   			비밀번호
		   		</div>
		   		<div class="input-content">
		   			<input type="password" name="pw" required>
		   			<br>
		   			영문, 숫자, 특수문자를 조합해 8~12자로 설정해주세요
		   		</div>
		   	</div>
		   	<!--  비밀번호확인 ==================================================================== -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required">*</span>
		   			비밀번호 확인
		   		</div>
		   		<div class="input-content">
		   			<input type="password" name="pw-check" required>
		   		</div>
		   	</div>
		   	
		   	<div class="title-space">기본 정보</div>
		   	
		   	<!-- 이름 ============================================================================ -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required">*</span>
		   			이름
		   		</div>
		   		<div class="input-content">
		   			<input type="text" name="name" required>
		   		</div>
		   	</div>
		   	<!-- 성별 ============================================================================ -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required">*</span>
		   			성별
		   		</div>
		   		<div class="input-content">
		   			<input type="radio" name="gender" value="남" checked="checked">남
		   			<input type="radio" name="gender" value="여">여
		   		</div>
		   	</div>
		   	<!-- 이메일 ============================================================================ -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required">*</span>
		   			E-mail
		   		</div>
		   		<div class="input-content">
		   			<input type="text" name="email1" required>
		   			@
		   			<select name="email2" id="email2" onChange="emailInput()">
		   				<option value="naver.com">naver.com</option>
		   				<option value="gmail.com">gmail.com</option>
		   				<option value="hanmail.net">hanmail.net</option>
		   				<option value="other">직접입력</option>
		   			</select>
		   			<input type="text" name="email2-alt" id="email2-alt" style="display: none;">
		   		</div>
		   	</div>
		   	<!-- 휴대전화 ============================================================================ -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required">*</span>
		   			휴대전화
		   		</div>
		   		<div class="input-content">
		   			<input type="number" step="1" name="phone1" required style="width: 30px;"> - 
		   			<input type="number" step="1" name="phone2" required style="width: 50px;"> - 
		   			<input type="number" step="1" name="phone3" required style="width: 50px;">
		   		</div>
		   	</div>
		   	<!-- 주소 ============================================================================ -->
		   	<div class="input-area">
		   		<div class="input-name">
		   			<span class="required"> </span>
		   			주소
		   		</div>
		   		<div class="input-content">
		   			<input type="text" name="addr1" placeholder="주소 입력" style="width: 400px;">
		   			<br>
		   			<input type="text" name="addr2" placeholder="상세주소 입력" style="width: 400px;">
		   		</div>
		   	</div>
		   	<div class="form-buttons">
		   		<input type="button" value="취소" id="form-cancel" onclick="location.href='<%= rp %>index.jsp'">
		   		<input type="submit" value="회원가입" id="form-submit">
		   	</div>
		   </form>
    	</div>
    	
    	
    	
    	<!-- ================================================================================= -->
    	<!--                                      메인 종료                                       -->
    	<!-- ================================================================================= -->
    	
    </main>
    <footer>
    	<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">서비스이용약관</a></li>
			<li><a href="#">개인정보처리방침</a></li>
			<li><a href="#">전자금융거래약관</a></li>
		</ul>
    	<div>
			<p>
				<img src="<%= rp %>img/logo_grayscale.png" alt="하단 로고 이미지" style="width: 200px;">
			</p>
			<p>
				<strong>상호명</strong><br>
				신오지방 연고시티 흔들풍손로 209<br>
				사업자등록번호 : 123-45-67890<br>
				통신판매업신고 : 연고 12345호<br>
				대표이사 : 이수진
			</p>
			<p>
				<strong>고객센터</strong><br>
				Tel : 1234-5678<br>
				Fax : 12-345-6789 | Mail : sanghoname@sangho.com
			</p>
		</div>
    </footer>
    <button type="button" id="bt-top" onclick="moveToTop()">상단이동버튼</button>
</div>

</body>

<script>

const email2 = document.getElementById("email2");
const email2Alt = document.getElementById("email2-alt");
const inputId = document.getElementById("input-id");

function emailInput() {
	if (email2.options[email2.selectedIndex].value == "other") {
		email2Alt.style.display = "inline";
	} else {
		email2Alt.style.display = "none";
	}
}

function idCheck() {
	var currentId = "";
	currentId = inputId.value;
	window.open("connect/member_exist_id.jsp?id=" + currentId , "_blank", "width=300, height=150");
}

</script>

<script src="<%= rp %>js/main.js"></script>

</html>