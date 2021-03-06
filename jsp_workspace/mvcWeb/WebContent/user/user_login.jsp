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

<!--login만 적용되는 css-->
<style>
.table-striped>tbody>tr {
	background-color: #f9f9f9
}

.join-form {
	margin: 100px auto;
	padding: 20px;
	width: 50%;
	float: none;
	background-color: white;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-9 col-sm-12 join-form">
					<h2>로그인</h2>

					<form action="/mvcWeb/login.user" method="post">
						<div class="form-group">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" name="id" placeholder="아이디">
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password" name="pw" placeholder="비밀번호 ">
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-lg btn-info btn-block">로그인</button>
						</div>

						<div class="form-group">
							<a href="/mvcWeb/joinPage.user">
								<button type="button" class="btn btn-lg btn-success btn-block">
										회원가입
								</button>
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