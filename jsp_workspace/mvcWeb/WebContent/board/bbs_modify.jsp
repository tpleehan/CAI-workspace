<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/mvcWeb/css/bootstrap.css">
<link rel="stylesheet" href="/mvcWeb/css/custom.css">

<title>Welcome to mvcWeb</title>

</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 col-sm-12 join-form">
					<h2>게시판 수정</h2>

					<form action="/mvcWeb/update.board" method="post">
						<input type="hidden" name="bId" value="${content.boardId}">
						<div class="form-group">
							<label>글번호</label>
							<input type="text" class="form-control" name="bId" value="${content.boardId}" readonly>
						</div>
						<div class="form-group">
							<label>글쓴이</label>
							<input type="text" class="form-control" name="bWriter" value="${content.writer}" readonly>
						</div>
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" name="bTitle" value="${content.title}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5" name="bContent">${content.content}</textarea>
						</div>

						<!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
						<div class="form-group">
							<button type="button" class="btn btn-success">목록</button>
							<button type="submit" class="btn btn-info" onclick="return confirm('수정하시겠습니까?')">수정</button>
							<a href="/mvcWeb/delete.board?bId=${content.boardId}">
								<button type="button" class="btn btn-default" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
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