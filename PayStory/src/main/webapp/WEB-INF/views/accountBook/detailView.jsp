<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory</title>
		
		<%-------- CSS : Custom --------%>
		<link href="<c:url value='/main/css/accountBook/calendar.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/chart.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/detailView.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/detailViewList.css' />" rel="stylesheet" type="text/css">
		
		<%-------- CSS : Bootstrap --------%>
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
		
		<%-------- JS : Custom ------%>
		<script src="<c:url value='/main/js/accountBook/calendarEtc.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/accountBook/detailViewCalendar.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/calendarAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/chartAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/detailViewListAjax.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div id="wrapper">
			<%-- Side Bar --%>
			<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" />
	
			<%-- Content Wrapper --%>
			<div id="content-wrapper" class="d-flex flex-column">
				<%-- Main Content --%>
				<div id="content">
					<%-- Top Menu Bar  --%>
					<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />
					
					<div class="container-fluid">
						<div class="row">
							<%-- 달력, 차트 --%>
							<div class="col-lg-12 col-xl-4">
								<%-- 달력 --%>
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div class="card-header p-3">
										<div id="calendarBtnBox" class="d-flex justify-content-between mr-3 ml-3">
											<div id="prevNextBox" class="d-flex justify-content-between align-items-center">
												<i id="prevMonthBtn" class="fas fa-angle-left fa-lg pointer-cursor"></i>
												<h6 id="yearMonth" class="font-weight-bold text-primary m-0 mr-3 ml-3"></h6>
												<i id="nextMonthBtn" class="fas fa-angle-right fa-lg pointer-cursor"></i>
											</div>
											<div id="otherBtnBox" class="d-flex align-items-center">
												<i id="todayBtn" class="far fa-calendar fa-lg pointer-cursor"></i>
											</div>
										</div>
									</div>
									<%-- Card Body --%>
									<div id="calendarDateBox" class="card-body">
										<%-- ajax --%>
									</div>
								</div>
								
								<%-- 차트 : 일일 통계 --%>
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div class="card-header p-3">
										<input type="hidden" id="chartType" value="d">
										<h6 class="m-0 font-weight-bold text-primary">일일 통계</h6>
									</div>
									<%-- Card Body --%>
									<div class="card-body">
										<div class="d-flex justify-content-between">
											<div id="chartMainTagBox" class="d-flex">
												<div id="chartTab1" class="pointer-cursor chartTab selected">수입</div>
												<div id="chartTab2" class="pointer-cursor chartTab">지출</div>
											</div>
											<div id="budgetStatusBox" class="d-none">
												<div class="row">
													<div class="col-6">당월 예산 :&nbsp;</div>
													<div class="col-6">
														<fmt:formatNumber value="${budget}" pattern="#,###" />
													</div>
												</div>
												<div class="row">
													<div class="col-6">남은 예산 :&nbsp;</div>
													<div class="col-6">
														<c:set var="remainingBudget" value="${budget + incomeTotalAmount - expenditureTotalAmount}" />
														<fmt:formatNumber value="${remainingBudget}" pattern="#,###" />
													</div>
												</div>
												<div class="row">
													<div class="col-6">총 수입금 :&nbsp;</div>
													<div class="col-6">
														<fmt:formatNumber value="${incomeTotalAmount}" pattern="#,###" />
													</div>
												</div>
												<div class="row">
													<div class="col-6">총 지출금 :&nbsp;</div>
													<div class="col-6">
														<fmt:formatNumber value="${expenditureTotalAmount}" pattern="#,###" />
													</div>
												</div>
											</div>
											<i class="budgetStatusBoxToggle fas fa-info-circle pointer-cursor"></i>
										</div>
										<div id="chartBox">
											<%-- ajax --%>
										</div>
									</div>
								</div>
							</div>
							
							<%-- 일일 상세 내역 --%>
							<div class="col-lg-12 col-xl-8">
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div class="card-header d-flex justify-content-between p-3">
										<h6 class="m-0 font-weight-bold text-primary">{년월일}</h6>
										<c:if test="${isShared eq true}">
											<i class="fas fa-user-friends fa-lg pointer-cursor"></i>
											<%-- 
												소유자, 참여자 표시
											 --%>
										</c:if>
									</div>
									<div id="detailViewListBox" class="card-body d-flex flex-column align-items-center">
										<%-- ajax --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
	</body>
</html>