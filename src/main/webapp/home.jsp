<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<body>
	<h2>Hello World!</h2>
	<h1>Trang chủ</h1>

	<!-- Kiểm tra xem người dùng đã đăng nhập hay chưa -->
	<c:if test="${not empty pageContext.request.remoteUser}">
		<p>Xin chào, ${pageContext.request.remoteUser}!</p>
		<form action="<c:url value='/logout' />" method="get">
			<input type="submit" value="Đăng xuất">
		</form>
	</c:if>

	<!-- Nếu chưa đăng nhập, hiển thị nút đăng nhập -->
	<c:if test="${empty pageContext.request.remoteUser}">
		<form action="<c:url value='/sign-up' />" method="get">
			<input type="submit" value="Đăng ký">
		</form>
		<form action="<c:url value='/showFormLogin' />" method="get">
			<input type="submit" value="Đăng nhập">
		</form>
	</c:if>

</body>
</html>
