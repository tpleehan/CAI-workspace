<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<style>

/* ---------------------- 글상세 ---------------------- */
/* 타이틀 */
section.community-header {
	color: aliceblue;
	font-size: 30px;
	background-color: rgb(61, 58, 58);
	padding: 1em 0;
}
/* ---------- */
.board-content .board-content-body .t-title {
	padding: 14px 8px;
}

.board-content .board-content-body .t-control textarea {
	resize: none;
}

.board-content .content-button {
	text-align: right;
}

.content-reply .content-button {
	text-align: right;
}

section.board-content div form .button {
	text-align: right;
}

section.content-reply .reply-list .reply-prof {
	height: 40px;
	padding: 0;
	margin-bottom: 15px;
}

section.content-reply .reply-list .reply-prof>div {
	height: 40px;
	display: inline-block;
}

section.content-reply .reply-list .reply-prof img {
	width: 40px;
}

section.content-reply .reply-list .reply-prof .prof-name {
	font-size: 16px;
}

section.content-reply .reply-list .reply-prof .reply-date {
	font-size: 16px;
	margin-top: 8px;
}

section.content-reply .reply-list .reply-list-content textarea {
	margin: 0;
	overflow: visible;
	resize: none;
}

section.content-reply .reply-list .reply-list-content>div>a:nth-child(2),
	a:nth-child(3) {
	float: right;
}

section.content-reply .reply-form .reply-content textarea {
	margin: 20px 0 10px 0;
	resize: none;
}

section.content-reply .reply-form .content-button {
	margin-bottom: 200px;
}

</style>

<div id="wrapper">

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>질문 &amp; 답변</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="board-content">
		<div class="container">
			<div class="row">
				<div class="content-wrap col-md-12">
					<div class="board-content-body">
						<form action="#">
							<table class="table">
								<tbody class="t-control">
									<tr>
										<td class="t-title">글쓴이</td>
										<td><input type="text" class="form-control"
											value="${article.writer}" readonly></td>
									</tr>
									<tr>
										<td class="t-title">제목</td>
										<td><input type="text" class="form-control"
											value="${article.title}"></td>
									</tr>
									<tr>
										<td class="t-title">내용</td>
										<td><textarea class="form-control" rows="20">${article.content}</textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="button ">
								<button class="btn btn-dark">목록</button>
								<button class="btn btn-warning">수정</button>
								<button class="btn btn-danger">삭제</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</section>

	<section class="content-reply">
		<div class="container">
			<div class="row">
				<div class="reply-wrap col-md-12">
					<!-- 댓글 목록 공간 -->
					<div class="col-md-12 reply-list">
						<div class="reply-list-prof">
							<div class="col-md-12 reply-prof">
								<img class="prof-img" src="./img/proff.png" alt="prof">
								<div>
									<div class="prof-name">이름</div>
									<div class="reply-date">2022-02-01</div>
								</div>
							</div>
							<div class="reply-list-content">
								<div class="reply-group">
									<textarea class="form-control col-md-12" name="" id=""
										rows="auto">댓글
										</textarea>
									<a href="#"><span class="glyphicon glyphicon-pencil"></span>수정</a>
									<a href="#"><span class="glyphicon glyphicon-remove"></span>삭제</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 댓글 작성 공간 -->
					<div class="reply-form">
						<form action="#">
							<div class="col-md-12 reply-content">
								<textarea class="form-control" rows="4">댓글 작성 내용</textarea>
							</div>
							<div class="col-md-12 content-button">
								<button class="btn btn-primary">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</div>






