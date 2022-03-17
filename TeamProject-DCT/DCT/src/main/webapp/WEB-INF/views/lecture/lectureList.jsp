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
								<a href="<c:url value='/lecture/lectureUpload' /> "><button
										type="button" class="adm-btn btn-primary">글쓰기</button></a>
								<button type="button" class="adm-btn btn-danger">삭제</button>

							</ul>


							<hr>

							<ul class="row">
								<li class="col-md-3 col-sm-6 col-xs-12"><input
									type="checkbox" class="lec-check"> <a
									href="<c:url value='/lecture/lectureDetail' />">
										<div class="lec-list-inner">
											<img src="../img/spring.png" alt="spring">
											<div class="lec-content clearfix">
												<div class="lec-info">
													<span>강의명</span> <span>강사</span> <span>별점칸</span> <br>
													<span class="time"> time </span>
												</div>
												<div class="lec-price">
													<strong>199,000원</strong>
												</div>
											</div>
										</div>
								</a>

									<div class="lec-like clearfix">
										<span class="lec-like-span">좋아요</span> <span class="lec-heart"><button
												type="button" class="glyphicon glyphicon-heart">10</button></span>
									</div></li>


								<li class="col-md-3 col-sm-6 col-xs-12"><input
									type="checkbox" class="lec-check">
									<div class="lec-list-inner">
										<img src="../img/spring.png" alt="spring">
										<div class="lec-content clearfix">
											<div class="lec-info">
												<span>강의명</span> <span>강사</span> <span>별점칸</span> <br>
												<span class="time"> time </span>
											</div>
											<div class="lec-price">
												<strong>199,000원</strong>
											</div>
										</div>
									</div>

									<div class="lec-like clearfix">
										<span class="lec-like-span">좋아요</span> <span class="lec-heart"><button
												type="button" class="glyphicon glyphicon-heart">10</button></span>
									</div></li>


								<li class="col-md-3 col-sm-6 col-xs-12"><input
									type="checkbox" class="lec-check">
									<div class="lec-list-inner">
										<img src="../img/spring.png" alt="spring">
										<div class="lec-content clearfix">
											<div class="lec-info">
												<span>강의명</span> <span>강사</span> <span>별점칸</span> <br>
												<span class="time"> time </span>
											</div>
											<div class="lec-price">
												<strong>199,000원</strong>
											</div>
										</div>
									</div>

									<div class="lec-like clearfix">
										<span class="lec-like-span">좋아요</span> <span class="lec-heart"><button
												type="button" class="glyphicon glyphicon-heart">10</button></span>
									</div></li>


								<li class="col-md-3 col-sm-6 col-xs-12"><input
									type="checkbox" class="lec-check">
									<div class="lec-list-inner">
										<img src="../img/spring.png" alt="spring">
										<div class="lec-content clearfix">
											<div class="lec-info">
												<span>강의명</span> <span>강사</span> <span>별점칸</span> <br>
												<span class="time"> time </span>
											</div>
											<div class="lec-price">
												<strong>199,000원</strong>
											</div>
										</div>
									</div>

									<div class="lec-like clearfix">
										<span class="lec-like-span">좋아요</span> <span class="lec-heart"><button
												type="button" class="glyphicon glyphicon-heart">10</button></span>
									</div></li>


								<li class="col-md-3 col-sm-6 col-xs-12"><input
									type="checkbox" class="lec-check">
									<div class="lec-list-inner">
										<img src="../img/spring.png" alt="spring">
										<div class="lec-content clearfix">
											<div class="lec-info">
												<span>강의명</span> <span>강사</span> <span>별점칸</span> <br>
												<span class="time"> time </span>
											</div>
											<div class="lec-price">
												<strong>199,000원</strong>
											</div>
										</div>
									</div>

									<div class="lec-like clearfix">
										<span class="lec-like-span">좋아요</span> <span class="lec-heart"><button
												type="button" class="glyphicon glyphicon-heart">10</button></span>
									</div></li>


							</ul>
							<!--ul close-->

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



