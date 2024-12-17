<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%
String adminName = "";
String pdtKind = "case";

if ((String) session.getAttribute("adminId") == null) {
	response.sendRedirect("login/login_main.jsp");
	return;
} else {
	adminName = (String) session.getAttribute("adminName");
}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="../css/variables.css">
	<link rel="stylesheet" href="css/admin_page.css">
</head>
<body>
<div id ="wrapper">
	
<div id="sidebar">
	<div id="sidebar-top">
		<a href="../index.jsp"><img src="../img/logo_white.png" alt="로고 이미지" class="logo"></a>
		<img src="img/logo_admin_page.png" alt="관리자 로고 이미지" class="admin-logo"><br>
		<form action="login/logout.jsp" method="post">
			<div style="margin-left: 16px; margin-right: 16px; display: flex; align-items: center; justify-content: space-between; color:white;">
				<div><%= adminName %>님</div>
				<div><input type="submit" value="LOGOUT"></div> 
			</div>	
		</form>
		
		<a href="main.jsp"><div><img src="../img/test_128x128.png">메인</div></a>
	</div>
	<div id="scroll-area">
		<div>
			<div class="list-name">페이지 관리</div>
			<a href="management_banner.jsp"><div class="list"><img src="../img/test_128x128.png">배너 변경</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-조립PC</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">게이밍PC</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">사무용PC</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">전문용PC</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-PC주요부품</div>
			<a href="management_cpu.jsp"><div class="list"><img src="../img/test_128x128.png">CPU</div></a>
			<a href="management_mainboard.jsp"><div class="list"><img src="../img/test_128x128.png">메인보드</div></a>
			<a href="management_ram.jsp"><div class="list"><img src="../img/test_128x128.png">RAM</div></a>
			<a href="management_vga.jsp"><div class="list"><img src="../img/test_128x128.png">그래픽카드</div></a>
			<a href="management_psu.jsp"><div class="list"><img src="../img/test_128x128.png">파워서플라이</div></a>
			<a href="management_ssd.jsp"><div class="list"><img src="../img/test_128x128.png">SSD</div></a>
			<a href="management_hdd.jsp"><div class="list"><img src="../img/test_128x128.png">HDD</div></a>
			<a href="management_case.jsp"><div class="list"><img src="../img/test_128x128.png">케이스</div></a>
			<a href="management_cooler.jsp"><div class="list"><img src="../img/test_128x128.png">팬/쿨러</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-주변기기</div>
			<a href="management_monitor.jsp"><div class="list"><img src="../img/test_128x128.png">모니터</div></a>
			<a href="management_keyboard.jsp"><div class="list"><img src="../img/test_128x128.png">키보드</div></a>
			<a href="management_mouse.jsp"><div class="list"><img src="../img/test_128x128.png">마우스</div></a>
			<a href="management_speaker.jsp"><div class="list"><img src="../img/test_128x128.png">스피커</div></a>
			<a href="management_external_storage.jsp"><div class="list"><img src="../img/test_128x128.png">외부 저장장치</div></a>
		</div>
		<div>
			<div class="list-name">상품 관리-소프트웨어</div>
			<a href="management_software.jsp"><div class="list"><img src="../img/test_128x128.png">소프트웨어</div></a>
		</div>
		<div>
			<div class="list-name">회원 관리</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">주문내역 조회</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">회원정보 수정</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">비밀번호 초기화</div></a>
		</div>
		<div>
			<div class="list-name">주문 관리</div>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">새 주문 조회</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">주문상태 변경</div></a>
			<a href="#"><div class="list"><img src="../img/test_128x128.png">배송 완료된 주문 </div></a>
		</div>
		<br><br>
	</div>
</div>

<div id="content">
	<div class="top-bar">
		<div>케이스 등록</div>
	</div>
	<div class="bottom-area">
		<div class="management">
		<%
		String name = request.getParameter("name");
		
		if (name == null || "null".equals(name)) name = "";
		String manufacturer = "";
		String caseSize = "";
		String boardStandard = "";
		int vgaLength = 0;
		int cpuHeight = 0;
		
		// 공통 속성
		int price = 0;
		String image = "";
		int stock = 0;
		
		try (
				Connection conn = new Dao().getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(String.format(
						"select * from list_" + pdtKind + " where name='%s'", name));
				) {
			if (rs.next()) {
				name = rs.getString("name");
				manufacturer = rs.getString("manufacturer");
				caseSize = rs.getString("case_size");
				boardStandard = rs.getString("board_standard");
				vgaLength = rs.getInt("vga_length");
				cpuHeight = rs.getInt("cpu_height");
				
				// 공통 속성
				price = rs.getInt("price");
				image = rs.getString("image");
				stock = rs.getInt("stock");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
			<form action="db_update/update_<%= pdtKind %>.jsp" enctype="multipart/form-data" method="post">
				<div class="input-area">
					<div class="input-name">이름</div>
					<div class="input-content">
						<input type="text" name="name" class="long" value="<%=name%>">
					</div>
				</div>
				<div class="input-area">
					<div class="input-name">제조사</div>
					<div class="input-content">
						<input type="text" name="manufacturer" class="middle" value="<%=manufacturer%>">
					</div>
				</div>
				<div class="input-area">
					<div class="input-name">케이스종류</div>
					<div class="input-content">
						<input type="text" name="case-size" class="middle" value="<%=caseSize%>">
					</div>
				</div>
				<div class="input-area">
					<div class="input-name">보드 최대규격</div>
					<div class="input-content">
						<input type="text" name="board-standard" class="middle" value="<%=boardStandard%>">
					</div>
				</div>
				<div class="input-area">
					<div class="input-name">그래픽카드 길이</div>
					<div class="input-content">
						<input type="number" name="vga-length" class="short" value="<%=vgaLength%>"> mm
					</div>
				</div>
				<div class="input-area">
					<div class="input-name">CPU쿨러 높이</div>
					<div class="input-content">
						<input type="number" name="cpu-height" class="short" value="<%=cpuHeight%>"> mm
					</div>
				</div>
				
				<br>
				<hr>
				<br>
				<!-- 공통 속성 -->
				<div class="input-area">
					<div class="input-name">가격</div>
					<div class="input-content">
						<input type="number" name="price" class="short" value="<%=price%>"> \
					</div>
				</div>
				<div class="input-area">
					<div class="input-name">이미지</div>
					<div class="input-content">
						<input type="file" accept=".png, .jpg, .jpeg" name="image" value="찾아보기">
					</div>
				</div>
				<div class="input-area">
					<div class="input-name">재고수량</div>
					<div class="input-content">
						<input type="number" name="stock" class="short" value="<%=stock%>"> 개
					</div>
				</div>
				<br>
				<hr>
				<br>
				<input type="submit" class="bt-submit" value="등록">
			</form>
			<br>
			<br>
			<%
			if (!(image == null || image.isBlank())) {
				%>
				<img src="../img/product/img/<%= image %>" alt="<%= name %>" style="width: 128px; height: 128px;">
				<%
			}
			%>
		</div>
		
		<%
		String keyword = request.getParameter("search");
		if (keyword == null || "null".equals(keyword) || keyword.isBlank()) keyword = "";
		%>
		
		<div class="registed">
			<form action="management_<%= pdtKind %>.jsp" method="get">
				<div class="search-bar">
					<input type="text" class="input-text" name="search" value="<%= keyword %>">
					<input type="submit" value="검색">
				</div>
			</form>
			<div class="list">
			<%
			String searchQuery = "select * from list_" + pdtKind + " order by id desc";
			
			if (!"".equals(keyword)) {
				searchQuery = "select * from list_" + pdtKind + " where name like '%" + keyword + "%' order by id desc";
			}
			
			try (
					Connection conn = new Dao().getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(searchQuery);
					) {
				if (!rs.next()) {
					%>
					<div class="list-product-area">
						<div class="list-product-name">
							검색 결과가 없습니다
						</div>
					</div>
					<%
				} else {
					do {
						%>
						<div class="list-product-area">
							<div class="list-product-name">
								<%= rs.getString("name") %>
							</div>
							<div class="list-product-bt-recommend">
								<a href="db_recommend/recommend.jsp?name=<%=rs.getString("name")%>&pdt_kind=<%=pdtKind%>&search=<%= keyword %>"
									onclick="if (!confirm('추천상품 여부를 수정합니까?')) event.preventDefault();">
									<%
									if (rs.getString("recommend").equals("추천")) {
										%>
										<input type="button" value="추천해제" class="recommended">
										<%
									} else {
										%>
										<input type="button" value="추천하기">
										<%
									}
									%>
								</a>
							</div>
							<div class="list-product-bt-modify">
								<a href="management_<%= pdtKind %>.jsp?name=<%=rs.getString("name")%>&search=<%= keyword %>">
									<input type="button" value="수정">
								</a>
							</div>
							<div class="list-product-bt-delete">
								<a href="db_delete/delete_product.jsp?name=<%=rs.getString("name")%>&kind=<%= pdtKind %>"
									onclick="if (!confirm('정말 삭제하시겠습니까?')) event.preventDefault();">
									<input type="button" value="삭제">
								</a>
							</div>
						</div>
						<%
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
				
			</div>
		</div>
	</div>
</div>

</div>


</body>
</html>