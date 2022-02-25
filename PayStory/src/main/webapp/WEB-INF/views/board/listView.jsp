<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="PayStory 게시판 목록">
    <meta name="author" content="AourZ">
    <title>PayStory 게시판 목록</title>

    <!-- CSS : bootStrap -->
   	<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="<c:url value='/bootstrap/css/sb-admin-2.css'/>" rel="stylesheet">
    <link href="<c:url value='/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">

	 <!-- CSS : main -->
    <link href="<c:url value='/main/css/board/listView.css'/>" rel="stylesheet">
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
       
       <!-- Side Bar -->
       <jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp"  flush="true" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Top Menu Bar  -->
                <jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판</h1>

                    <!-- 게시판 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between">
                        	<!-- 게시판 header : 글쓰기 버튼, 카테고리, 검색 -->
                        	<nav class="nav boardCategory">
							  <a class="nav-link active" data-ctgNo="*">전체</a>
							  <a class="nav-link" data-ctgNo="ctgNotice">공지</a>
							  <a class="nav-link" data-ctgNo="ctgQA">질문</a>
							  <a class="nav-link" data-ctgNo="ctgInfo">정보공유</a>
							  <a class="nav-link" data-ctgNo="ctgFree">자유게시판</a>
							</nav>
                        	<a href="<c:url value='/board/write'/>" class="btn btn-primary" >글쓰기</a>	
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: hidden;">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                	<div class="row">
                                		<div class="col-sm-12">
                                			<table class="table table-bordered" id="dataTable">
			                                    <thead>
			                                        <tr>
			                                            <th>번호</th>
			                                            <th>카테고리</th>
			                                            <th>제목</th>
			                                            <th>작성자</th>
			                                            <th>조회</th>
			                                            <th>날짜</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    	<%-- <tr>
	        											<td><a href="<c:url value='/board/view'/>">1</a></td>
										        		<td>공지</td>
										        		<td><a href="<c:url value='/board/view'/>">공유가계부 사용방법</a></td>
										        		<td>관리자</td>
										        		<td>15</td>
										        		<td class="d-flex justify-content-between">
										        			2022-02-20
										        			<a href="<c:url value='/board/delete'/>"><i class="fa far fa-trash-alt"></i></a>
										        		</td>
													</tr>
			                                    	<tr>
	        											<td><a href="<c:url value='/board/view'/>">2</a></td>
										        		<td>공지</td>
										        		<td>영수증 AI 사용방법</td>
										        		<td>관리자</td>
										        		<td>100</td>
										        		<td>2022-02-20</td>
													</tr> --%>
				                                    <c:forEach var="list" items="${boardList}" varStatus="status">
			        									<tr class="boardList">
		        											<td><input type="hidden" value='${list.boardNo}'/>${status.count}</td>
											        		<td>${list.boardCategoryNo}</td>
											        		<td>${list.boardTitle}</td>
											        		<td>${list.memberNo}</td>
											        		<td>${list.boardViews}</td>
											        		<td>${list.boardDate}</td>
														</tr>
													</c:forEach>
			                                    </tbody>
			                                </table>                                		
                                		</div>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <jsp:include page="/WEB-INF/views/layout/logoutModal.jsp" flush="true"/>
    
    <!-- JS : Bootstrap -->
    <script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/js/sb-admin-2.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/vendor/datatables/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/js/demo/datatables-demo.js'/>"></script>
	
	<!-- JS : main -->
    <script src="<c:url value='/main/js/board/listView.js'/>"></script>
</body>
</html>