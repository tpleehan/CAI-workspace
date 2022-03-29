<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<style>

/* ---------------------- 공지사항 ---------------------- */
/* 타이틀 */
section.community-header {
    color: aliceblue;
    font-size: 30px;
    background-color: rgb(226, 188, 106);
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

.community-body .community-body-content-list .board-body .board-viewDate
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
					<h2>공지사항</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="community-body">
		<div class="container">
			<div class="row">
				<nav class="community-body-nav col-md-2">
                    <ul class="">
                        <h6>Dreams Come True</h6>
                        <li><a href="<c:url value='/notice/noticeList' />"><span>공지사항</span></a></li>
                        <li><a href="<c:url value='/notice/introduce' />"><span>사이트 소개</span></a></li>
                    </ul>
                    <ul>
                        <h6>강의</h6>
                        <li><a href="<c:url value='/lecture/lecturePage' />"><span>전체 강의</span></a></li>
                        <li><a href="<c:url value='/lecture/lectureEva' />"><span>수강평</span></a></li>
                    </ul>
                    <ul>
                        <h6>커뮤니티</h6>
                        <li><a href="<c:url value='/board/freeBoardList' />"><span>자유게시판</span></a></li>
                        <li><a href="<c:url value='/notice/frequentqna' />"><span>자주묻는 질문</span></a></li>
                    </ul>
                </nav>

				<div class="community-body-content col-md-10">
					<div class="search-text">
						<form action="<c:url value='/notice/noticeList' />">
							<div class="col-md-2"></div>
							<div class="form-group col-md-2">
								<select id="condition" class="form-control" name="condition">
									<option value="title"
										${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
									<option value="content"
										${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
									<option value="writer"
										${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
									<option value="titleContent"
										${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<div class="input-group">
									<input type="text" class="form-control" name="keyword"
										value="${pc.paging.keyword}"> <span
										class="input-group-btn">
										<button type="submit" class="btn btn-cpp btn-flat">
											검색</button>
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
								<button type="button" class="btn btn-success"
									onclick="location.href='<c:url value="/board/freeBoardRegist" />'">글쓰기</button>
							</div>
						</form>
					</div>

					<div class="community-body-content-list">
						<table class="table table-hover">
							<thead class="board-head">
								<tr class="active">
									<th class="col-md-10">제목</th>
									<th class="col-md-2">날짜</th>
								</tr>
							</thead>
							<tbody class="board-body">
								<c:forEach var="vo" items="${noticeList}">
									<tr>
										<td><a
											href="<c:url value='/notice/noticeDetail?bno=${vo.noticeNo}&pageNum=${pc.paging.pageNum}&keyword=${pc.paging.keyword}&condition=${pc.paging.condition}' />">
												${vo.noticeTitle} </a></td>
										<td><fmt:formatDate value="${vo.noticeCreateDate}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<nav class="pagination-list">
						<form action="<c:url value='/notice/noticeList' />"
							name="pageForm">
							<div>
								<hr>
								<ul class="pagination" id="pagination">
									<c:if test="${pc.prev}">
										<li><a href="#" data-pageNum="${pc.beginPage-1}">이전</a></li>
									</c:if>

									<c:forEach var="num" begin="${pc.beginPage}"
										end="${pc.endPage}">
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
