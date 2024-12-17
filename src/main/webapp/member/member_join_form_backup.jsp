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
	<title>메인 페이지</title>
	<link rel="stylesheet" href="<%= rp %>css/variables.css">
	<link rel="stylesheet" href="<%= rp %>css/common.css">
	<link rel="stylesheet" href="<%= rp %>css/menu.css">
	<link rel="stylesheet" href="css/member.css">
</head>
<body>

<div id="wrapper">
	<header>
		<div class="top">
			<div>
				<ul>
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">주문조회</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
		<div class="middle">
			<div>
				<a href="<%=rp %>index.jsp">
					<img src="<%=rp %>img/logo.png" alt="로고 이미지" style="width: 200px;">
				</a>
				<form method="get" action="<%=rp %>product_list.jsp">
					<div class="search-bar">
						<input type="text" name="search" class="tx-search" placeholder="검색어를 입력해보세요">
						<input type="submit" class="bt-search">
					</div>
				</form>
				<div>
					<div><a href="#"><div><img src="<%= rp %>img/resentview.png"><br>최근조회</div></a></div>
					<div><a href="#"><div><img src="<%= rp %>img/mypage.png"><br>마이페이지</div></a></div>
					<div><a href="#"><div><img src="<%= rp %>img/shoppingcart.png"><br>장바구니</div></a></div>
				</div>
			</div>
		</div>
	</header>
	<nav id="menu-top">
		<div id="origin-bar">
			<ul>
				<li class="all-contents">
					<input id="all-contents-checkbox" type="checkbox" />
					
					<label for="all-contents-checkbox">
						 <img src="<%= rp %>img/bt_ham.png" id="nav-ham" style="width: 16px; vertical-align: middle;"> 전체 카테고리
					</label>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">조립PC</div>
					<div class="dropdown-contents">
						<a href="#">게이밍PC</a>
						<a href="#">사무용PC</a>
						<a href="#">전문용PC</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">주요부품</div>
					<div class="dropdown-contents">
						<a href="<%= rp %>product_list.jsp?kind=cpu">CPU</a>
						<a href="<%= rp %>product_list.jsp?kind=mainboard">메인보드</a>
						<a href="<%= rp %>product_list.jsp?kind=ram">RAM</a>
						<a href="<%= rp %>product_list.jsp?kind=vga">그래픽카드</a>
						<a href="<%= rp %>product_list.jsp?kind=psu">파워서플라이</a>
						<a href="<%= rp %>product_list.jsp?kind=ssd">SSD</a>
						<a href="<%= rp %>product_list.jsp?kind=hdd">HDD</a>
						<a href="<%= rp %>product_list.jsp?kind=case">케이스</a>
						<a href="<%= rp %>product_list.jsp?kind=cooler">팬/쿨러</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">주변기기</div>
					<div class="dropdown-contents">
						<a href="<%= rp %>product_list.jsp?kind=monitor">모니터</a>
						<a href="<%= rp %>product_list.jsp?kind=keyboard">키보드</a>
						<a href="<%= rp %>product_list.jsp?kind=mouse">마우스</a>
						<a href="<%= rp %>product_list.jsp?kind=speaker">스피커</a>
						<a href="<%= rp %>product_list.jsp?kind=external_storage">외부 저장장치</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">PC견적</div>
					<div class="dropdown-contents">
						<a href="#">견적 작성</a>
						<a href="#">내 견적함</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">이벤트</div>
					<div class="dropdown-contents">
						<a href="#">진행중인 이벤트</a>
						<a href="#">종료된 이벤트</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">고객센터</div>
					<div class="dropdown-contents">
						<a href="#">공지사항</a>
						<a href="#">자주 묻는 질문</a>
						<a href="#">문의 작성</a>
						<a href="#">문의글 확인</a>
					</div>
				</li>
			</ul>
		</div>
		<div id="sticky-bar">
			<div id="sticky-bar-ham-area">
				<input id="all-contents-checkbox-alt" type="checkbox" />
				<label for="all-contents-checkbox">
				 	<img src="<%= rp %>img/bt_ham.png" id="nav-ham-alt" style="width: 24px; margin-right: 8px; cursor: pointer;" alt="전체 카테고리">
				</label>
				
				<a href="index.jsp">
					<img src="<%= rp %>img/logo.png" alt="로고 이미지" style="width: 200px;">
				</a>
			</div>
			<form method="get" action="<%= rp %>product_list.jsp">
				<div class="search-bar">
					<input type="text" name="search" class="tx-search" placeholder="검색어를 입력해보세요">
					<input type="submit" class="bt-search">
				</div>
			</form>
			<div>
				<div><a href="#"><img src="<%= rp %>img/resentview.png"></a></div>
				<div><a href="#"><img src="<%= rp %>img/mypage.png"></a></div>
				<div><a href="#"><img src="<%= rp %>img/shoppingcart.png"></a></div>
			</div>
	    </div>
	    <div id="all-contents-menu">
			<table>
				<th>조립PC</th>
				<th>PC주요부품</th>
				<th>주변기기</th>
				<th>소프트웨어</th>
				<th>PC견적</th>
				<th>고객센터</th>
				<tr>
					<td>
						<a href="#">게이밍PC</a><br>
						<a href="#">사무용PC</a><br>
						<a href="#">전문용PC</a>
					</td>
					<td>
						<a href="<%= rp %>product_list.jsp?kind=cpu">CPU</a><br>
						<a href="<%= rp %>product_list.jsp?kind=mainboard">메인보드</a><br>
						<a href="<%= rp %>product_list.jsp?kind=ram">RAM</a><br>
						<a href="<%= rp %>product_list.jsp?kind=vga">그래픽카드</a><br>
						<a href="<%= rp %>product_list.jsp?kind=psu">파워서플라이</a><br>
						<a href="<%= rp %>product_list.jsp?kind=ssd">SSD</a><br>
						<a href="<%= rp %>product_list.jsp?kind=hdd">HDD</a><br>
						<a href="<%= rp %>product_list.jsp?kind=case">케이스</a><br>
						<a href="<%= rp %>product_list.jsp?kind=cooler">팬/쿨러</a>
					</td>
					<td>
						<a href="<%= rp %>product_list.jsp?kind=monitor">모니터</a><br>
						<a href="<%= rp %>product_list.jsp?kind=keyboard">키보드</a><br>
						<a href="<%= rp %>product_list.jsp?kind=mouse">마우스</a><br>
						<a href="<%= rp %>product_list.jsp?kind=speaker">스피커</a><br>
						<a href="<%= rp %>product_list.jsp?kind=external_storage">외부 저장장치</a>
					</td>
					<td>
						<a href="<%= rp %>product_list.jsp?kind=software">소프트웨어</a>
					</td>
					<td>
						<a href="#">견적 작성</a><br>
						<a href="#">내 견적함</a>
					</td>
					<td>
						<a href="#">공지사항</a><br>
						<a href="#">자주 묻는 질문</a><br>
						<a href="#">문의 작성</a><br>
						<a href="#">문의글 확인</a>
					</td>
				</tr>
			</table>
		</div>
    </nav>
    
    <main>
    	<!-- ================================================================================= -->
    	<!--                                   이 안에 내용 삽입                                    -->
    	<!-- ================================================================================= -->
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
    				<input type="text" name="id" required>
    				<input type="button" value="중복확인">
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
    		
    		<input type="button" value="취소">
    		<input type="submit" value="회원가입">
    	</form>
    	
    	
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

function emailInput() {
	if (email2.options[email2.selectedIndex].value == "other") {
		email2Alt.style.display = "inline";
	} else {
		email2Alt.style.display = "none";
	}
}

</script>

<script>
const allContentsMenu = document.getElementById("all-contents-menu");
const allContentsCheckbox = document.getElementById("all-contents-checkbox");
const allContentsCheckboxAlt = document.getElementById("all-contents-checkbox-alt");
const navHam = document.getElementById("nav-ham");
const navHamAlt = document.getElementById("nav-ham-alt");

allContentsCheckbox.addEventListener("change", function() {
	if (allContentsCheckbox.checked) {
		navHam.src = "<%=rp %>img/bt_fold.png";
		navHamAlt.src = "<%=rp %>img/bt_fold.png";
		allContentsMenu.style.display = "block";
	} else {
		navHam.src = "<%=rp %>img/bt_ham.png";
		navHamAlt.src = "<%=rp %>img/bt_ham.png";
		allContentsMenu.style.display = "none";
	}
});
</script>

<script src="<%= rp %>js/main.js"></script>

</html>