<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcmall.javaClass.*" %>
<%@ page import="com.pcmall.dao.*" %>
<%@ page import="com.pcmall.dto.*" %>

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
String image = "";

try {

	if (name == null || name.isBlank()) {
		%>
		<script>
			alert("비어있거나 유효하지 않은 값이 존재합니다");
			history.back();
		</script>
		<%
		return;
	}
	
	Part part = request.getPart("image");
	if (part.getSize() > 0) {
		String path = application.getRealPath("/img/banner/");
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
		Exception e = new Exception("파일 첨부 안됨");
		throw e;
	}
	
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

// 데이터 삽입
BannerDto dto = new BannerDto();
dto.setName(name);
dto.setImage(image);
dto.setUrl("#");

BannerDto existDto = new BannerDao().selectOne(name);
System.out.println(existDto.getName());

if (existDto.getName().isBlank() || existDto.getName() == null) {
	new BannerDao().insertOne(dto);
} else {
	%>
	<script>
		if (!confirm("해당 이름의 배너가 이미 존재합니다. 덮어씌우시겠습니까?")) {
			history.back();
		}
	</script>
	<%
	new BannerDao().updateOne(dto);
}
response.sendRedirect("../management_banner.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 삽입</title>
</head>
<body>
</body>
</html>
