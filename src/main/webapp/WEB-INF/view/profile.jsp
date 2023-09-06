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
						<li class="'nav-item"><a href="/" class="nav-link">Công
								việc</a></li>
						<li class="nav-item"><a href="/" class="nav-link">Ứng cử
								viên</a></li>
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



	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/static/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<h1 class="mb-3 bread">Hồ sơ</h1>
					<form
						action="${pageContext.request.contextPath }/user/update-avatar"
						method="post" enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" name="userId" value="${user.id}"> <label
								class="btn btn-primary btn-md btn-file"> Chọn ảnh<input
								type="file" name="avatar" id="avatar"> <input
								type="submit" value="Lưu">
							</label>
						</div>

						<div style="margin-left: 0px" id="divImage">
							<c:if test="${user.image != null}">
								<c:set var="userImage" value="${user.image}" />
								<c:set var="base64Data">
									<%=Base64.getEncoder().encodeToString((byte[]) pageContext.getAttribute("userImage"))%>
								</c:set>

								<img id="avatar1" height="100" width="100"
									style="border-radius: 50px"
									src="data:image/png;base64,${base64Data}">
							</c:if>
							<c:if test="${user.image == null}">
								<img id="avatar" height="100" width="100"
									style="border-radius: 50px"
									src="${'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
							</c:if>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- Người ứng tuyển -->
	<security:authorize access="hasRole('CANDIDATE')">
		<!-- HOME -->

		<section th:if="${user.status == 1 && user.role.id == 1}"
			class="site-section" style="margin-top: 10px">
			<div class="container">
				<h3 style="color: red">${filesuccess}</h3>
				<form method="post"
					action="saveCvFile?${_csrf.parameterName}=${_csrf.token}"
					enctype="multipart/form-data">
					<div class="row align-items-center mb-5">
						<input type="hidden" id="id" name="userId" value="${user.id }">
						<div class="col-lg-8">
							<div class="d-flex align-items-center">
								<div class="form-group" style="margin-top: 15px">
									<label class="btn btn-primary btn-md btn-file"> Chọn cv
										(pdf)<input name="file" id="fileToUpload" type="file" /> <input
										type="submit" value="Upload">
									</label>
								</div>
							</div>
						</div>
					</div>
				</form>
				<c:if test="${Cv!=null }">
					<form:form class="form-group"
						action="${pageContext.request.contextPath }/downloadFile"
						method="get">
						<div class="row align-items-center mb-5">
							<div class="col-lg-8">
								<div class="d-flex align-items-center">
									<input type="hidden" id="name" name="name"
										value="${Cv.fileName }" style="border: none">
									<div class="form-group" style="margin-top: 15px">
										<label class="btn btn-primary btn-md btn-file">Cv đã
											đăng ${Cv.fileName } <input type="submit" value="xem Cv">
										</label>
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</c:if>


				<!-- thông tin cá nhân -->

				<h2 class="mb-4">Thông tin cá nhân</h2>

				<form:form modelAttribute="user"
					action="${pageContext.request.contextPath }/user/update-profile"
					method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="row align-items-center mb-5">
						<div class="col-lg-8 mb-4 mb-lg-0">
							<div class="d-flex align-items-center">
								<div>
									<h2>Cập nhật thông tin</h2>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="row">

								<div class="col-6">
									<button type="submit" class="btn btn-block btn-primary btn-md">Lưu
										thông tin</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-lg-12">
							<div class="p-4 p-md-5 border rounded">
								<h3 class="text-black mb-5 border-bottom pb-2">Thông tin
									chi tiết</h3>
								<div class="form-group">
									<input type="hidden" id="id" name="id" value="${user.id }">
									<input type="hidden" id="password" name="password"
										value="${user.password }"> <input type="hidden"
										id="status" name="status" value="${user.status }"> <input
										type="hidden" id="role.id" name="role.id"
										value="${user.role.id }"> <label for="email">Email</label>
									<input type="email" class="form-control" id="email"
										name="email" value="${user.email != null ? user.email : null}"
										required placeholder="you@yourdomain.com">
								</div>
								<div class="form-group">
									<label for="job-title">Full name</label> <input type="text"
										class="form-control" name="fullName"
										value="${user.fullName != null ? user.fullName : null}"
										required id="job-title" placeholder="Full name">
								</div>
								<div class="form-group">
									<label for="job-location">Địa chỉ</label> <input type="text"
										name="address"
										value="${user.address != null ? user.address : null}"
										class="form-control" id="job-location" required
										placeholder="e.g. New York">
								</div>
								<div class="form-group">
									<label for="job-location">Số điện thoại</label> <input
										type="text" name="phoneNumber"
										value="${user.phoneNumber != null ? user.phoneNumber : null}"
										class="form-control" id="job-location" required
										placeholder="+ 84">
								</div>
								<div class="form-group">
									<label for="job-location">Mô tả bản thân</label>
									<textarea name="description" class="form-control" id="editor"
										placeholder="Mô tả">${user.description != null ? user.description : null}</textarea>
								</div>

							</div>

						</div>

					</div>
				</form:form>
			</div>

		</section>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc
							chắn muốn xóa ?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						Cv : <span id="cvXoa"></span> <span th:if="${Cv != null}"
							th:text="${Cv.fileName}"></span>
						<form action="/user/deleteCv" method="post">
							<div class="modal-footer mt-1">
								<input type="hidden" name="idCv">
								<button type="submit" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-danger">Xóa</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</security:authorize>




	<!-- Doanh Nghiệp -->
	<security:authorize access="hasRole('EMPLOYER')">

		<c:if test="${user.status == 1}">

			<section class="site-section" style="margin-top: 10px">
				<div class="container">
					<div class="row">
						<!-- thông tin cá nhân -->
						<div class="col-lg-6 mb-5">
							<h2 class="mb-4">Thông tin cá nhân</h2>
							<form:form modelAttribute="user"
								action="${pageContext.request.contextPath }/user/update-profile"
								method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
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
													value="${user.email}" required
													placeholder="you@yourdomain.com">
											</div>
											<div class="form-group">
												<label for="job-title">Họ và tên</label> <input type="text"
													class="form-control" name="fullName"
													value="${user.fullName}" id="job-title" required
													placeholder="Full name">
											</div>
											<div class="form-group">
												<label for="job-location">Địa chỉ</label> <input type="text"
													name="address"
													value="${user.address != null ? user.address : null}"
													required class="form-control" id="job-location"
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
												<textarea name="description" class="form-control"
													id="editor" placeholder="Mô tả"> ${user.description != null ? user.description : ""}</textarea>
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


						<!-- thông tin công ty -->

						<div class="col-lg-6">
							<h2 class="mb-4">Thông tin công ty</h2>
							<div class="form-group">
								<form
									action="${pageContext.request.contextPath }/user/update-logo-company"
									method="post" enctype="multipart/form-data">
									<label for="company-website-tw d-block1">Cập nhật Logo</label>
									<c:if test="${company.id!=null }">
										<input type="hidden" name="id" value="${company.id}">
									</c:if>
									<br> <label class="btn btn-primary btn-md btn-file">
										Chọn logo<input type="file" name="logoCompany"
										id="logoCompany" required>
									</label> <br> <input class="btn btn-primary" type="submit"
										value="Lưu">
									<div id="divLogo">
										<c:if test="${company.logo != null}">
											<c:set var="logoData" value="${company.logo}" />
											<c:set var="base64Data">
												<%=Base64.getEncoder().encodeToString((byte[]) pageContext.getAttribute("logoData"))%>
											</c:set>

											<img id="avatar1" height="100" width="100"
												style="border-radius: 50px"
												src="data:image/png;base64,${base64Data}">
										</c:if>

										<c:if test="${company.logo == null}">
											<img id="avatar1" height="100" width="100"
												style="border-radius: 50px"
												src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg">
										</c:if>

									</div>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}">
								</form>
							</div>


							<form:form modelAttribute="company"
								action="${pageContext.request.contextPath }/user/update-company"
								method="post">
								<div class="row mb-5">
									<div class="col-lg-12">
										<div class="p-4 p-md-5 border rounded">
											<c:if test="${company.id!=null }">
												<input type="hidden" name="id"
													value="${company.id !=null ? company.id : null}">
											</c:if>

											<div class="form-group">
												<label for="email">Email</label> <input type="text"
													class="form-control" required id="email" name="email"
													value="${company.email != null ? company.email : null }"
													placeholder="you@yourdomain.com">
											</div>
											<div class="form-group">
												<label for="job-title">Tên công ty</label> <input
													type="text" class="form-control" name="nameCompany"
													value="${company.nameCompany != null ? company.nameCompany : null }"
													id="job-title" placeholder="Full name" required>

											</div>
											<div class="form-group">
												<label for="job-location">Địa chỉ</label> <input type="text"
													name="address"
													value="${company.address != null ? company.address : null}"
													required class="form-control" id="job-location"
													placeholder="e.g. New York">
											</div>
											<div class="form-group">
												<label for="job-location">Số điện thoại công ty</label> <input
													type="text" name="phoneNumber"
													value="${company.phoneNumber != null ? company.phoneNumber : null}"
													required class="form-control" id="job-location"
													placeholder="+ 84">
											</div>
											<div class="form-group">
												<label for="job-location">Mô tả công ty</label>
												<textarea name="description" class="form-control"
													id="editorN" placeholder="Mô tả">${company.description != null ? company.description : null}</textarea>
											</div>

											<div style="margin-left: 0px" id="divImag1">
												<c:if test="${company.logo != null}">
													<img id="avatar1" height="100" width="100"
														style="border-radius: 50px"
														src="data:image/png;base64,${base64Data}">
												</c:if>

												<c:if test="${company.logo == null}">
													<img id="avatar1" height="100" width="100"
														style="border-radius: 50px"
														src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg">
												</c:if>
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
					</div>
				</div>
			</section>
		</c:if>
	</security:authorize>
	<script>
    ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>
	<script>
    $(function () {
        $('#fileUpload').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload').get(0);
                var files = fileUpload.files;
                var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '/user/upload/',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divImage").css("display","block")
                                }else{
                                    $('#avatar').attr('src', urlImage)
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

	<script>
    $(function () {
        $('#fileUpload2').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload2').get(0);
                var files = fileUpload.files;
                var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '/user/upload-company/',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật logo thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divLogo").css("display","block")
                                }else{
                                    $('#avatar1').attr('src', urlImage)
                                    swal({
                                        title: 'Cập nhật logo thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

	<script>
    $(function () {
        $('#fileUpload1').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload1').get(0);
                var files = fileUpload.files;
                var formData = new FormData();
                formData.append('file', files[0]);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '/user/uploadCv',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "false"){
                                    // document.getElementById("change").style.backgroundColor = 'red';

                                    swal({
                                        title: 'Cần chọn đúng loại file (PDF)!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    // $("#divImage").css("display","block")
                                }else{
                                    // $('#avatar').attr('src', urlImage)
                                    document.getElementById('nameCv').innerHTML = 'Xem cv';
                                    document.getElementById('nameCv').href = "http://localhost:8080/resources/uploads/"+urlImage ; //or grab it by tagname etc
                                    document.getElementById('xoa').innerHTML = 'Xóa cv';
                                    document.getElementById("cvName").innerHTML = urlImage;
                                    document.getElementById("cvXoa").innerHTML = urlImage;

                                    swal({
                                        title: 'Cập nhật CV thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

	<footer th:replace="public/fragments :: footer"
		class="ftco-footer ftco-bg-dark ftco-section"> </footer>
</body>
</html>