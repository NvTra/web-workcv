<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head">
<title>Work CV</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/css/bootstrap-reboot.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/css/mixins/_text-hide.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/bootstrap/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/bootstrap/bootstrap-reboot.css">

<!-- JS -->
<script
	src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/jquery-migrate-3.0.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/jquery.easing.1.3.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/jquery.stellar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/aos.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/scrollax.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/google-map.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/main.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
	<nav class="header_menu"
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container-fluid px-md-4	">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Work
				CV</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/" class="nav-link">Trang
							chủ</a></li>
					<li class="'nav-item"><a href="/" class="nav-link">Công
							việc</a></li>
					<li class="nav-item"><a href="/" class="nav-link">Ứng cử
							viên</a></li>
					<li class="nav-item cta mr-md-1"><a
						href="${pageContext.request.contextPath}/recruitment/post"
						class="nav-link">Đăng tuyển</a></li>
					<li class="nav-item cta cta-colored"><a
						href="<c:url value='/logout' />">Đăng xuất</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('user${pageContext.request.contextPath}/resources/static/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5"
		th:if="${session.user.role.id == 2 }">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="index.html">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span> Cập nhập<span></span>
					</p>
					<h1 class="mb-3 bread">Cập nhật bài tuyển dụng</h1>
				</div>
			</div>
		</div>
	</div>
	<div th:if="${success}" class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; left: 10PX; z-index: 2000; width: 300px">
		<div class="toast-header" style="background-color: #1c7430">
			<strong class="mr-auto" style="color: white">Thông báo</strong> <small
				style="color: white">Vừa xong</small>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
				aria-label="Close">
				<span aria-hidden="true" style="color: white">&times;</span>
			</button>
		</div>
		<div class="toast-body">
			<p th:text="'✅ ' +${success}"></p>
		</div>
		<script>
    $(document).ready(function(){
      $('.toast').toast('show');
    });
  </script>
	</div>


	<!-- HOME -->

	<section class="site-section" th:if="${session.user.role.id == 2 }">
		<div class="container">
			<form:form
				action="${pageContext.request.contextPath }/recruitment/updateRecruitment"
				method="post" modelAttribute="recruitment">
				<input type="hidden" class="form-control" id="job-location"
					name="id" value="${recruitment.id}">
				<input type="hidden" class="form-control" id="job-location"
					name="createdAt" value="${recruitment.createdAt}">
				<input type="hidden" class="form-control" id="job-location"
					name="company.id" value="${recruitment.company.id}">
					<input type="hidden" class="form-control" id="job-location"
					name="status" value="${recruitment.status}">
				<div class="row align-items-center mb-5">
					<div class="col-lg-8 mb-4 mb-lg-0">
						<div class="d-flex align-items-center">
							<div>
								<h2>Cập nhật bài đăng</h2>
							</div>
						</div>
					</div>

				</div>
				<div class="row mb-5">
					<div class="col-lg-12">
						<div class="p-4 p-md-5 border rounded" method="post">
							<h3 class="text-black mb-5 border-bottom pb-2">Chi tiết bài
								tuyển dụng</h3>
							<div class="form-group">
								<label for="email">Tiêu đề</label> <input type="text"
									class="form-control" id="email" name="title" required
									value="${recruitment.title}">
							</div>
							<div class="form-group">
								<label for="job-location">Mô tả công việc</label>
								<textarea name="description" class="form-control" id="editorN">${recruitment.description}</textarea>
							</div>
							<div class="form-group">
								<label for="job-title">Kinh nghiệm</label> <input type="text"
									class="form-control" id="job-title" name="experience"
									value="${recruitment.experience}">
							</div>
							<div class="form-group">
								<label for="job-title">Số người cần tuyển</label> <input
									type="number" class="form-control" id="job-title"
									name="quantity" value="${recruitment.quantity}">
							</div>
							<div class="form-group">
								<label for="job-location">Địa chỉ</label> <input type="text"
									class="form-control" id="job-location" name="address"
									value="${recruitment.address}">
							</div>
							<div class="form-group">
								<label for="job-location">Hạn ứng tuyển</label> <input
									type="date" class="form-control" id="job-location"
									name="deadline" value="${recruitment.deadline}">
							</div>
							<div class="form-group">
								<label for="job-location">Lương</label> <input type="text"
									class="form-control" id="job-location" name="salary"
									value="${recruitment.salary}">
							</div>

							<div class="form-group">
								<label for="job-region">Loại công việc</label> <select
									class="form-control" name="type"
									aria-label="Default select example" required>
									<option value="${recruitment.type}" selected>${recruitment.type}</option>
									<option value="Part time">Part time</option>
									<option value="Full time">Full time</option>
									<option value="Freelancer">Freelancer</option>
								</select>

							</div>
							<div class="form-group">
								<label for="job-region">Danh mục công việc</label> <select
									class="form-control" name="category.id"
									aria-label="Default select example" required>
									<option value="${recruitment.category.id}" selected>Chọn
										danh mục công việc</option>
									<c:forEach items="${jobCategories}" var="category">
										<option value="${category.id}">${category.name}</option>
									</c:forEach>
								</select>

							</div>
						</div>
					</div>

				</div>
				<div class="row align-items-center mb-5">

					<div class="col-lg-4 ml-auto">
						<div class="row">
							<div class="col-6">
								<a href="#" class="btn btn-block btn-light btn-md"></a>
							</div>
							<div class="col-6">
								<button type="submit" class="btn btn-block btn-primary btn-md">Cập
									nhật</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</section>
	<script>
  ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
    console.log("da" + eidt);
  })
          .catch(error => {
            console.error(error);
          });
</script>
	<footer th:replace="public/fragments :: footer"
		class="ftco-footer ftco-bg-dark ftco-section"> </footer>
</body>
</html>