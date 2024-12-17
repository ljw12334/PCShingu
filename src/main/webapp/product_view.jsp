<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String rp = "";

DecimalFormat df = new DecimalFormat("###,###");

String kind = request.getParameter("kind");
String kindBig = "";
String name = request.getParameter("name");
String kindName = "전체 상품";
if (kind == null || "null".equals(kind)) kind = "all";
// 주요부품들
else if ("cpu".equals(kind))			{ kindName = "CPU"; kindBig = "주요부품"; }
else if ("mainboard".equals(kind))		{ kindName = "메인보드"; kindBig = "주요부품"; }
else if ("ram".equals(kind))			{ kindName = "RAM"; kindBig = "주요부품"; }
else if ("vga".equals(kind))			{ kindName = "그래픽카드"; kindBig = "주요부품"; }
else if ("psu".equals(kind))			{ kindName = "파워서플라이"; kindBig = "주요부품"; }
else if ("ssd".equals(kind))			{ kindName = "SSD"; kindBig = "주요부품"; }
else if ("hdd".equals(kind))			{ kindName = "하드디스크"; kindBig = "주요부품"; }
else if ("case".equals(kind))			{ kindName = "케이스"; kindBig = "주요부품"; }
else if ("cooler_cpu".equals(kind))		{ kindName = "쿨러"; kindBig = "주요부품"; }
else if ("cooler_sysfan".equals(kind))	{ kindName = "팬"; kindBig = "주요부품"; }
else if ("mainparts".equals(kind))		{ kindName = "PC주요부품"; kindBig = "주요부품"; }
// 주변기기들
else if ("monitor".equals(kind))		{ kindName = "모니터"; kindBig = "주변기기"; }
else if ("keyboard".equals(kind))		{ kindName = "키보드"; kindBig = "주변기기"; }
else if ("mouse".equals(kind))			{ kindName = "마우스"; kindBig = "주변기기"; }
else if ("speaker".equals(kind))		{ kindName = "스피커"; kindBig = "주변기기"; }
else if ("external_storage".equals(kind)) { kindName = "외부 저장장치"; kindBig = "주변기기"; }
// 기타
else if ("software".equals(kind)) kindName = "소프트웨어";

String selectQuery = "select * from list_" + kind + " where name='" + name + "'";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>상품 상세</title>
	<link rel="stylesheet" href="css/variables.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="css/product_view.css">
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
						 <img src="img/bt_ham.png" id="nav-ham" style="width: 16px; vertical-align: middle;"> 전체 카테고리
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
						<a href="product_list.jsp?kind=cpu">CPU</a>
						<a href="product_list.jsp?kind=mainboard">메인보드</a>
						<a href="product_list.jsp?kind=ram">RAM</a>
						<a href="product_list.jsp?kind=vga">그래픽카드</a>
						<a href="product_list.jsp?kind=psu">파워서플라이</a>
						<a href="product_list.jsp?kind=ssd">SSD</a>
						<a href="product_list.jsp?kind=hdd">HDD</a>
						<a href="product_list.jsp?kind=case">케이스</a>
						<a href="product_list.jsp?kind=cooler">팬/쿨러</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">주변기기</div>
					<div class="dropdown-contents">
						<a href="product_list.jsp?kind=monitor">모니터</a>
						<a href="product_list.jsp?kind=keyboard">키보드</a>
						<a href="product_list.jsp?kind=mouse">마우스</a>
						<a href="product_list.jsp?kind=speaker">스피커</a>
						<a href="product_list.jsp?kind=external_storage">외부 저장장치</a>
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
				 	<img src="img/bt_ham.png" id="nav-ham-alt" style="width: 24px; margin-right: 8px; cursor: pointer;" alt="전체 카테고리">
				</label>
				
				<a href="index.jsp">
					<img src="img/logo.png" alt="로고 이미지" style="width: 200px;">
				</a>
			</div>
			<form method="get" action="product_list.jsp">
				<div class="search-bar">
					<input type="text" name="search" class="tx-search" placeholder="검색어를 입력해보세요">
					<input type="submit" class="bt-search">
				</div>
			</form>
			<div>
				<div><a href="#"><img src="img/resentview.png"></a></div>
				<div><a href="#"><img src="img/mypage.png"></a></div>
				<div><a href="#"><img src="img/shoppingcart.png"></a></div>
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
						<a href="product_list.jsp?kind=cpu">CPU</a><br>
						<a href="product_list.jsp?kind=mainboard">메인보드</a><br>
						<a href="product_list.jsp?kind=ram">RAM</a><br>
						<a href="product_list.jsp?kind=vga">그래픽카드</a><br>
						<a href="product_list.jsp?kind=psu">파워서플라이</a><br>
						<a href="product_list.jsp?kind=ssd">SSD</a><br>
						<a href="product_list.jsp?kind=hdd">HDD</a><br>
						<a href="product_list.jsp?kind=case">케이스</a><br>
						<a href="product_list.jsp?kind=cooler">팬/쿨러</a>
					</td>
					<td>
						<a href="product_list.jsp?kind=monitor">모니터</a><br>
						<a href="product_list.jsp?kind=keyboard">키보드</a><br>
						<a href="product_list.jsp?kind=mouse">마우스</a><br>
						<a href="product_list.jsp?kind=speaker">스피커</a><br>
						<a href="product_list.jsp?kind=external_storage">외부 저장장치</a>
					</td>
					<td>
						<a href="product_list.jsp?kind=software">소프트웨어</a>
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
    	<%
    	String pdtName = "";
    	int pdtPrice = 0;
    	try (
    			Connection conn = new Dao().getConnection();
    			Statement stmt = conn.createStatement();
    			ResultSet rs = stmt.executeQuery(selectQuery)
    			) {
    		if (rs.next()) {
    			pdtName = rs.getString("name");
    			pdtPrice = rs.getInt("price");
    	%>
    	<div style="padding-top: 8px; padding-left: 8px;">홈 > <%= kindBig %> > <%= kindName %></div>
    	<div class="page-name"><%= pdtName %></div>
    	
    	<div class="product-top">
    		<img src="img/product/img/<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>">
    		<div class="info">
    			<div class="info-area">
    				<div class="info-name">판매가</div>
    				<div class="info-content-price"><%= df.format(pdtPrice) %>원</div>
    			</div>
    			<div class="info-area">
    				<div class="info-name">상품평</div>
    				<div class="info-content"></div>
    			</div>
    			<div class="info-area">
    				<div class="info-name">제조사</div>
    				<div class="info-content"><%= rs.getString("manufacturer") %></div>
    			</div>
    			<div class="info-area">
    				<div class="info-name">혜택</div>
    				<div class="info-content">무이자 할부</div>
    			</div>
    			<div class="info-area">
    				<div class="info-name">주문수량</div>
    				<div class="info-content">
    					<div class="input-count">
    						<input type="button" id="count-less" value="←">
    						<input type="number" id="count-num" value="1">
    						<input type="button" id="count-more" value="→">
    					</div>
    				</div>
    			</div>
    			<div class="info-area">
    				<div class="info-name">총 상품 금액</div>
    				<div class="info-content">
    					<div id="final-price"><%= df.format(pdtPrice) %>원</div>
    				</div>
    			</div>
    			<div class="info-area">
    				<form method="post">
    					<input type="hidden" name="kind" value="<%= kind %>">
    					<input type="hidden" name="name" value="<%= name %>">
    					<input type="hidden" name="count" value="1" id="form-count">
    					<input type="submit" value="장바구니" formaction="#" class="cart">
    					<input type="submit" value="바로구매" formaction="#" class="buynow">
    				</form>
    			</div>
    		</div>
    	</div>
    	
    	<div>
    		<div>상품정보</div>
    		<div>구매후기</div>
    		<div>Q&A</div>
    		<div>배송/교환/환불</div>
    	</div>
    	<%
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	%>
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
				<img src="img/logo_grayscale.png" alt="하단 로고 이미지" style="width: 200px;">
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
<script src="js/main.js"></script>
<script src="js/slider.js"></script>
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

<script>

var countInput = document.getElementById("count-num");
var finalPrice = document.getElementById("final-price");
var formCount = document.getElementById("form-count");
var countValue = 1;
var originalPrice = <%= pdtPrice %>;

// input 요소의 값이 변하면 작동
countInput.addEventListener("input", function () {
	validateCountInput();
});

// 감소
document.getElementById("count-less").addEventListener("click", function () {
	if (countValue > 1) {
		countValue--;
		updateCountInput();
	}
});

// 증가
document.getElementById("count-more").addEventListener("click", function () {
	countValue++;
	updateCountInput();
});


function validateCountInput() {
	// 1미만이거나 숫자가 아니면 1로 고정
	if (isNaN(countInput.value) || countInput.value < 1) {
		countValue = 1;
	} else {
		// 소수점 제거
		countValue = parseInt(countInput.value);
	}
	updateCountInput();
}

// input요소에 실제로 값 반영
function updateCountInput() {
	countInput.value = countValue;
	finalPrice.textContent = addCommasToNumber(originalPrice * countValue) + "원";
	formCount.value = countValue;
}

function addCommasToNumber(number) {
	// 숫자를 문자열로 변환하여 뒤집음
	var numberStr = number.toString().split("").reverse().join("");
	
	// 세 자리씩 끊어서 쉼표를 추가
	var formattedNumber = numberStr.replace(/(\d{3})(?=\d)/g, "$1,");
	
	// 다시 뒤집어서 원래 순서로 되돌림
	return formattedNumber.split("").reverse().join("");
}

</script>
</html>