<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<style>

/* ---------------------- 멘토링 ---------------------- */
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

.mentoring-search {
	padding: 0;
}

div.mentoring {
	border: 1px rgb(216, 191, 191) solid;
	margin-top: 10px;
	padding: 10px;
}

ul.mentoring-body>li {
	padding: 10px;
}

ul.mentoring-body .prod-list-inner {
	border: 1px rgb(216, 191, 191) solid;
	padding: 10px;
}

section.mentoring-bottom .pagination-list {
	text-align: center;
}
</style>

<div id="wrapper">

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<h2>멘토링</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="community-body">
		<div class="container">
			<div class="row">
				<div class="list-group menulist col-md-2">
					<a href="<c:url value='/lecture/mentoringPage' />"
						class="list-group-item active">전체 강의</a> <a
						href="<c:url value='/lecture/mentoringPage?categoryNum=${pc.paging.categoryNum = 1 }' />"
						class="list-group-item" name="catergoryNum"> 프로그래밍</a> <a
						href="<c:url value='/lecture/mentoringPage?categoryNum=${pc.paging.categoryNum = 2 }' />"
						class="list-group-item">요리</a> <a
						href="<c:url value='/lecture/mentoringPage?categoryNum=${pc.paging.categoryNum = 3 }' />"
						class="list-group-item">여행</a> <a
						href="<c:url value='/lecture/mentoringPage?categoryNum=${pc.paging.categoryNum = 4 }' />"
						class="list-group-item">DIY</a>
				</div>

				<div class="mentoring-search col-md-10">
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
								<a class="btn btn-success" href="/lecture/mentoringWrite"
									role="button">글쓰기</a>
							</div>
						</form>
					</div>
				</div>

				<div class="mentoring col-md-10">
					<ul class="mentoring-body">
						<c:forEach var="vo" items="${mentoringList}">
							<li class="col-md-3">
								<div class="prod-list-inner">
									<div class="prod-content">
										<div class="prod-info">
											<a href="<c:url value='/lecture/mentoringDetail?mentoringNo=${vo.mentoringNo}&pageNum=${pc.paging.pageNum}&keyword=${pc.paging.keyword}&condition=${pc.paging.condition}' />">
												${vo.mentoringTitle} </a>
										</div>
										<div class="prod-writer">
											<p>${vo.userName}</p>
										</div>
										<div class="create-date">
											<p>${vo.mentoringCreateDate}</p>
										</div>
									</div>
									<div class="price">
										<strong>${vo.mentoringPrice}</strong>
									</div>
									<div class="mentoring-like">
										<a class="btn btn-info" href="#" role="button">내용보기</a>
										<div class="lec-like">
											<span class="lec-heart"><button type="button"
													class="glyphicon glyphicon-heart">${vo.mentoringLike}</button></span>
											<span class="lec-like-span">좋아요</span>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>



	<section class="mentoring-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<nav class="col-md-10 pagination-list">
					<form action="<c:url value='/lecture/mentoringPage' />"
						name="pageForm">
						<div>
							<hr>
							<ul class="pagination" id="pagination">
								<c:if test="${pc.prev}">
									<li><a href="#" data-pageNum="${pc.beginPage-1}">이전</a></li>
								</c:if>

								<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
									<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a
										href="#" data-pageNum="${num}">${num}</a></li>
								</c:forEach>

								<c:if test="${pc.next}">
									<li><a href="#" data-pageNum="${pc.endPage+1}">다음</a></li>
								</c:if>
							</ul>

							<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
							<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
							<input type="hidden" name="countPerPage"
								value="${pc.paging.countPerPage}"> <input type="hidden"
								name="keyword" value="${pc.paging.keyword}"> <input
								type="hidden" name="condition" value="${pc.paging.condition}">
						</div>
					</form>
				</nav>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</div>

<script>
	const msg = '${msg}';
	if (msg !== '') {
		alert(msg);
	}

	//사용자가 페이지 관련 버튼을 클릭했을 때, 기존에는 각각의 a태그의 href에 
	//각각 다른 url을 작성해서 요청을 보내줬다면, 이번에는 클릭한 그 버튼에 맞는 페이지 정보를
	//자바스크립트를 이용하여 끌고 와서 요청을 보내 주겠습니다.
	/*
	const pagination = document.getElementById('pagination');
	pagination.onclick = function(e) {
		e.preventDefault(); //버튼의 고유이벤트 속성 중지.
		
		//현재 이벤트가 발생한 요소(버튼)의
		//data-pageNum의 값을 얻어서 변수에 저장.
		const value = e.target.dataset.pagenum;
		
		//페이지 버튼들을 감싸고 있는 form태그를 name으로 지목하여
		//그 안에 있는 pageNum이라는 input태그의 value에
		//위에서 얻은 data-pageNum의 값을 삽입 후 submit
		document.pageForm.pageNum.value = value;
		document.pageForm.submit();
	}
	 */

	$(function() {
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('pagenum');
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
	});
</script>




