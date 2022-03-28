<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="wrapper">
	<%@ include file="include/header.jsp" %>
	<section>
		<!-- 슬라이드(캐러셀) 구현 -->
		<div class="container">
			<div class="container-fluid">
				<div class="row">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="./img/slide1.gif" alt="slide1">
							</div>
							<div class="item">
								<img src="./img/slide2.png" alt="slide2">
							</div>
							<div class="item">
								<img src="./img/slide3.gif" alt="slide3">
							</div>
						</div>
						
						<!-- Controls -->
						<!-- 좌, 우 화살표 -->
						<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>

	</section>

	<!-- 추천강의 배치 -->
	<section>
		<div class="container">
			<div class="row">
				<div class="recommended-lecture">
					<h2>추천강의</h2>
				</div>
			</div>

			<div class="row">
				<ul class="recommended-lecture-list">
					<c:forEach var="vo" begin="1" items="${lectureList}" end="4">
						<li>
							<a href="<c:url value='/lecture/lectureDetail?lectureNo=${vo.lectureNo}&pageNum=1&keyword=${pc.paging.keyword }&condition=${pc.paging.condition }' />">
								<img src="<c:url value='/lecture/lectureDisplay?thumbnailFileLoca=${vo.thumbnailFileLoca}&thumbnailFilename=${vo.thumbnailFilename}' />">
								<span>강의 제목: ${vo.lectureTitle}</span>
								<span>강사(닉네임): ${vo.userNo}</span>
								<span>가격: ￦<fmt:formatNumber value="${vo.lecturePrice}" pattern="#,###" /></span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>

			<div class="row">
				<div class="notice-div">
					<div class="notice">
						<h4>공지사항</h4>
					</div>
					<ul class="notice-list">
						<li class="notice-item">
							<a href="#" class="notice-link">
								<div class="notice-info">
									<div class="notice-name">공지사항 제목 길게 길게 공지사항 제목 길게 길게 공지사항 제목 길게 길게 공지사항 제목 길게 길게 공지사항 제목 길게 길게 </div>
									<div class="notice-date">2022.03.25</div>
								</div>
							</a>
						</li>
						<li class="notice-item">
							<a href="#" class="notice-link">
								<div class="notice-info">
									<div class="notice-name">공지사항 제목 길게 길게 공지사항 제목 길게 길게 공지사항 제목 길게 길게 공지사항 제목 길게 길게 공지사항 제목 길게 길게 </div>
									<div class="notice-date">2022.03.25</div>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

	</section>
	
	<%@ include file="include/footer.jsp" %>
</div>
