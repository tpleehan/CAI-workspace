<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>


<style>

/* ======== lecture ======== */
.lec-search-wrap {
	width: 100%;
	float: right;
	margin-bottom: 20px;
}

.search2-btn {
	float: right;
}

.lec-search-wrap>input {
	width: 30%;
	float: right;
}

#lec-wrap {
	margin: 0 auto;
}

#lec-sec {
	margin: 0;
	width: 950px;
}

.lecture {
	margin: 0 auto;
}

.menulist {
	margin: 0;
	margin-bottom: 10px;
}

#lec-ul {
	width: 100%;
}

.lec-head {
	display: inline-block;
}

#adm-ul {
	margin-right: 0;
}

.adm-btn {
	width: 50px;
	height: 40px;
	border-radius: 10%;
	float: right;
}

.lec-dropdown {
	float: right;
	margin-top: 30px;
}

.lec-dropdown>a {
	text-align: center;
}

/* ========== lecture-board(강의 게시판) ========== */
.lec-list-inner img {
	width: 100%;
}

.lec-content {
	padding: 15px 0;
}

.lec-content .lec-info span {
	display: block;
}

.lec-content .lec-info {
	float: left;
}

.lec-content .lec-price {
	float: right;
}

.lec-like {
	width: 100%;
}

.lec-like-span {
	float: left;
}

.lec-heart {
	color: red;
	float: right;
}

.lec-list-inner:hover {
	opacity: 0.5;
}

.time {
	opacity: 0.5;
}

.pagination {
	margin: 0; /*페이지 네이션의 기본 마진 0*/
}
</style>







<div class="wrapper" id="lec-frame">


	<div class="container clearfix" id="lec-wrap">

		<hr>
		<div class="lecture">
			<div class="list-group menulist col-md-2">
				<a href="#" class="list-group-item active">전체 강의</a> <a href="#"
					class="list-group-item">프로그램밍</a> <a href="#"
					class="list-group-item">요리</a> <a href="#" class="list-group-item">여행</a>
				<a href="#" class="list-group-item">DIY</a>
			</div>




			<div class="lecture_list col-md-10">

				<div class="lec-search-wrap clearfix">
					<button type="submit" class="btn btn-info search2-btn">검색</button>
					<input type="text" class="form-control search2-input"
						placeholder="강의명을 입력해주세요...">

				</div>


				<hr>




				<div class="row">

					<section>
						<div class="container" id="lec-sec">

							<ul class="row" id="lec-ul">
								<h2 class="lec-head">전체 강의</h2>


								<div class="dropdown lec-dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
										정렬 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="dropdownMenu1">
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">별점순</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">가격순</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">시간순</a></li>

									</ul>
								</div>
							</ul>

							<ul class="row" id="adm-ul">
								<a href="<c:url value='/lecture/lectureWrite' /> "><button
										type="button" class="adm-btn btn-primary">글쓰기</button></a>
								<button type="button" class="adm-btn btn-danger">삭제</button>

							</ul>


							<hr>

							<ul class="row">
								<c:forEach var="vo" items="${lectureList}">
									<li class="col-md-3 col-sm-6 col-xs-12"><input
										type="checkbox" class="lec-check"> 
										<a href="<c:url value='/lecture/lectureDetail?lectureNo=${vo.lectureNo}&pageNum=${pc.paging.pageNum }&keyword=${pc.paging.keyword }&condition=${pc.paging.condition }' />">
											<div class="lec-list-inner">
												<img src="<c:url value='/lecture/lectureDisplay?thumbnailFileLoca=${vo.thumbnailFileLoca}&thumbnailFilename=${vo.thumbnailFilename}' />">
												<div class="lec-content clearfix">
													<div class="lec-info">
														<span>${vo.lectureTitle}</span> <span>${vo.userNo}</span> <span>별점칸</span>
														<br> <span class="time">${vo.lectureCreateDate }</span>
													</div>
													<div class="lec-price">
														<strong>${vo.lecturePrice }</strong>
													</div>
												</div>
											</div>
										</a>

										<div class="lec-like clearfix">
											<span class="lec-like-span">종아요</span> <span
												class="lec-heart"><button type="button"
													class="glyphicon glyphicon-heart">${vo.lectureLike}</button></span>
										</div></li>
								</c:forEach>


							</ul>
							<!--ul close-->


							<form action="<c:url  value='/lecture/lecturePage' />"
								name="pageForm">
								<!-- 페이지네이션 -->
								<div class="text-center clearfix">
									<hr>
									<ul class="pagination" id="pagination">
										<!-- 자바 스크립트에서 지목하기 위해서 -->
										<!--페이지 이전 버튼 -->
										<c:if test="${pc.prev}">
											<li><a href="#" data-pageNum="${pc.beginPage-1}">이전</a></li>
										</c:if>

										<!-- 페이지 번호 버튼 -->
										<c:forEach var="num" begin="${pc.beginPage}"
											end="${pc.endPage}">
											<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a
												href="#" data-pageNum="${num}">${num} </a></li>
										</c:forEach>


										<!-- 페이지 다음 버튼 -->
										<c:if test="${pc.next}">
											<li><a href="#" data-pageNum="${pc.endPage+1 }"> 다음</a></li>
										</c:if>
									</ul>

									<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
									<input type="hidden" name="pageNum"
										value="${pc.paging.pageNum}"> <input type="hidden"
										name="countPerPage" value="${pc.paging.countPerPage}">
									<input type="hidden" name="keyword"
										value="${pc.paging.keyword}"> <input type="hidden"
										name="condition" value="${pc.paging.condition}">


								</div>

							</form>



						</div>
						<!-- container close-->
					</section>

				</div>
				<!-- 전체강의 row-->


			</div>
			<!-- lecture-list clsoe-->

		</div>
		<!-- lecture close-->


	</div>
	<!-- lec-wrap close -->

</div>
<!-- wrap close-->



<%@ include file="../include/footer.jsp"%>


<script>


const msg = '${msg}';
if(msg != ''){
	alert(msg);
}


//사용자가 페이지 관련 버튼을 클릭했을 때, 기존에는 각각의 a태그의 href에
//각각 다른 url을 작성해서 요청을 보내줬다면, 이번에는 클릭한 그 버튼에 맞는 페이지 정보를 
//자바 스크립트를 이용하여 끌고 와서 url 요청을 보내줍니다.


const pagination = document.getElementById('pagination');
pagination.onclick = function(e) {
	e.preventDefault(); //버튼의 고유이벤트 속성 중지.
	
	//현재 이벤트가 발생한 요소(버튼)의
	//data-pageNum의 값을 얻어서 변수에 저장
	//pageNum이지만 소문자로 써서 pagenum을 넣어줘야 한다.
	const value = e.target.dataset.pagenum;
	
	//페이지 버튼들을 감싸고 있는 form태그를 name으로 지목하여
	//그 안에 있는 pageNum이라는 input태그의 value에
	//위에서 얻은 data-pageNum의 값을 삽입 후 submit
	document.pageForm.pageNum.value = value;
	document.pageForm.submit();
}


 






</script>

