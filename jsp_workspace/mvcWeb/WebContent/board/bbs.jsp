<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>Welcome to mvcWeb</title>

<!--게시판만 적용되는 css-->
<style>
.table-striped>tbody>tr {
	background-color: rgba(255, 255, 255)
}

.row h2 {
	color: aliceblue;
}

.pagination-sm {
	margin: 0;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>

	<section>

		<div class="container">
			<div class="row">

				<h2>게시판 목록</h2>
				<table class="table table-striped"
					style="text-align: center; border: 2px solid #737373">
					<thead>
						<tr>
							<th style="background-color: #9DCAFF; text-align: center;">번호</th>
							<th style="background-color: #9DCAFF; text-align: center;">제목</th>
							<th style="background-color: #9DCAFF; text-align: center;">작성자</th>
							<th style="background-color: #9DCAFF; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="b" items="${boardList}">
							<tr>
								<td>${b.boardId}</td>
								<td>
									<a href="/mvcWeb/contentPage.board?bId=${b.boardId}&page=${param.page}&countPerPage=${param.countPerPage}">${b.title}</a>
								</td>
								<td>${b.writer}</td>
								<td>
									<fmt:formatDate value="${b.regDate}" pattern="yyyy/MM/dd a hh:mm"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>

				<div class="text-center">
					<ul class="pagination pagination-sm">
						
						<c:if test="${pc.prev}">
			                 <li class="page-item">
			                 	<a class="page-link"href="/mvcWeb/listPage.board?page=${pc.beginPage-1}&countPerPage=${pc.paging.countPerPage}">이전</a>
			                 </li>
			            </c:if>
			                 
		                <c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
		                	<li class="page-item">
								<a href="/mvcWeb/listPage.board?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link">${pageNum}</a>
							</li>
						</c:forEach>
			                 
		                <c:if test="${pc.next}">
			                 <li class="page-item">
			                 	<a class="page-link" href="/mvcWeb/listPage.board?page=${pc.endPage+1}&countPerPage=${pc.paging.countPerPage}">다음</a>
			                 </li>
	             		</c:if>
						
					</ul>
					<a href="/mvcWeb/writePage.board">
						<button class="btn btn-info pull-right">글쓰기</button>
					</a>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>