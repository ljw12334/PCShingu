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
String kindName = "전체 상품";
if (kind == null || "null".equals(kind)) kind = "all";
// 주요부품들
else if ("cpu".equals(kind)) kindName = "CPU";
else if ("mainboard".equals(kind)) kindName = "메인보드";
else if ("ram".equals(kind)) kindName = "RAM";
else if ("vga".equals(kind)) kindName = "그래픽카드";
else if ("psu".equals(kind)) kindName = "파워서플라이";
else if ("ssd".equals(kind)) kindName = "SSD";
else if ("hdd".equals(kind)) kindName = "하드디스크";
else if ("case".equals(kind)) kindName = "케이스";
else if ("cooler".equals(kind)) kindName = "팬/쿨러";
else if ("mainparts".equals(kind)) kindName = "PC주요부품";
// 주변기기들
else if ("monitor".equals(kind)) kindName = "모니터";
else if ("keyboard".equals(kind)) kindName = "키보드";
else if ("mouse".equals(kind)) kindName = "마우스";
else if ("speaker".equals(kind)) kindName = "스피커";
else if ("external_storage".equals(kind)) kindName = "외부 저장장치";
// 기타
else if ("software".equals(kind)) kindName = "소프트웨어";

int selectNum = 0;
String selectQuery = "";

String searchString = request.getParameter("search");
if (searchString == null || "null".equals(searchString)) searchString = "";

String whereQuery = "";
if (!(searchString == null || "null".equals(searchString)))
	whereQuery = "where name like '%" + searchString + "%'";

String orderQuery = "order by sales desc, name, class";
if (kind.equals("all")) {
	selectQuery =
			"select name, manufacturer, price, image, sales, stock, class from list_case " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_cooler_cpu " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_cooler_sysfan " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_cpu " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_external_storage " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_hdd " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_keyboard " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_mainboard " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_monitor " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_mouse " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_psu " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_ram " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_software " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_speaker " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_ssd " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_vga " + whereQuery + orderQuery;
} else if (kind.equals("cooler")) {
	selectQuery =
			"select name, manufacturer, price, image, sales, stock, class from list_cooler_cpu " + whereQuery + " union " +
			"select name, manufacturer, price, image, sales, stock, class from list_cooler_sysfan " + whereQuery + orderQuery;
} else {
	selectQuery = "select name, manufacturer, price, image, sales, stock, class from list_" + kind + " " + whereQuery + orderQuery;
}

%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
	<link rel="stylesheet" href="css/variables.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="css/product_list.css">
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
					<input type="text" name="search" class="tx-search" placeholder="검색어를 입력해보세요" value="<%= searchString %>">
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
    	<div class="page-name">
    	<%
    	if (request.getParameter("search") == null) {
    		%>
    		<%= kindName %>
    		<%
    	} else {
    		%>
    		<%= kindName %> - 검색: <%= request.getParameter("search") %>
    		<%
    		System.out.println(whereQuery);
    	}
    	%>
    	
    	</div>
    	
    	<%
    	if (!kind.equals("all")) {
    		%>
	    	<div class="recommend">
	    		<div class="recommend-name">추천상품</div>
	    		<div class="container">
	    			<%
	    			try (
	    					Connection conn = new Dao().getConnection();
	    					Statement stmt = conn.createStatement();
	    					ResultSet rs = stmt.executeQuery("select name, manufacturer, image, price, class from list_" + kind + " where recommend='추천' order by sales desc");
	    					) {
	    				int i = 1;
	    				while (rs.next()) {
	    					String pdtLink = "#";
	    					pdtLink = "product_view.jsp?kind=" + rs.getString("class") + "&name=" + rs.getString("name");
	    					%>
		    				<div class="item">
			    				<a href="<%= pdtLink %>">
			    					<div class="num"><%= i %></div>
				    				<img src="img/product/img/<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>">
				    				<div class="name">
				    				[<%= rs.getString("manufacturer") %>]
				    				<br>
				    				<%= rs.getString("name") %>
				    				</div>
				    				<div class="price"><%= df.format(rs.getInt("price")) %>원</div>
				    			</a>
				    		</div>
		    				<%
		    				i++;
		    				if (i > 5) break;
	    				}
	    				
	    			} catch (Exception e) {
	    				e.printStackTrace();
	    			}
	    			%>
	    		</div>
	    	</div>
	    	<!--
    		<div class="filter">
	    		
	    	</div>
	    	-->
    		<%
    	}
    	try (
				Connection conn = new Dao().getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(selectQuery);
				) {
			if (rs.next()) {
				rs.last();
				selectNum = rs.getRow();
				rs.beforeFirst();
			}
    	%>
    	
    	<div class="product-list">
    		<div class="bar">
    			<div class="count">
    			상품 <%= selectNum %>개 검색됨
    			</div>
    			<div class="search-bar">
    				<form action="product_list.jsp?kind=<%= kind %>" method="get">
    				<input type="text" name="search">
    				<input type="submit">
    			</div>
    			<div class="select">
    				<select>
	    				<option value="popular">판매량순</option>
	    				<option value="price">싼 가격순</option>
	    				<option value="price">비싼 가격순</option>
	    				<option value="name">이름순</option>
	    			</select>
    			</div>
    			<div class="soldout">
    				<input type="checkbox">품절제외
    			</div>
    			<!--
    			<div class="list-count">
    				<select>
	    				<option value="5">5개씩</option>
	    				<option value="10">10개씩</option>
	    				<option value="20">20개씩</option>
	    			</select>
    			</div>
    			-->
    			
    		</div>
    		<div class="container">
    			<%
    				while (rs.next()) {
    					String pdtLink = "#";
    					pdtLink = "product_view.jsp?kind=" + rs.getString("class") + "&name=" + rs.getString("name");
    					%>
        				<div class="item">
	    			    	<div>
	    			    		<a href="<%= pdtLink %>">
	    			    			<img alt="제품" src="img/product/img/<%= rs.getString("image") %>">
	    			    		</a>
	    				    	<div class="text">
	    				    		<a href="<%= pdtLink %>">
	    				    			<div style="font-size: 14px; font-weight: bold;">[<%= rs.getString("manufacturer") %>] <%= rs.getString("name") %></div>
	    				    			<div style="width: 600px; height: 60px; margin-top:4px;">
	    				    			<%
	    				    			String prop = new Product().getProps(rs.getString("class"), rs.getString("name"));
	    				    			%>
	    				    			<%= prop %>
	    				    			</div>
	    				    		</a>
	    				    	</div>
	    				    	<div class="price">
	    				    		<a href="<%= pdtLink %>">
	    				    		<%
	    				    		if (rs.getInt("stock") <= 0) {
	    				    			%>
	    				    			품절
	    				    			<%
	    				    		} else {
	    				    			%>
	    				    			<%= df.format(rs.getInt("price")) %>원
	    				    			<%
	    				    		}
	    				    		%>
	    				    		
	    				    		</a>
	    				    	</div>
	    				    	<div class="buttons"  style="right: 0;">
	    				    		<input type="button" value="장바구니" class="cart">
	    				    		<br>
	    				    		<input type="button" value="바로구매" class="buy">
	    				    	</div>
	    			    	</div>
    			    	</div>
        				<%
    				}
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    			%>
    			
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