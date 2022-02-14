<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory</title>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/calendarBase.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/calendarBig.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/calendarSmall.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/homeForum.css' />" rel="stylesheet" type="text/css">
		
		<!-------- CSS : Bootstrap -------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<!-- <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css"rel="stylesheet"> -->
		<link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
		
		<!-------- JS : Custom -------->
		<script src="<c:url value='/main/js/jquery-3.6.0.min.js' />"></script>
		<script src="<c:url value='/main/js/loadCalendar.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/homeForum.js' />" type="text/javascript"></script>
		
		<!-------- JS : Bootstrap -------->
	</head>
	<body>
		<div id="wrapper">
			<!-- Side Bar -->
			<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" />
	
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				<!-- Main Content -->
				<div id="content">
					<!-- Top Menu Bar  -->
					<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />
					
					<div class="container-fluid">
						<div class="row">
							<!-- 차트, 게시판 -->
							<div class="col-lg-12 col-xl-4">
								<!-- 차트 : 월별 통계 -->
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">월별 통계</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="chart-pie pt-4 pb-2">
											<canvas id="myPieChart"></canvas>
										</div>
										<div class="mt-4 text-center small">
											<span class="mr-2">
												<i class="fas fa-circle text-primary"></i>
												Direct
											</span>
											<span class="mr-2">
												<i class="fas fa-circle text-success"></i>
												Social
											</span>
											<span class="mr-2">
												<i class="fas fa-circle text-info"></i>
												Referral
											</span>
										</div>
									</div>
								</div>
								
								<!-- 게시판 : 최신글 -->
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">최신글</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div id="homePostBox" class="d-flex flex-column mb-1"> <!-- mb-1 : 임시 -->
											<div id="homeCategoryBox" class="d-flex">
												<div class="">최신글</div>
												<div class="">공지사항</div>
											</div>
											<!-- s
												(js 작성 필요)
												<div class="d-flex justify-content-around">
													<div class="forumCategoryName rounded">카테고리 명</div>
													<div class="forumTitle rounded">제목</div>
													<div class="forumWritor rounded">글쓴이</div>
												</div>
											 -->
										</div>
									</div>
								</div>
							</div>
							
							<!-- 달력 -->
							<div class="col-lg-12 col-xl-8">
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">{가계부 타이틀}</h6>
									</div>
									<div id="calendarBox" class="card-body">
										<!-- ajax -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-------- JS : Bootstrap, Custom -------->
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>
		
		<!-------- JS : Custom -------->
		<script src="<c:url value='/main/js/pieChart.js' />"></script>
	</body>
</html>