<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
					<li>
						<a href="#" class="lecture-link">
							<img src="./img/java.png" alt="java">
							<span>강의 제목: 자바 참 쉽다!</span>
							<span>강사(닉네임): 중앙학원</span>
							<span>가격: ￦55,000원</span>
							<span>할인가격: 무료</span>
						</a>
					</li>
					<li>
						<a href="#" class="lecture-link">
							<img src="./img/python.png" alt="java">
							<span>강의 제목: 파이썬 어려워</span>
							<span>강사(닉네임): 홍길동</span>
							<span>가격: ￦35,000원</span>
							<span>할인가격: ￦1,000원</span>
						</a>
					</li>
					<li>
						<a href="#" class="lecture-link">
							<img src="./img/css.png" alt="java">
							<span>강의 제목: CSS 배워볼까!</span>
							<span>강사(닉네임): 김철수</span>
							<span>가격: ￦55,000원</span>
						</a>
					</li>
					<li>
						<a href="#" class="lecture-link">
							<img src="./img/spring.png" alt="java">
							<span>강의 제목: 스프링 배우기</span>
							<span>강사(닉네임): 김뽀삐</span>
							<span>가격: ￦75,000원</span>
							<span>할인가격: 무료</span>
						</a>
					</li>
					<li>
						<a href="#" class="lecture-link">
							<img src="./img/html.png" alt="java">
							<span>강의 제목: 웹 개발</span>
							<span>강사(닉네임): 김아무개</span>
							<span>가격: ￦15,000원</span>
						</a>
					</li>

				</ul>
			</div>

			<div class="row">
				<div class="notice">
					<h2>공지사항</h2>
				</div>
				<div class="notice-info">
					<div class="notice-title">
						<h2>공지 제목: 공지사항 제목1</h2>
					</div>
					<div class="notice-content">
						<h3>공지 내용:</h3>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ac tincidunt justo. Aenean aliquet metus sed sem
							bibendum, quis ornare mi feugiat. Nulla lobortis metus sit amet arcu dapibus, a condimentum velit ullamcorper.
							Mauris et commodo dui. Aenean sodales elementum erat quis egestas. Duis sed lorem lacus. Duis varius consequat
							rutrum. Nulla facilisi.
							Donec finibus eu lectus ut ornare. Aenean vel ullamcorper lectus, et faucibus libero. Nullam mollis eros in magna
							sodales vulputate. Duis in tincidunt magna, sit amet cursus sem. Fusce condimentum aliquam ipsum non bibendum.
							Nullam eu ante turpis. Nam tincidunt volutpat dictum. Sed sed felis id nisl semper ultrices ut et sapien. Nunc
							egestas, leo quis fermentum blandit, elit nisi fringilla arcu, in tincidunt turpis justo sed velit. Praesent
							tempus risus quis gravida venenatis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						</p>
					</div>
				</div>
			</div>
		</div>

	</section>
	
	<%@ include file="include/footer.jsp" %>
</div>
