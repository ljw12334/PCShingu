<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*" %>
<%@ page import="com.pcmall.dao.*" %>
<%@ page import="com.pcmall.dto.*" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
if ((String) session.getAttribute("userId") == null) {
	response.sendRedirect("mypage_login_form.jsp");
}

String userName = null;

if (session.getAttribute("userId") != null) {
	userName = (String) session.getAttribute("userName");
}

%>

<%
// 상대경로 (Relation Path)
String rp = "../";
%>

<%
ArrayList<BannerDto> banners = new BannerDao().selectList();
request.setAttribute("banners", banners);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메인 페이지</title>
	<link rel="stylesheet" href="<%= rp %>css/variables.css">
	<link rel="stylesheet" href="<%= rp %>css/common.css">
	<link rel="stylesheet" href="<%= rp %>css/main.css">
	<link rel="stylesheet" href="<%= rp %>css/slider.css">
	<link rel="stylesheet" href="<%= rp %>css/menu.css">
	<link rel="stylesheet" href="css/mypage.css">
</head>
<body>

<div id="wrapper">
	<header>
		<div class="top">
			<div>
				<ul>
					<c:choose>
						<c:when test="${userName == null}">
							<li><a href="<%= rp %>member/member_login_form.jsp">로그인</a></li>
							<li><a href="<%= rp %>member/member_join_form.jsp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							${userName} 님
							<li><a href="<%= rp %>member/connect/member_logout.jsp">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
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
					<div><a href="<%= rp %>mypage/mypage.jsp"><div><img src="<%= rp %>img/mypage.png"><br>마이페이지</div></a></div>
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
    	<div id="cont">
    		<div id="sidebar">
    			<img src="<%= rp %>img/mypage.png" id="profil-img">
    			<div id="profil-name"><%= session.getAttribute("userName") %> 님</div>
    			<div><a href="change.jsp">프로필 변경</a></div>
    			<div><a href="">장바구니</a></div>
    			<div><a href="">주문 조회</a></div>
    			<div><a href="address.jsp">배송지 관리</a></div>
    			<div><a href="">고객센터</a></div>
    			<div><a href="member_quit.jsp">회원탈퇴</a></div>
    		</div>
    		<div id="mypage-content">
    		
    		</div>
    	</div>
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
				<img src="<%= rp %>img/logo_grayscale.png" alt="하단 로고 이미지" style="width: 200px;" onClick="location.href = 'admin_page/main.jsp'">
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


<script src="js/slider.js"></script>
<script src="js/main.js"></script>
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


</html>