<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>

<%!
String getFileNameToSave(String path, String fileName) {
	int extIndex = fileName.lastIndexOf(".");
	
	String base, ext;
	
	if (extIndex > 0) {
		base = fileName.substring(0, extIndex);
		ext = fileName.substring(extIndex);
	} else {
		base = fileName;
		ext = "";
	}
	
	for (int i = 1; new File(path + fileName).exists(); i++) {
		fileName = base + "(" + i + ")" + ext;
	}
	
	return fileName;
}
%>

<%!
String getExtension(String fileName) {
	int extIndex = fileName.lastIndexOf(".");
	
	String ext;
	
	if (extIndex > 0) {
		ext = fileName.substring(extIndex);
	} else {
		ext = "";
	}
	
	return ext;
}
%>

<%
String name = request.getParameter("name");
String manufacturer = request.getParameter("manufacturer");
String caseSize = request.getParameter("case-size");
String boardStandard = request.getParameter("board-standard");
int vgaLength = 0;
int cpuHeight = 0;

Boolean isImageAttached = false;

// 공통 속성
int price = 0;
String image = "";
int stock = 0;

try {
	vgaLength = Integer.parseInt(request.getParameter("vga-length"));
	cpuHeight = Integer.parseInt(request.getParameter("cpu-height"));
	
	price = Integer.parseInt(request.getParameter("price"));
	stock = Integer.parseInt(request.getParameter("stock"));

	if (name == null || name.isBlank() || manufacturer == null || manufacturer.isBlank() || caseSize == null || caseSize.isBlank() ||
		boardStandard == null || boardStandard.isBlank() || vgaLength <= 0 || cpuHeight <= 0 ) {
		%>
		<script>
			alert("비어있거나 유효하지 않은 값이 존재합니다");
			history.back();
		</script>
		<%
		return;
	}
	
	Part part = request.getPart("image");
	if (part.getSize() > 0) isImageAttached = true;
	
	try (
			Connection conn = new Dao().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from list_case where name='" + name + "'");
			) {
		
		if (isImageAttached) {
			String path = application.getRealPath("/img/product/img/");
			String fileName = part.getSubmittedFileName();
			
			String ext = getExtension(fileName);
			if (!ext.equals(".png") && !ext.equals(".jpg") && !ext.equals(".jpeg")) {
				InvalidFileExtensionException e = new InvalidFileExtensionException("잘못된 확장자");
				throw e;
			}
			
			String fileNameToSave = getFileNameToSave(path, fileName);
			part.write(path + fileNameToSave);
			
			image = fileNameToSave;
			
		} else {
			if (rs.next()) {
				image = rs.getString("image");
			} else {
				FileNotAttachedException e = new FileNotAttachedException("파일 첨부 안됨");
				throw e;
			}
			
		}
	} catch (Exception e) {
		throw e;
	}
	
} catch (FileNotAttachedException e) {
	e.printStackTrace();
	%>
	<script>
		alert("제품의 썸네일 이미지가 첨부되지 않았습니다");
		history.back();
	</script>
	<%
	return;
	
} catch (InvalidFileExtensionException e) {
	e.printStackTrace();
	%>
	<script>
		alert("파일의 확장자는 png나 jpg또는 jpeg여야 합니다");
		history.back();
	</script>
	<%
	return;
	
} catch (Exception e) {
	e.printStackTrace();
	%>
	<script>
		alert("비어있거나 유효하지 않은 값이 존재합니다");
		history.back();
	</script>
	<%
	return;
	
}

try (
		Connection conn = new Dao().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from list_case where name='" + name + "'");
		) {
	if (rs.next()) {
		%>
		<script>
			if (!confirm("해당 이름의 제품이 이미 존재합니다. 덮어씌우시겠습니까?")) {
				history.back();
			}
		</script>
		<%
		String imageName = rs.getString("image");
		
		stmt.executeUpdate(String.format(
				"update list_case set manufacturer='%s', case_size='%s', board_standard='%s', vga_length=%d, cpu_height=%d",
				manufacturer, caseSize, boardStandard, vgaLength, cpuHeight) +
					// 공통 속성
					String.format(
					", price=%d, image='%s', stock=%d",
					price, image, stock) + 
						// 조건절
						" where name='" + name + "'" 
				);
		
		if (isImageAttached) {
			File imageFile = new File(application.getRealPath("/img/product/img/") + imageName);
			if (imageFile != null) {
				imageFile.delete();
			}
		}
	} else {
		stmt.executeUpdate(String.format(
				"insert into list_case (name, manufacturer, case_size, board_standard, vga_length, cpu_height" +
				// 공통 속성
				", price, image, stock) " +
				// 값
				"values('%s', '%s', '%s', '%s', %d, %d" + 
				// 공통 속성
				", %d, '%s', %d)",
				name, manufacturer, caseSize, boardStandard, vgaLength, cpuHeight,
				// 공통 속성
				price, image, stock));
	}
	
	response.sendRedirect("../management_case.jsp");
	return;
	
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>케이스 데이터 삽입</title>
</head>
<body>
</body>
</html>
