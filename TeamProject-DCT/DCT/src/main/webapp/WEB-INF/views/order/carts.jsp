<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

	.cart-left {
		float: left;
	}
	.cart-left h1 {
		font-size: 23px;
	}
	
	.cart-right {
		float: right;
		margin-top: 15px;
	}
	.cart-right li {
		display: inline-block;
		font-size: 18px;
	}
	
	.coupon {
		float: left;
	}
	.point {
		float: right;
	}
	
	.input-coupon-row {
	    margin-top: 20px;
		box-shadow: none;
		float: right;
	}
	
	.input-coupon {
		width: 200px;
		height: 30px;
		border: 1px solid;
		color: #5f5f5f;
		background: #f6f6f6;
	}
	
	/* 빈 장바구니 */
	#empty_cart {
		margin: 200px;
		text-align: center;
	}
	#empty_cart span {
		font-size: 20px;
	}
	#empty_cart i {
		font-size: 90px;
		color: #e0e0e0;
	}
	
	/* 담긴 장바구니 */
	.carts {
		margin-top: 20px;
		margin-bottom: 200px;
	}
	.product_thumbnail img {
		width: 90px;
	}
	
	.product-info-cover {
		display: flex;
		border: 1px solid #d5dbe2;
		background-color: #f8f9fa;
	}
	
	.product-info {
		font-size: 18px;
		color: #000;
		font-weight: 700;
		padding: 10px;
	}
	.product-clear {
		margin: 12px;
		margin-left: 580px;
		font-size: 15px;
		text-decoration: underline;
		font-weight: 700;
		color: #616568;
	}
	.product_item_container {
		box-shadow: unset;
	    border: 1px solid #d5dbe2;
	}
	.product_item {
		display: block;
		margin: 15px;
	}
	.product_thumbnail {
		display: inline-block;
	}
	.product-column-info {
		display: inline;
	}
	.product_title {
		display: inline-block;
		margin-left: 20px;
		font-size: 18px;
	}
	.product-menu {
		float: right;
		margin-right: 15px;
	}
	.product-amount {
		font-size: 18px;
		font-weight: bold;
		text-align: right;
	}
	.product-menu-button .btn-wishlist {
		display: block;
		border: 1px solid;
		margin-bottom: 5px;
	}
	.product-menu-button .btn-remove {
		border: 1px solid;
	}
	
	.total_amount h2 {
		display: inline;
		font-size: 26px;
		font-weight: bold;
	}
	.carts_payments {
		background-color: #fff;
		box-shadow: 0 2px 3px rgb(0 10 18 / 10%), 0 0 0 1px rgb(0 10 18 / 10%);
		color: #454545;
		max-width: 100%;;
		
	}
	.total_amount_container {
		padding: 15px;
	}
	.total_amount span {
		float: right;
		font-weight: bold;
		font-size: 26px;
	}
	.total_amount span del {
		font-size: 13px;
	}
	.total_amount_container .field {
		padding: 3px;
		height: 50px;
		margin-bottom: 10px;
	}
	.total_amount_container label {
		color: #595959;
		font-size: 13px;
		margin: -10px;
	}
	.total_amount_container input {
		display: block;
		border: 1px solid;
		padding: 5px;
		width: 100%;
		background: #dbdbdb;
	}
	
	.total_amount_container .field button {
		width: 49%;
		height: 40px;
	    padding-right: 3px;
	    padding-left: 3px;
	    border-radius: 4px;
	}
	
	
	.total_amount_container .checkbox {
		margin: 10px;
	}
	.total_amount_container .checkbox input {
		width: 10px;
		height: 10px;
		border: 1px solid #dbdbdb;
	}
	.total_amount_container .checkbox .agree {
		color: red;
	}
	
	.carts_payments .btn-make-payment button {
		width: 100%;
	}



</style>

<%@ include file="../include/header.jsp"%>

	<div class="wrapper">

		<section>
			<div class="container">
				<div class="row">				
					<div class="cart-left">
						<h1>장바구니</h1>
					</div>
					<div class="cart-right">
						<ul>
							<li>장바구니 <i class="fa-solid fa-arrow-right-long"></i></li>
							<li>결제 <i class="fa-solid fa-arrow-right-long"></i></li>
							<li>결제 완료</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="coupon">
						<a href="#">내 쿠폰함
							<i class="fa-solid fa-ticket"></i>
						</a>
						<i class="fa-solid fa-chevron-right"></i>
						<a href="#">내 위시리스트
							<i class="fa-solid fa-heart"></i>
						</a>
					</div>
					<div class="point">
						<a href="#">포인트 적립
							<i class="fa-solid fa-piggy-bank"></i>
						</a>
						<a href="#">쿠폰 이용 안내
							<i class="fa-solid fa-circle-question"></i>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="input-coupon-row">
						<div>
							<input class="input-coupon" type="text" placeholder="보유한 쿠폰코드를 입력하세요.">
							<button type="button" class="btn btn-success">버튼</button>
						</div>
					</div>
				</div>
				
				<c:choose>
					<c:when test="${carts == null}">
						<div id="empty_cart">
							<div class="this_cart_empty">
								<p>
									<i class="fa-solid fa-cart-shopping"></i>
								</p>
								<br>
								<span>
									바구니에 담긴 강의가 없습니다.
									<br>
									나를 성장시켜 줄 좋은 지식들을 찾아보세요.
									<br>
								</span>
								<br>
								<span class="buttons">
									<a href="<c:url value='/lecture/lecturePage' />" class="btn btn-success">강의 리스트 보기</a>
								</span>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="carts">
							<div class="row">
								<div class="col-sm-8">
									<div class="order_cart">
										<div class="product-info-cover">
											<div class="product-info">강의정보</div>
											<span class="product-clear">전체 삭제</span>
										</div>
										<div class="product-list">
											<div class="product_item_container">
												<div class="product_item">
													<div class="product_thumbnail">
														<img src="<c:url value='/img/java.png' />" alt="java">
													</div>
													<div class="product-column-info">
														<div class="product_title">
															<a href="#">강의제목: 자바 참 쉽다!</a>
															<div class="course-deadline">
																(수강기한: <span>무제한</span>)
															</div>
														</div>
														<div class="product-menu">
															<div class="product-amount">
																<span>₩121,000</span>
															</div>
															<div class="product-menu-button">
																<button class="btn-remove">
																	<span>바구니에서 삭제</span>
																</button>
															</div>
														</div>
													</div>
												</div>
												<div class="product_item">
													<div class="product_thumbnail">
														<img src="<c:url value='/img/html.png' />" alt="java">
													</div>
													<div class="product-column-info">
														<div class="product_title">
															<a href="#">강의제목: 웹개발</a>
															<div class="course-deadline">
																(수강기한: <span>무제한</span>)
															</div>
														</div>
														<div class="product-menu">
															<div class="product-amount">
																<span>₩121,000</span>
															</div>
															<div class="product-menu-button">
																<button class="btn-remove">
																	<span>바구니에서 삭제</span>
																</button>
															</div>
														</div>
													</div>
												</div>
												<div class="product_item">
													<div class="product_thumbnail">
														<img src="<c:url value='/img/spring.png' />" alt="java">
													</div>
													<div class="product-column-info">
														<div class="product_title">
															<a href="#">강의제목: 스프링 배우기</a>
															<div class="course-deadline">
																(수강기한: <span>무제한</span>)
															</div>
														</div>
														<div class="product-menu">
															<div class="product-amount">
																<span>₩121,000</span>
															</div>
															<div class="product-menu-button">
																<button class="btn-remove">
																	<span>바구니에서 삭제</span>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<form class="carts_payments">
										<div class="carts-content">
											<div class="total_amount_container">
												<div class="total_amount">
													<h2>총계</h2>
													<span>
														<del>₩253,000</del>
														₩237,600
													</span>
												</div>
												<div class="field">
													<label class="label">이름</label>
													<input type="text" value="김아무개">
												</div>
												
												<div class="field">
													<label class="label">
														<span>휴대폰 번호 (-없이 숫자만 입력)</span>
														<input type="text" value="01012345678">
													</label>
												</div>
												
												<div class="field">
													<label class="label">
														<span>이메일 주소</span>
														<input type="text" value="이메일 주소">
													</label>
												</div>
												
												<div class="field">
													<label class="label">결제수단</label>
													<div>
														<button type="button">
															<i class="fa-solid fa-credit-card"></i> 신용카드
														</button>
														<button type="button">
															<i class="fa-solid fa-piggy-bank"></i> 계좌이체
														</button>
													</div>
												</div>
												
												<div class="field">
													<label class="checkbox">
														<input type="checkbox">
														(필수) 구매조건 및 개인정보취급방침 동의 (보기)
														<div class="agree">
															<span class="">구매조건 및 결제대행 서비스 약관 동의하여야 합니다.</span>
														</div>
													</label>
												</div>
											</div>
										</div>
										<div class="btn-make-payment">
											<button class="btn btn-success" type="submit">결제하기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					
					</c:otherwise>
				</c:choose>
				
			</div>
		</section>

	</div>

<%@ include file="../include/footer.jsp"%>