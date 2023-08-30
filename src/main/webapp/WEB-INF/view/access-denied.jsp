<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Access Denied</title>
</head>
<body>
	<h1 style="color: red">Truy cập bị từ chối- Bạn không được phép
		truy cập trang này</h1>

	<a href="${pageContext.request.contextPath }/">Quay lại</a>
</body>
</html>