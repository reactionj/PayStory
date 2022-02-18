<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<div class="modal fade" id="receiptModal" tabindex="-1" role="dialog" aria-labelledby="receiptModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="receiptModalLabel">영수증 이미지</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					    	<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<img id="receiptImgModal" />
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>