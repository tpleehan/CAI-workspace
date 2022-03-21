<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<style>

/* ---------------------- 자유게시판 ---------------------- */
/* 타이틀 */
section.community-header {
	color: aliceblue;
	font-size: 30px;
	background-color: rgb(61, 58, 58);
	padding: 1em 0;
}
/* ---------- */
/* 메뉴 */
section.community-body nav.community-body-nav ul h6 {
	color: purple;
	font-size: 16px;
	margin: 40px 0;
}

section.community-body nav.community-body-nav ul li {
	margin: 20px 0;
}

section.community-body nav.community-body-nav ul li span {
	color: plum;
	font-size: 20px;
}
/* ---------- */
.community-body-content {
	padding: 0;
}

.community-body .search-text {
	margin-top: 40px;
}

.community-body .search-text .form-group {
	margin: 0;
}

.community-body .community-body-write .write {
	padding: 0;
	text-align: right;
}

.community-body .community-body-content-list .table {
	margin-top: 120px;
}

.community-body .community-body-content-list .board-head th {
	text-align: center;
}

.community-body .community-body-content-list .board-body .board-likeDate
	{
	text-align: center;
}

.community-body .community-body-content .pagination-list {
	text-align: center;
}

</style>

<div id="wrapper">

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<h2>질문 &amp; 답변</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="community-body">
		<div class="container">
			<div class="row">
				<nav class="community-body-nav col-md-2">
					<ul class="">
						<h6 class="">Dreams Come True</h6>
						<li class=""><a href="#"><span>공지사항</span></a></li>
						<li class=""><a href="#"><span>사이트 소개</span></a></li>
					</ul>
					<ul class="">
						<h6 class="">커뮤니티</h6>
						<li class=""><a href="<c:url value='/qnaBoardList' />" class=""><span>질문 &amp; 답변</span></a></li>
						<li class=""><a href="<c:url value='/freeBoardList' />" class=""><span>자유게시판</span></a></li>
					</ul>
					<ul class="">
						<h6 class="">후기</h6>
						<li class=""><a href="#"><span>수강평</span></a></li>
						<li class=""><a href="#"><span>멘토링 후기</span></a></li>
					</ul>
				</nav>

				<div class="community-body-content col-md-10">
					<div class="search-text">
						<form action="#">
							<div class="col-md-2"></div>
							<div class="form-group col-md-2">
								<select id="condition" class="form-control" name="condition">
									<option value="title"
										${param.condition=='title' ? 'selected' : '' }>제목</option>
									<option value="content"
										${param.condition=='content' ? 'selected' : '' }>내용</option>
									<option value="writer"
										${param.condition=='writer' ? 'selected' : '' }>작성자</option>
									<option value="titleContent"
										${param.condition=='titleContent' ? 'selected' : ''
											}>제목+내용</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<div class="input-group">
									<input type="text" class="form-control" name="keyword"
										id="keywordInput" placeholder="검색어" value=""> <span
										class="input-group-btn"> <input type="submit"
										value="검색" class="btn btn-cpp btn-flat" id="searchBtn">
									</span>
								</div>
							</div>
							<div class="col-md-2"></div>
							<div class="col-md-2"></div>
						</form>
					</div>

					<div class="community-body-write">
						<form action="#">
							<div class="col-md-10"></div>
							<div class="write col-md-2">
								<a class="btn btn-success" href="#" role="button">글쓰기</a>
							</div>
						</form>
					</div>

					<div class="community-body-content-list">
						<table class="table table-hover">
							<thead class="board-head">
								<tr class="active">
									<th class="col-md-6">제목</th>
									<th class="col-md-2">글쓴이</th>
									<th class="col-md-2">좋아요 수</th>
									<th class="col-md-2">날짜</th>
								</tr>
							</thead>
							<tbody class="board-body">
								<tr>
									<td><a href="#">어렵다</a></td>
									<td>홍길동</td>
									<td class="board-likeDate">1</td>
									<td class="board-likeDate">2022-03-07</td>
								</tr>
								<tr>
									<td><a href="#">어려워</a></td>
									<td>김철수</td>
									<td class="board-likeDate">6</td>
									<td class="board-likeDate">2022-03-03</td>
								</tr>
								<tr>
									<td><a href="#">정말로</a></td>
									<td>고영희</td>
									<td class="board-likeDate">30</td>
									<td class="board-likeDate">2022-03-01</td>
								</tr>
							</tbody>
						</table>
					</div>


					<nav class="pagination-list">
						<ul class="pagination">
							<li><a href="#">이전</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">다음</a></li>
						</ul>
					</nav>

				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</div>

