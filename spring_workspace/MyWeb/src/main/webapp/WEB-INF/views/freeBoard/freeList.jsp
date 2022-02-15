<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-9 col-xs-12 board-table">
				<div class="titlebox">
					<p>자유게시판</p>
				</div>
				<hr>

				<form action="<c:url value='/freeBoard/freeList' />">
					<div class="search-wrap clearfix">
						<button type="submit" class="btn btn-info search-btn">검색</button>
						<input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}"> 
						<select class="form-control search-select" name="condition">
							<option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
							<option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
							<option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
							<option value="titleContent" ${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
						</select>
					</div>
				</form>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th class="board-title">제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>수정일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="vo" items="${boardList}">
							<tr>
								<td>${vo.bno}</td>
								<td>
									<a href="<c:url value='/freeBoard/freeDetail?bno=${vo.bno}&pageNum=${pc.paging.pageNum}&keyword=${pc.paging.keyword}&condition=${pc.paging.condition}' />">${vo.title}</a>
									&nbsp;&nbsp;&nbsp;
									<c:if test="${vo.newMark}">
										<img alt="newMark" src="<c:url value='/img/icon_new.gif' />">
									</c:if>
								</td>
								<td>${vo.writer}</td>
								<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.regdate}"/>
								</td>
								<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.updatedate}"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<form action="<c:url value='/freeBoard/freeList' />" name="pageForm" >
					<div class="text-center clearfix">
						<hr>
						<ul class="pagination" id="pagination">
							
							<!-- 이전 버튼 -->
							<c:if test="${pc.prev}">
								<li>
									<a href="#" data-pageNum="${pc.beginPage - 1}">이전</a>
								</li>
							</c:if>
							
							<!-- 페이지 번호 버튼 -->
							<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
								<li class="${pc.paging.pageNum == num ? 'active' : ''}" >
									<a href="#" data-pageNum="${num}">${num}</a>
								</li>
							</c:forEach>
							
							<!-- 다음 버튼 -->
							<c:if test="${pc.next}">
								<li>
									<a href="#" data-pageNum="${pc.endPage + 1}">다음</a>
								</li>
							</c:if>
						</ul>
						
						<!-- 페이지 관련 버튼을 클릭 시 숨겨서 같이 보낼 값 -->
						<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
						<input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
						<input type="hidden" name="keyword" value="${pc.paging.keyword}">
						<input type="hidden" name="condition" value="${pc.paging.condition}">
						
						<button type="button" class="btn btn-info" onclick="location.href='<c:url value="/freeBoard/freeRegist"/>'">글쓰기</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>

<script>

	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
	/*
	 * 사용자가 페이지 관련 버튼을 클릭했을 때 각각의 a태그의 href에 각각 다른 url을 작성해서 요청을 보냈다.
	 * 해당 jsp에선 클릭한 그 버튼에 맞는 페이지 정보를 자바스크립트를 이용해서 요청을 보낸다.
	 */
	
	/*
	const pagination = document.getElementById('pagination');
	pagination.onclick = function(e) {
		e.preventDefault(); // 버튼의 고유이벤트 속성 중지
		
		// 현재 이벤트가 발생한 요소(버튼)의 data-pageNum의 값을 얻어서 변수에 저장
		const value = e.target.dataset.pagenum;
		
		// 페이지 버튼들을 감싸고 있는 form태그를 name으로 지목하여 
		// 해당 pageNum이라는 input태그의 value에 위에서 얻은 data-pageNum의 값을 삽입 후 submit
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
