<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>

<title>Welcome to mvcWeb</title>

<!--글쓰기만 적용되는 css-->
<style>
.table-striped {
	text-align: center;
	border: 2px solid #737373;
}

.table-striped>tbody>tr {
	background-color: #f9f9f9
}
</style>
</head>

<body>
<%@ include file="../include/header.jsp"%>

<section>
	<div class="container" style="margin-top: 5%;">
		<div class="row">
			<form action="/mvcWeb/regist.board" method="post">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2"style="background-color: #9DCAFF; text-align: center;">게시판글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type="text" class="form-control"placeholder="작성자" name="bWriter" maxlength="50" value="${user.id}" readonly>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control"placeholder="글 제목" name="bTitle" maxlength="50">
							</td>
						</tr>
						<tr>
							<td>
								<textarea rows="15" class="form-control" placeholder="1000 글자 이하" name="bContent" maxlength="1000"></textarea>
							</td>
						</tr>
					</tbody>
				</table>


				<a href="/mvcWeb/listPage.board">
					<input type="button" class="btn btn-primary pull-left" value="목록">
				</a>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" onclick="return confirm('등록하시겠습니까?')">
			</form>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>

</body>
</html>