<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
	<nav class="header_menu"
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container-fluid px-md-4	">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">Work
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

	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/static/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5"
		th:if="${session.user.role.id == 2 }">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="index.html">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span>
					</p>
					<h1 class="mb-3 bread">Danh sách bài đăng</h1>
				</div>
			</div>
		</div>
	</div>
	<%-- <div th:if="${success}" class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; left: 10PX; z-index: 2000; width: 300px">
		<script>
        swal({
            title: 'Thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
	</div>
	<div th:if="${error}" class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; left: 10PX; z-index: 2000; width: 300px">
		<script>
        swal({
            title: 'Bài đăng đang có người ứng tuyển!',
            /* text: 'Redirecting...', */
            icon: 'error',
            timer: 3000,
            buttons: true,
            type: 'error'
        })
    </script>
	</div> --%>

	<section class="ftco-section bg-light"
		th:if="${session.user.role.id == 2 }">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 pr-lg-4">
					<div class="row">
						<c:if test="${list.content.size() == 0}">
							<div class="row form-group">
								<label for="company-website-tw d-block">Danh sách bài
									tuyển dụng</label><br>
								<div class="col-md-12">
									<a href="/recruitment/post"
										class="btn px-4 btn-primary text-white">Đăng tuyển</a>
								</div>
							</div>
						</c:if>
					</div>
					<c:if test="${recruitment.size() !=0}">
						<ul class="job-listings mb-5">
							<c:forEach var="tempRecruitment" items="${recruitment }">
								<c:url var="deleteLink" value="/recruitment/delete">
									<c:param name="recruitmentId" value="${tempRecruitment.id }"></c:param>
								</c:url>
								<c:url var="updateLink" value="/recruitment/showFormForUpdate">
									<c:param name="recruitmentId" value="${tempRecruitment.id }"></c:param>
								</c:url>
								<c:url var="detailLink" value="/recruitment/detail">
									<c:param name="recruitmentId" value="${tempRecruitment.id }"></c:param>
								</c:url>
								<div class="col-md-12 ">
									<div
										class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge"><c:out
														value="${tempRecruitment.type}" /></span>
												<h2 class="mr-3 text-black">
													<a><c:out value="${tempRecruitment.title}" /></a>
												</h2>
											</div>
											<span class="icon-layers">
												${tempRecruitment.company.nameCompany} </span> <span>&emsp;</span>
											<span class="icon-my_location">
												${tempRecruitment.address}</span>
										</div>


										<div style="width: 500px">
											<button type="button" style="width: 120px"
												class="btn btn-primary" data-toggle="modal"
												onclick="window.location.href='${detailLink}'">Xem
												chi tiết</button>

											<button type="button" style="width: 120px"
												class="btn btn-warning" data-bs-toggle="modal"
												onclick="window.location.href='${updateLink}'">Cập
												nhập</button>

											<button type="button" style="width: 80px"
												class="btn btn-danger" data-toggle="modal"
												data-target="#deleteRecruitment${tempRecruitment.id}">Xóa</button>
											<br>

											<!-- Modal Delete -->
											<div class="modal fade"
												id="deleteRecruitment${tempRecruitment.id}" tabindex="-1"
												role="dialog" aria-labelledby="confirmModalLabel"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="confirmModalLabel">Bạn
																chắc chắn muốn xóa ?</h5>
															<button type="button" class="btn-close"
																data-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															Bài đăng: <span>${tempRecruitment.title}</span>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Đóng</button>
															<button type="button" class="btn btn-danger"
																onclick="window.location.href='${deleteLink}'">Xóa</button>
														</div>
													</div>
												</div>
											</div>

											<!-- Modal Delete -->


										</div>
									</div>
								</div>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${recruitment.size() ==0}">
						<p>Chưa có bài đăng tuyển dụng nào</p>
					</c:if>
					<div class="row pagination-wrap">
						<c:if test="${totalPages > 1}">
							<ul class="pagination ml-auto">
								<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
									class="page-link" href="?page=${currentPage - 1}">Trang
										trước</a></li>

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