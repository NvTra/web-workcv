<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-6 mb-5">
		<h2 class="mb-4">Thông tin cá nhân</h2>

		<form:form modelAttribute="user"
			action="${pageContext.request.contextPath }/user/update-profile"
			method="post">
			<div class="row mb-5">
				<div class="col-lg-12">
					<div class="p-4 p-md-5 border rounded">
						<input type="hidden" id="id" name="id" value="${user.id }">
						<input type="hidden" id="password" name="password"
							value="${user.password }"> <input type="hidden"
							id="status" name="status" value="${user.status }"> <input
							type="hidden" id="role.id" name="role.id"
							value="${user.role.id }">
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email"
								value="${user.email}" required placeholder="you@yourdomain.com">
						</div>
						<div class="form-group">
							<label for="job-title">Họ và tên</label> <input type="text"
								class="form-control" name="fullName" value="${user.fullName}"
								id="job-title" required placeholder="Full name">
						</div>
						<div class="form-group">
							<label for="job-location">Địa chỉ</label> <input type="text"
								name="address"
								value="${user.address != null ? user.address : null}" required
								class="form-control" id="job-location"
								placeholder="e.g. New York">
						</div>
						<div class="form-group">
							<label for="job-location">Số điện thoại</label> <input
								type="text" name="phoneNumber"
								value="${user.phoneNumber != null ? user.phoneNumber : null}"
								required class="form-control" id="job-location"
								placeholder="+ 84">
						</div>
						<div class="form-group">
							<label for="job-location">Mô tả bản thân</label>
							<textarea name="description" class="form-control" id="editor"
								placeholder="Mô tả"> ${user.description != null ? user.description : ""}</textarea>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<input type="submit" value="Lưu thông tin"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>
					</div>

				</div>

			</div>
		</form:form>
	</div>
</body>
</html>