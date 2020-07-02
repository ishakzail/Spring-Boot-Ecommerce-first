<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Access Denied</title>
</head>
<body>

	<H3>Access Denied to Customer Panel</H3>
	${msg} 
	<br>
	<a href="${pageContext.request.contextPath}/customer-panel">Back</a>

</body>
</html>