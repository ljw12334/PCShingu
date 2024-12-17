<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>양식</title>
	
	<meta charset="UTF-8">
    <link rel="stylesheet" href="../css/variables.css">
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/slider.css">
	<link rel="stylesheet" href="../css/menu.css">
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
				<a href="index.jsp">
					<img src="../img/logo.png" alt="로고 이미지" style="width: 200px;">
				</a>
				<form method="get" action="product_list.jsp">
					<div class="search-bar">
						<input type="text" name="search" class="tx-search" placeholder="검색어를 입력해보세요">
						<input type="submit" class="bt-search">
					</div>
				</form>
				<div>
					<div><a href="#"><div><img src="../img/resentview.png"><br>최근조회</div></a></div>
					<div><a href="#"><div><img src="../img/mypage.png"><br>마이페이지</div></a></div>
					<div><a href="#"><div><img src="../img/shoppingcart.png"><br>장바구니</div></a></div>
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
						 <img src="../img/bt_ham.png" id="nav-ham" style="width: 16px; vertical-align: middle;"> 전체 카테고리
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
		<ul class="">
    		<li><span>
    			<a href="change.jsp">프로필 변경</a>
        	</span></li>
        	<li><span>
        	<a href="cart.jsp">장바구니</a>
			</span></li>
        	<li><span>
        	<a href="order_reference.jsp">주문 조회</a>
        	</span></li>
        	<li><span>
        	<a href="address.jsp">배송지 관리</a>
        	</span></li>
        	<li><span>
        	<a href="#">고객센터</a>
        	</span></li>
        	<li><span>회원탈퇴</span></li>
     	</ul>
     	
     	
    </main>
            	<form action="../login/logout.jsp">
		<input type="submit" value="세션삭제">
	</form>

	안녕하세요 <%=(String)session.getAttribute("userName")%>님
	
	
	<footer>
    	<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">서비스이용약관</a></li>
			<li><a href="#">개인정보처리방침</a></li>
			<li><a href="#">전자금융거래약관</a></li>
		</ul>
    	<div>
			<p>
				<img src="../img/logo_grayscale.png" alt="하단 로고 이미지" style="width: 200px;">
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
</html>