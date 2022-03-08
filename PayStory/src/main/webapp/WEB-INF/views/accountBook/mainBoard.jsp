<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<body>
		<c:choose>
			<c:when test="${empty boardList}">
				<span>게시글이 존재하지 않습니다.</span>
			</c:when>
			<c:otherwise>
				<div class="postBox">
					<div class="table mb-0">
						<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12">
									<table class="table mb-0">
										<tbody class="postList">
											<c:forEach var="board" items="${boardList}">
												<c:choose>
													<%-- @@@@@@(임시) 조건에 카테고리 명 변경 필요 -> 공지사항  --%>
													<c:when test="${board.boardCategoryName eq 'bc001'}">
														<tr class="postItem pointer-cursor">
															<input type="hidden" value="${board.boardNo}" />
															<td class="border-color-white p-1 w-75 text-left">${board.boardTitle}</td>
															<td class="border-color-white p-1 w-25 text-right">${board.memberName}</td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr class="postItem pointer-cursor">
															<input type="hidden" value="${board.boardNo}" />
															<td class="border-color-white p-1 w-20 text-left">${board.boardCategoryName}</td>
															<td class="border-color-white p-1 w-60 text-left">${board.boardTitle}</td>
															<td class="border-color-white p-1 w-20 text-right">${board.memberName}</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</body>
</html>