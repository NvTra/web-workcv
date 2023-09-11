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
	<%-- <div th:if="${success}" class="toast" data-delay="2000"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		<script>
			swal({
				title : 'Xóa thành công!',
				/* text: 'Redirecting...', */
				icon : 'success',
				timer : 3000,
				buttons : true,
				type : 'success'
			})
		</script>
	</div> --%>
	<!-- END nav -->
	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('user${pageContext.request.contextPath}/resources/static/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5"
		th:if="${session.user.role.id == 1 }">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="/">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span>
					</p>
					<h1 class="mb-3 bread">Danh sách công việc đã lưu</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light"
		th:if="${session.user.role.id == 1 }">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 pr-lg-5">
					<c:if test="${recruitments.size()!=0 }">
						<c:forEach var="tempRecruitment" items="${recruitments}">
							<div class="col-md-12 ">
								<div
									class="job-post-item p-4 d-block d-lg-flex align-items-center">
									<input type="hidden" id=tempRecruitment.id
										value="${tempRecruitment.id}">
									<div class="one-third mb-4 mb-md-0">
										<div class="job-post-item-header align-items-center">
											<span class="subadge">${tempRecruitment.type}</span>
											<h2 class="mr-3 text-black">
												<span>${tempRecruitment.title}</span>
											</h2>
										</div>
										<div class="job-post-item-body d-block d-md-flex">
											<div class="mr-3">
												<span class="icon-layers"></span>
												<c:url var="companyLink" value="/company/detail-company">
													<c:param name="companyId"
														value="${ tempRecruitment.company.id}"></c:param>
												</c:url>
												<a href="${companyLink }"><span>${tempRecruitment.company.nameCompany}</span></a>
											</div>
											<div>
												<span class="icon-my_location"></span> <span>${tempRecruitment.address}</span>
											</div>
										</div>
									</div>
									<security:authorize access="hasRole('CANDIDATE')">

										<c:if test="${not session.user}">
											<div
												class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
												<div class="col-6">
													<form:form method="post"
														action="${pageContext.request.contextPath}/job/unsaveJob">
														<input type="hidden" name="recruitmentId"
															value="${tempRecruitment.id}">
														<button
															class="icon text-center d-flex justify-content-center align-items-center icon mr-2"
															type="submit">
															<span class="icon-delete"></span>
														</button>
													</form:form>
												</div>

												<button type="button" style="width: 130px"
													class="btn btn-primary py-2" data-toggle="modal"
													data-target="#applypost${tempRecruitment.id}">Apply</button>

											</div>
										</c:if>
									</security:authorize>
								</div>
							</div>
							<!-- Model -->
							<div class="modal fade" id="applypost${tempRecruitment.id}"
								tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">
												Ứng tuyển: <span>${tempRecruitment.title}</span>
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

										<div class="modal-body">
											<div class="row">
												<div class="col-12" id="applyForm${tempRecruitment.id}">
													<select class="form-control"
														aria-label="Default select example"
														onchange="chooseSubmissionMethod(${tempRecruitment.id})">
														<option selected disabled>Chọn phương thức nộp</option>
														<option value="updateCV">Dùng CV đã cập nhật</option>
														<option value="newCV">Nộp CV mới</option>
													</select>
													<div id="updateCV${tempRecruitment.id}"
														style="display: none" class="col-12">
														<form:form modelAttribute="applyPost" method="post"
															action="${pageContext.request.contextPath }/job/apply-job">
															<input type="hidden" name="recruitment.id"
																value="${tempRecruitment.id}">
															<label for="fileUpload" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text" name="text"></textarea>
															<input type="submit" class="btn btn-primary" value="Nộp">
														</form:form>

													</div>
													<div id="newCV${tempRecruitment.id}" style="display: none"
														class="col-12">
														<form:form modelAttribute="applyPost" method="post"
															action="${pageContext.request.contextPath }/job/apply-job2"
															enctype="multipart/form-data">

															<input type="hidden" name="recruitment.id"
																value="${tempRecruitment.id}">
															<label for="fileUpload" class="col-form-label">Chọn
																cv:</label>
															<input name="file" id="fileToUpload" type="file"
																required="required" />
															<label for="fileUpload" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text" name="text"></textarea>
															<input type="submit" class="btn btn-primary" value="Nộp">
														</form:form>
													</div>
												</div>
											</div>
										</div>



									</div>
								</div>
							</div>
							<!-- Model -->
						</c:forEach>
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
					</c:if>
					<c:if test="${recruitments.size()==0 }">
						<div style="text-align: center">
							<p style="color: red;">Danh sách trống</p>
						</div>
					</c:if>

				</div>

			</div>
		</div>
	</section>
	<script>
	function chooseSubmissionMethod(jobId) {
		var submissionMethod = document.getElementById("applyForm" + jobId)
				.getElementsByTagName("select")[0].value;

		var updateCV = document.getElementById("updateCV" + jobId);
		var newCV = document.getElementById("newCV" + jobId);

		if (submissionMethod === "updateCV") {
			updateCV.style.display = "block";
			newCV.style.display = "none";
		} else if (submissionMethod === "newCV") {
			updateCV.style.display = "none";
			newCV.style.display = "block";
		}
	}
		function apply1(id) {
			var name = "#idRe" + id;
			var nameModal = "#exampleModal" + id;
			var nameFile = "#fileUpload" + id;
			var nameText = "#text" + id;
			var idRe = $(name).val();
			var textvalue = $(nameText).val();
			var formData = new FormData();
			formData.append('idRe', idRe);
			formData.append('text', textvalue);
			$.ajax({
				type : 'POST',
				url : '/user/apply-job1/',
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
		function choosed(id) {
			var name = '#choose' + id;
			var name1 = 'loai1' + id;
			var name2 = 'loai2' + id;
			var button1 = 'button1' + id;
			var button2 = 'button2' + id;
			var giaitri = $(name).val();
			if (giaitri == 1) {
				document.getElementById(name1).style.display = 'block'
				document.getElementById(name2).style.display = 'none'
				document.getElementById(button1).style.display = 'block'
				document.getElementById(button2).style.display = 'none'
			} else {
				document.getElementById(name2).style.display = 'block'
				document.getElementById(name1).style.display = 'none'
				document.getElementById(button2).style.display = 'block'
				document.getElementById(button1).style.display = 'none'
			}
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




	<footer th:replace="public/fragments :: footer"
		class="ftco-footer ftco-bg-dark ftco-section"> </footer>


	<!-- loader -->
	<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>