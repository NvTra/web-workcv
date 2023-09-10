<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<body>
	<!-- NAV -->
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
			<c:set var="sessionId" value="${pageContext.session.id}" />

			<div class="collapse navbar-collapse" id="ftco-nav">
				<security:authorize access="hasRole('EMPLOYER')">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a
							href="${pageContext.request.contextPath}/" class="nav-link">Trang
								chủ</a></li>
						<li class="'nav-item"><a
							href="${pageContext.request.contextPath }/recruitment/list-post"
							class="nav-link">Công việc</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath }/user/list-user"
							class="nav-link">Ứng cử viên</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/recruitment/post"
							class="nav-link">Đăng tuyển</a></li>
						<li class="nav-item"><a href="<c:url value='/logout' />">Đăng
								xuất</a></li>
					</ul>

				</security:authorize>

				<security:authorize access="hasRole('CANDIDATE')">
					<li>
						<ul class="dropdown">
							<li><a href="/">Hồ Sơ</a></li>
							<li><a href="/save-job/get-list">Công việc đã lưu</a></li>
							<li><a href="/user/list-post">Danh sách bài đăng</a></li>
							<li><a href="/user/get-list-apply">Công việc đã ứng
									tuyển</a></li>
							<li><a href="/user/get-list-company">Công ty đã theo dõi</a></li>

						</ul>
					</li>
				</security:authorize>

			</div>
		</div>
	</nav>
	<!-- NAV -->
	<%-- <div th:if="${success}" class="toast" data-delay="2000"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		<script>
			swal({
				title : 'Ứng cử viên này chưa cập nhật cv!',
				/* text: 'Redirecting...', */
				icon : 'error',
				timer : 3000,
				buttons : true,
				type : 'error'
			})
		</script>
	</div> --%>
	<!-- END nav -->
	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/static/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="/">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span>
					</p>
					<h1 class="mb-3 bread">Danh sách ứng cử viên</h1>
				</div>
			</div>
		</div>
	</div>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 pr-lg-5">
					<div class="row">
						<c:if test="${applyPosts.size()!=0 }">
							<c:forEach var="applyPost" items="${applyPosts }">
								<div class="col-md-12"
									style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto;">
									<div class="team d-md-flex p-4 bg-white">
										<c:if test="${tempApplyPost.user.image != null}">
											<c:set var="userImage" value="${tempApplyPost.user.image}" />
											<c:set var="base64Data">
												<%=Base64.getEncoder().encodeToString((byte[]) pageContext.getAttribute("userImage"))%>
											</c:set>

											<img id="avatar1" height="100" width="100"
												style="border-radius: 50px"
												src="data:image/png;base64,${base64Data}">
										</c:if>
										<c:if test="${tempApplyPost.user.image == null}">
											<IMG class="img"
												src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg"></IMG>
										</c:if>
										<div class="text pl-md-4">
											<H5 class="location mb-0">${applyPost.user.fullName}</H5>
											<p style="display: block; color: black">${applyPost.user.address}</p>
											<span class="position" style="display: block; color: black">${applyPost.user.email}</span>
											<p class="mb-4" style="width: 700px">${applyPost.user.description}</p>
											<%-- <div th:if="${applyPost.cv != null}" style="margin-left: 1px"
											class="row">
											<p>
												<a th:href="${'/user/getCv/'}+${applyPost.id}"
													class="btn btn-primary">Xem cv</a>
											</p>
										</div> --%>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${applyPosts.size()==0 }">
							<p style="color: red">Không có kết quả nào</p>
						</c:if>
					</div>

					<div class="row pagination-wrap">
						<c:if test="${totalPages > 1}">
							<ul class="pagination ml-auto">
								<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
									<a class="page-link" href="?page=${currentPage - 1}">Trang
										trước</a>
								</li>

								<li
									class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
									<a class="page-link" href="?page=${currentPage + 1}">Trang
										kế tiếp</a>
								</li>
							</ul>
						</c:if>
					</div>

				</div>

			</div>
		</div>
	</section>
	<script>
		function save(id) {
			var name = "#idRe" + id;
			var idRe = $(name).val();
			var formData = new FormData();
			formData.append('idRe', idRe);
			$.ajax({
				type : 'POST',
				url : '/save-job/save/',
				contentType : false,
				processData : false,
				data : formData,
				success : function(data) {
					console.log(data);
					if (data == "false") {
						swal({
							title : 'Bạn cần phải đăng nhập!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					} else if (data == "true") {
						swal({
							title : 'Lưu thành công!',
							/* text: 'Redirecting...', */
							icon : 'success',
							timer : 3000,
							buttons : true,
							type : 'success'
						})
					} else {
						swal({
							title : 'Bạn đã lưu bài này rồi!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					}
				},
				error : function(err) {
					alert(err);
				}
			})
		}

		function apply(id) {
			var name = "#idRe" + id;
			var nameModal = "#exampleModal" + id;
			var nameFile = "#fileUpload" + id;
			var nameText = "#text" + id;
			var idRe = $(name).val();
			var textvalue = $(nameText).val();
			var fileUpload = $(nameFile).get(0);
			var files = fileUpload.files;
			var formData = new FormData();
			formData.append('file', files[0]);
			formData.append('idRe', idRe);
			formData.append('text', textvalue);
			if (files[0] == null) {
				swal({
					title : 'Bạn cần phải chọn cv!',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
				})
			} else {
				$.ajax({
					type : 'POST',
					url : '/user/apply-job/',
					contentType : false,
					processData : false,
					data : formData,
					success : function(data) {
						if (data == "false") {
							swal({
								title : 'Bạn cần phải đăng nhập!',
								/* text: 'Redirecting...', */
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
							})
						} else if (data == "true") {
							swal({
								title : 'Ứng tuyển thành công!',
								/* text: 'Redirecting...', */
								icon : 'success',
								timer : 3000,
								buttons : true,
								type : 'success'
							})
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
						} else {
							swal({
								title : 'Bạn đã ứng tuyển công việc này!',
								/* text: 'Redirecting...', */
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
							})
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
						}
					},
					error : function(err) {
						alert(err);
					}
				})
			}

		}
	</script>



	<footer th:replace="public/fragments :: footer"
		class="ftco-footer ftco-bg-dark ftco-section"> </footer>


	<!-- loader -->
	<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>