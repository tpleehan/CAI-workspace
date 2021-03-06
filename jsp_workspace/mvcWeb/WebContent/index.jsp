<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Welcome to mvcWeb</title>


<!--메인만 적용되는 css영역-->
<style>
body {
	background-image: url(images/main.jpg);
	background-repeat: no-repeat;
	background-size: cover
}
</style>
</head>

<body>

	<%@ include file="include/header.jsp"%>
	<section>

		<div class="container" id="mainCon">
			<div class="jumbotron" id="jbDiv">
				<div class="container" id="introArea">
					<h1>게시판 사이트</h1>
					<p style="font-size: 40px;">이 한  이혜원  이희애</p>
					<p>이   한 : 홈, 회원가입, 로그인</p>
					<p>이혜원 : 게시판 (게시글 작성, 수정, 삭제, 목록, 상세보기)</p>
					<p>이희애 : 회원정보 (회원 정보 수정, 탈퇴, 회원 작성 게시글 목록) </p>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="include/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>

</html>

