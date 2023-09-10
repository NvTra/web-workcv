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
<title>Work CV - Chi tiết công việc</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
			</div>
		</div>
	</nav>


	<!-- END nav -->
	<div th:if="${success}" class="toast" data-delay="2000"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		<script>
			swal({
				title : 'Duyệt thành công!',
				/* text: 'Redirecting...', */
				icon : 'success',
				timer : 3000,
				buttons : true,
				type : 'success'
			})
		</script>
	</div>

	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/static/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="index.html">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span>
					</p>
					<h1 class="mb-3 bread">Chi tiết công việc</h1>
				</div>
			</div>
		</div>
	</div>

	<section style="margin-top: 10px" class="site-section">
		<div class="container">
			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div class="border p-2 d-inline-block mr-3 rounded">
							<c:choose>
								<c:when test="${recruitment.company.logo !=null}">
									<c:set var="userImage" value="${recruitment.company.logo}" />
									<c:set var="base64Data">
										<%=Base64.getEncoder().encodeToString((byte[]) pageContext.getAttribute("userImage"))%>
									</c:set>
									<img id="avatar1" height="50px" width="50px"
										style="border-radius: 50px"
										src="data:image/png;base64,${base64Data}">
								</c:when>
								<c:when test="${recruitment.company.logo ==null}">
									<img id="avatar1" height="50px" width="50px"
										style="border-radius: 50px"
										src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg">
								</c:when>
							</c:choose>

						</div>
						<div>
							<h2></h2>
							<div>
								<span class="icon-briefcase mr-2">
									${recruitment.company.nameCompany}</span> <span class="icon-room mr-2">
									${recruitment.company.address}</span> <span class="icon-clock-o mr-2">
									${recruitment.type}</span>
							</div>
							<input type="hidden">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="row">
						<div class="col-6">
							<a class="btn btn-block btn-light btn-md"><span
								class="icon-heart-o mr-2 text-danger"></span>Lưu</a>
						</div>
						<div class="col-6">
							<a data-toggle="modal" class="btn btn-block btn-primary btn-md">Ứng
								tuyển</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-5">

						<h3 class="h5 d-flex align-items-center mb-4 text-primary">
							<span class="icon-align-left mr-3"></span>Mô tả công việc
						</h3>
						<p>${recruitment.description}</p>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="bg-light p-3 border rounded mb-4">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công
							việc</h3>
						<ul class="list-unstyled pl-3 mb-0">
							<li class="mb-2"><strong class="text-black">Ngày
									tạo: </strong> <span>${recruitment.createdAt}</span></li>
							<li class="mb-2"><strong class="text-black">Kiểu
									công việc: </strong> <span>${recruitment.type}</span></li>
							<li class="mb-2"><strong class="text-black">Loại
									công việc: </strong> <span>${recruitment.category.name}</span></li>
							<li class="mb-2"><strong class="text-black">Kinh
									nghiệm: </strong> <span>${recruitment.experience}</span></li>
							<li class="mb-2"><strong class="text-black">Địa
									chỉ: </strong> <span>${recruitment.address}</span></li>
							<li class="mb-2"><strong class="text-black">Lương:
							</strong> <span>${recruitment.salary}</span></li>
							<li class="mb-2"><strong class="text-black">Số
									lượng: </strong><span>${recruitment.quantity}</span></li>
							<li class="mb-2"><strong class="text-black">Hạn nộp
									cv: </strong><span>${recruitment.deadline}</span></li>
						</ul>
					</div>

					<div class="bg-light p-3 border rounded">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
						<div class="px-3">
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-facebook"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-linkedin"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						Ứng tuyển: <span></span>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="/user/apply-job">
					<div class="modal-body">
						<div class="row">
							<div class="col-12">
								<label for="fileUpload" class="col-form-label">Chọn cv:</label>
								<input type="file" class="form-control"
									th:id="${'fileUpload'}+${recruitment.id}" name="file" required>
								<label for="fileUpload" class="col-form-label">Giới
									thiệu:</label>
								<textarea rows="10" cols="3" class="form-control">

                                                    </textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
							<button type="button"
								th:onclick="'apply(' +${recruitment.id}+ ')'"
								class="btn btn-primary">Nộp</button>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
	<section class="site-section" id="next">
		<div class="container">

			<div class="row mb-5 justify-content-center">
				<div class="col-md-7 text-center">
					<h2 class="section-title mb-2" th:if="${applyPosts}">Danh sách
						ứng viên ứng tuyển</h2>
				</div>
			</div>

			<div th:if="${applyPosts != null}" class="row">
				<div class="col-lg-12 pr-lg-4">
					<div class="row">
						<c:if test="${applyPosts.size() != 0}">
							<c:forEach var="tempApplyPost" items="${applyPosts }">
								<c:url var="downloadFile" value="/downloadFile">
									<c:param name="name" value="${tempApplyPost.nameCv}"></c:param>
								</c:url>
								<c:url var="confirmJob" value="/recruitment/confirmPost">
									<c:param name="applyPostId" value="${tempApplyPost.id}"></c:param>

								</c:url>
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
											<H5 class="location mb-0">${tempApplyPost.user.fullName}</H5>
											<p style="display: block; color: black">${tempApplyPost.user.address}</p>
											<span class="position" style="display: block; color: black">${tempApplyPost.user.email}</span>
											<p class="mb-4" style="width: 700px">${tempApplyPost.user.description}</p>
											<div class="row">
												<c:choose>
													<c:when test="${tempApplyPost.nameCv==null}">
														<a href="#" class="btn btn-primary"> Xem cv</a>
													</c:when>
													<c:when test="${tempApplyPost.nameCv!=null}">
														<button type="button" style="width: 120px"
															class="btn btn-primary" data-toggle="modal"
															onclick="window.location.href='${downloadFile}'">Xem
															cv</button>
													</c:when>
												</c:choose>
												<div>
													<p>&nbsp;&nbsp;</p>
												</div>
												<c:choose>
													<c:when test="${tempApplyPost.status == 0}">
														<button type="button" style="width: 120px"
															class="btn btn-primary" data-toggle="modal"
															onclick="window.location.href='${confirmJob}'">Duyệt</button>
													</c:when>
													<c:when test="${tempApplyPost.status == 1}">
														<p style="margin-left: 10px; margin-top: 15px">
															<span style="color: #1e7e34; font-weight: bold">Đã
																duyệt</span>
														</p>
													</c:when>
												</c:choose>


											</div>

										</div>
									</div>
								</div>

							</c:forEach>
						</c:if>
						<c:if test="${applyPosts.size() == 0}">
							<p>Chưa có ứng cử viên nào ứng tuyển</p>
						</c:if>
					</div>
				</div>

			</div>


			<script>
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
						$
								.ajax({
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
			</script>

		</div>
	</section>




	<footer th:replace="public/fragments :: footer"
		class="ftco-footer ftco-bg-dark ftco-section"> </footer>
</body>
</html>