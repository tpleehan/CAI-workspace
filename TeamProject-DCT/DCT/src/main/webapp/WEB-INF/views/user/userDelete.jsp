<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.my-account-box .my-account .my-account-margin {
	display: flex;
	margin-left: -19px;
}

.my-account-part li {
	font-size: 15px;
	font: bold;
	list-style-type: none;
	float: left;
	margin-left: 20px;
	display: flex;
	border-bottom: 1px solid #000;
	width: 100%;
}

.account-delete-box1 p {
	font-size: 14px;
}

.account-delete-box2 {
	border: 1px solid rgb(151, 151, 151);
	background-color: rgb(241, 239, 239);
}

.account-delete-box2 .attention-label {
	font-size: 13px;
	margin-left: 1%;
	margin-top: 1%;
}

.account-delete-box2 p {
	margin-left: 1%;
}

.delete-box {
	width: auto;
	height: auto;
	display: flex;
}

.account-list-inner {
	width: 100%;
}

.delete_attention p, .checkbox-ul p span{
font-size: 13px;
}

.delete-checkbox {
	margin-top: 10px;
}

.delete-checkbox .checkbox-ul #delete-agree {
	border: 1px solid #000;
	width: 15px;
	height: 15px;
}

.account_container {
	display: flex;
	width: 100%;
}

.clearfix::after {
	display: flex;
}

.account__wrapper {
	display: flex;
	margin-top: 15px;
}

.delete-checkbox .button-class {
	display: flex;
	width: 100%;
}

.delete-checkbox .button-first {
	display: flex;
	width: 100%;
}

.delete-checkbox .button-second {
	display: flex;
	width: 100%;
}

.ac-button.is-solid {
	border: 1px solid;
	color: #fff;
}

.ac-button.is-lg {
	padding: 0 16px;
	height: 48px;
	line-height: 1.47;
	font-size: 15px;
	letter-spacing: -.3px;
	width: 100%;
	display: flex;
}

.ac-button.is-primary {
	border-color: rgba(235, 123, 235, 0.651);
	font-weight: 700;
	background-color: rgba(233, 161, 233, 0.651);
	width: 100%;
}

.ac-button.is-second {
	border-color: rgb(201, 201, 201);
	font-weight: 700;
	background-color: rgb(218, 216, 216);;
	width: 100%;
}

.ac-button {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 4px;
	line-height: 1.47;
	font-weight: 500;
	cursor: pointer;
	-webkit-appearance: none;
	padding: 0 12px;
	height: 0px;
	line-height: 1.43;
	font-size: 14px;
	letter-spacing: -.3px;
	border: 1px solid;
	color: #fff;
}


/*aside*/

.mypage_header .container h2{
	font-size: 21px;
	margin-left: 5px;
}

.aside_menu p{
    font-size: 18px;
}

.aside_menu .menu-list .btn_wrap {
	font-size: 15px;
	color: #757575;
}

.aside_menu .menu-list a:hover, .aside_menu .menu-list a:focus {
 color: #000;
 background: #f2f2f2;
 text-decoration: none;
}

.menu-label {
	margin: 1px;
}
</style>

<%@ include file="../include/header.jsp"%>


<div id="wrapper">
	<header data-include-path="./include/header.html"></header>

	<section>
		<div class="mypage_header">
			<div class="container">
				<h2>마이페이지</h2>
			</div>
		</div>


		<div class="container">
			<div class="columns">
				<div class="aside_menu">
					<aside class="sidebar_left">
						<div class="menu_container">
							<p class="menu-label">학습 관리</p>
                            <ul class="menu-list">
                                <li>
                                    <a class="btn_wrap " href="#">
                                        <span>내가 본 강의</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="btn_wrap " href="#">
                                        <span>내가 올린 강의</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="btn_wrap " href="#">
                                        <span>작성한 게시글</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="btn_wrap " href="#">
                                        <span>멘토링</span>
                                    </a>
                                </li>
                            </ul>
                            <p class="menu-label">수강 신청 관리</p>
                            <ul class="menu-list">
                                <li>
                                    <a class="btn_wrap " href="#">
                                        <span>수강바구니</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="btn_wrap " href="#">
                                        <span>구매내역</span>
                                    </a>
                                </li>
                            </ul>
                            <p class="menu-label">설정</p>
                            <ul class="menu-list">
                                <li>
                                    <a class="btn_wrap " href="/user/userModify">
                                        <span>프로필</span>
                                    </a>
                                </li>
                            </ul>
						</div>
					</aside>
				</div>

				<div class="container">
					<div class="row">
						<div class="col-md-9 my-account-box">
							<div class="my-account">
								<div class="my-account-margin">
									<ul class="my-account-part">
										<li class="my-account-delete">계정 삭제하기<input type="hidden"
											id="userId" class="userId" value="${userInfo.userId}"></li>
									</ul>
								</div>
							</div>


							<div class="account_container">
								<div class="account__wrapper">
									<div class="delete_box">
										<div class="account-delete-box1">
											<p>
												회원 탈퇴 전 아래 사항을 꼭 확인해 주시기 바랍니다.<br> - 회원 탈퇴 시, 가지고 계신
												포인트 및 쿠폰은 모두 삭제되며 복구되지 않습니다.<br> 환불이 가능한 포인트의 경우에는
												고객센터를 통해 먼저 환불 요청을 진행해 주시기 바랍니다.<br> - 회원 탈퇴 시, DCT에
												등록된 회원님의 개인정보는 모두 삭제되며 복구되지 않습니다.<br> 단, 관계법령에 따라 회사가
												보관하여야 하는 정보는 일정 기간 보관 처리합니다.<br> - 부당한 목적으로 탈퇴 후 재가입을 한
												경우에는 이용에 제한이 있을 수 있습니다.
											</p>
										</div>
										<div class="account-delete-box2">
											<label class="attention-label">안내사항</label>
											<div class="delete_attention">
												<p>
													안내사항 계약 또는 청약 철회 등에 관한 기록<br> 보존근거: 전자상거래 등에서의 소비자 보호에
													관한 법률<br> 보존기간: 5년<br> 대금 결제 및 재화 등의 공급에 관한 기록<br>
													보존근거: 전자상거래 등에서의 소비자 보호에 관한 법률<br> 보존기간: 5년<br>
													소비자의 불만 또는 분쟁 처리에 관한 기록<br> 보존근거: 전자상거래 등에서의 소비자 보호에
													관한 법률<br> 보존기간: 3년<br>
												</p>
											</div>
										</div>
										<div class="delete-checkbox">
											<div class="line"></div>
											<ul class="checkbox-ul">
												<p>
													<span><input type="checkbox" id="delete-agree">
														위 안내사항을 확인하였으며, 탈퇴 시 계정에 남아 있는 정보 및 잔여 포인트, 쿠폰 등은 복구되지 않음을
														인지하였으며 이에 동의합니다.</span>
												</p>
											</ul>
											<div class="button-class">
												<div class="button-first">
													<button type="button" id="delete-cancel"
														class="ac-button is-lg is-solid is-primary e-cancle-up-button form__button ">취소</button>
												</div>
												<div class="button-second">
													<button type="button" id="delete-btn"
														class="ac-button is-lg is-solid is-second e-delete-up-button form__button ">계정
														삭제</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
</div>

<%@ include file="../include/footer.jsp"%>

<script>

	$(function() {
		$('#delete-cancel').click(function() {
			location.href="<c:url value='/user/userModify' />"
	 	});
	});



	$('#delete-btn').click(function() {
		if ($('#delete-agree').is(":checked")) {
			var inputPass1 = prompt("비밀번호를 입력해주세요.");

			if (inputPass1 != null) {
				var trimPass1 = inputPass1.trim();

				if (trimPass1 != "" && trimPass1 != undefined) {
					var inputPass2 = prompt("비밀번호를 다시 입력해주세요.");
					var trimPass2 = inputPass2.trim();

					if (trimPass1 == trimPass2) {

						var userId = $('#userId').val();
						var param = {
							"userId" : userId,
							"userPw" : trimPass1
						}
						
						$.ajax({
							type : 'POST',
							url : '<c:url value="/user/deleteCheck" />',
							contentType : 'application/json',
							dataType : "text",
							data : JSON.stringify(param),
							success : function(data) {
								alert("탈퇴가 처리되었습니다.");
								location.href = "/";
							},
							error : function() {
								alert("에러입니다.");
							}
						})
					} else alert("비밀번호가 일치하지 않습니다.");
				} else {
					alert("비밀번호를 제대로 입력해주세요.");
				}
			}
		}
	});
</script>
