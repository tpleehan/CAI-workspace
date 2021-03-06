<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<title>Welcome to mvcWeb</title>

</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 col-sm-12 join-form">
					<h2>
						게시판 상세보기
					</h2>

					<form action="">
						<div class="form-group">
							<label>등록일</label> 
							<input type="text" class="form-control" value="${content.regDate}">
						</div>
						<div class="form-group">
							<label>글번호</label>
							<input type="text" class="form-control" value="${content.boardId}">
						</div>
						<div class="form-group">
							<label>글쓴이</label>
							<input type="text" class="form-control" value="${content.writer}">
						</div>
						<div class="form-group">
							<label>제목</label> 
							<input type="text" class="form-control" value="${content.title}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5">${content.content}</textarea>
						</div>

						<!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
						<div class="form-group">
							<button type="button" class="btn btn-success" onclick="location.href='/mvcWeb/listPage.board'">목록</button>
							<a href="/mvcWeb/modifyPage.board?bId=${content.boardId}" >
								<button type="button" class="btn btn-info">수정</button>
							</a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>