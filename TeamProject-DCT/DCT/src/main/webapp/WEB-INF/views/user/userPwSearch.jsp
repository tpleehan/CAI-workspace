<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	
	/* ---------------------------- 비밀번호 찾기 ---------------------------- */
	#pw-search {
		display: grid;
		place-items: center;
		min-height: 60vh;
		text-align: center;
	}
	.pw-search-header {
		margin-bottom: 30px;
	}
	.pw-search-footer input {
		width: 30%;
		height: 40px;
		border: 1px solid;
		margin-top: 20px;
		position: relative;
		outline: none;
	}
	.pw-search-footer button {
		height: 40px;
		position: absolute;
		margin-left: -50px;
		margin-top: 20px;
	}
	
	/* 비밀번호 찾기 모달 */
	#searchPwModal .search-pw-modal {
		padding-top: 25px;
	}
	#searchPwModal .description p {
		font-size: 16px;
		line-height: 30px;
	}
	#searchPwModal .search-pw-modal-footer {
		text-align: center;
		margin-top: 20px;
	}
	
</style>

	<div class="wrapper">
		<%@ include file="../include/header.jsp"%>

		<section id="pw-search">
			<div class="container">
				<div class="row">
					<div class="pw-search-header">
						<h1>비밀번호 찾기</h1>
                    </div>
				</div>
				<div class="row">
                    <div class="pw-search-body">
                        <p>
                            비밀번호가 기억나지 않으세요?
                            <br>
                            Dream Come True에 가입한 아이디 정확히 입력해 주세요.
                            <br>
                            가입한 아이디 정보의 이메일을 통해 비밀번호 수정 링크가 전송됩니다.
                        </p>
                    </div>
				</div>
				<div class="row">
                    <div class="pw-search-footer">
                        <input type="text" placeholder="아이디를 입력해주세요.">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#searchPwModal" >찾기</button>
                    </div>
				</div>
			</div>
		</section>

		<%@ include file="../include/footer.jsp"%>

        <!-- Modal -->
        <div id="searchPwModal" class="modal fade">
            <div class="modal-dialog">
                <!-- Modal Centent-->
                <div class="modal-content search-pw-modal">
                    <div class="modal-header-logo">
                        <img class="logo" src="<c:url value='/img/logo.png' />" alt="modal-header-logo">
                    </div>
                    <div class="modal-body">
                        <span class="description">
                            <p>test@test.com <br>
	                            위 주소로 비밀번호 설정 메일이 전송되었습니다. 💌<br>
	                            메일을 확인해주세요.<br>
                                <span style="font-size: 12px;">
                                    (몇분내로 확인되지 않으면 스팸 폴더를 확인해주세요!)
                                </span>
                            </p>
                        </span>
                    </div>
                    <div class="search-pw-modal-footer">
                        <button class="btn btn-primary">확인</button>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
