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
String socket = request.getParameter("socket");
String chipset = request.getParameter("chipset");
String standard = request.getParameter("standard");
String memoryKind = request.getParameter("memory-kind");
int memoryCount = 0;
int sataCount = 0;
int m2Count = 0;
String cpumf = request.getParameter("cpumf");

Boolean isImageAttached = false;

// 공통 속성
int price = 0;
String image = "";
int stock = 0;

try {
	memoryCount = Integer.parseInt(request.getParameter("memory-count"));
	sataCount = Integer.parseInt(request.getParameter("sata-count"));
	m2Count = Integer.parseInt(request.getParameter("m2-count"));
	
	price = Integer.parseInt(request.getParameter("price"));
	stock = Integer.parseInt(request.getParameter("stock"));

	if (name == null || name.isBlank() || manufacturer == null || manufacturer.isBlank() || socket == null || socket.isBlank() ||
		chipset == null || chipset.isBlank() || standard == null || standard.isBlank() || memoryKind == null || memoryKind.isBlank() ||
		cpumf == null || cpumf.isBlank() || memoryCount <= 0) {
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
			ResultSet rs = stmt.executeQuery("select * from list_mainboard where name='" + name + "'");
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
		ResultSet rs = stmt.executeQuery("select * from list_mainboard where name='" + name + "'");
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
				"update list_mainboard set manufacturer='%s', socket='%s', chipset='%s', standard='%s', memory_kind='%s', memory_count=%d, sata_count=%d, m2_count=%d, cpumf='%s'",
				manufacturer, socket, chipset, standard, memoryKind, memoryCount, sataCount, m2Count, cpumf) +
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
				"insert into list_mainboard (name, manufacturer, socket, chipset, standard, memory_kind, memory_count, sata_count, m2_count, cpumf" +
				// 공통 속성
				", price, image, stock) " +
				// 값
				"values('%s', '%s', '%s', '%s', '%s', '%s', %d, %d, %d, '%s'" + 
				// 공통 속성
				", %d, '%s', %d)",
				name, manufacturer, socket, chipset, standard, memoryKind, memoryCount, sataCount, m2Count, cpumf,
				// 공통 속성
				price, image, stock));
	}
	
	response.sendRedirect("../management_mainboard.jsp");
	return;
	
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인보드 데이터 삽입</title>
</head>
<body>
</body>
</html>
