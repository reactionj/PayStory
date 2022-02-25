<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<!-------- CSS-------->
<link href="<c:url value='/main/css/member/profile.css'/>"
	rel="stylesheet" type="text/css">
<!-------- JS-------->
<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
<script src="<c:url value='/main/js/member/infoView.js'/>"></script>

</head>
<body>
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로필수정</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<form action="/member/updateImg" method="post"
					enctype="multipart/form-data">
					<div class="imageBox">
						<ul>
							<li><a>
									<div class="screen" onclick="onclick=document.all.file.click()">
										<div class="imageTextTop">프로필 이미지 수정</div>
										<div class="imageTextBottom">클릭해주세요</div>
										<img class="profile" src="/images/${login.memberImage}">
									</div> 
									<input type="file" name="file" style="display: none">
									<input type="hidden" name="memberEmail" id="memberEmail" value="${login.memberEmail}">
									<button type="submit" class="btn btn-primary btn-block" id="imgC">사진변경</button>
							</a></li>
						</ul>
					</div>
				</form>
				<form id="infoView" action="/member/infoUpdate" method="POST"
					class="form-signup form-user panel-body" autocomplete="off">
					<input type="hidden" id="memberNameCheck" name="memberNameCheck"
						value="N" />
					<fieldset>
						
						<!-- 이메일, 닉네임 -->
						<div class="form-group">
							<label class="control-label" for="fullName">이메일</label> <input
								type="text" name="memberEmail" class="form-control input-sm"
								value="${login.memberEmail}" id="memberEmail" readonly>
						</div>
						<div class="form-group">
							<label class="control-label" for="nickname">닉네임</label> <a
								href="#" class="btn btn-outline-dark btn-icon-split"
								style="text-align: center;" onclick="duplicate(); return false;">
								<span class="icon text-white-30"> <i class="fas fa-check"></i>
							</span> <span class="text">중복체크</span>
							</a> <input type="text" name="memberName"
								class="form-control input-sm" placeholder="닉네임"
								value="${login.memberName}" id="memberName">
						</div>
					</fieldset>
					<button class="btn btn-primary btn-block" type="button"
						onclick="fnSubmit(); return false;">정보 수정</button>
				</form>
				<div class="card-body">
					<a href="<c:url value='/member/pwUpdateView'/>"
						class="btn btn-info btn-block">비밀번호 변경</a> 
					<%-- <a href="<c:url value='/member/memberDelete'/>" class="btn btn-default btn-block">회원 탈퇴</a> --%>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>