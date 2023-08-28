<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

	<div>
		<div class="col-lg-6 mb-5">
			<h2 class="mb-4">Đăng kí</h2>
			<form:form action="addUser" method="post"
				class="p-4 border rounded" modelAttribute="user">

				<div class="row form-group">
					<div class="col-md-12 mb-3 mb-md-0">
						<label class="text-black" for="fname">Email</label> <input
							type="email" id="email" name="email" class="form-control"
							placeholder="Email" required>
					</div>
				</div>

				<div class="row form-group">
					<div class="col-md-12 mb-3 mb-md-0">
						<label class="text-black" for="fname">Họ và tên</label> <input
							type="text" id="email" name="fullName" class="form-control"
							placeholder="Họ và tên" required>
					</div>
				</div>

				<div class="row form-group">
					<div class="col-md-12 mb-3 mb-md-0">
						<label class="text-black" for="fname">Mật khẩu</label> <input
							type="password" id="" name="password" class="form-control"
							placeholder="Mật khẩu" required>
					</div>
				</div>
				<div class="row form-group mb-4">
					<div class="col-md-12 mb-3 mb-md-0">
						<label class="text-black" for="fname">Nhập lại mật khẩu</label> <input
							type="password" id="fname" name="rePassword" class="form-control"
							placeholder="Nhập lại mật khẩu" required>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-12 mb-3 mb-md-0">
						<label class="text-black" for="fname">Vai trò</label> <select
							class="form-control" name="role.id"
							aria-label="Default select example" required>
							<option selected>Chọn vai trò</option>
							<option value="1">Ứng cử viên</option>
							<option value="2">Công ty</option>
						</select>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-12">
						<input type="submit" value="Đăng kí"
							class="btn px-4 btn-primary text-white">
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>