<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	
	/* ---------------------------- 아이디 찾기 ---------------------------- */
	#id-search {
		display: grid;
		place-items: center;
		min-height: 60vh;
		text-align: center;
	}
	.id-search-header {
		margin-bottom: 30px;
	}
	.id-search-footer input {
		width: 30%;
		height: 40px;
		border: 1px solid;
		margin-top: 20px;
		position: relative;
		outline: none;
	}
	.id-search-footer button {
		height: 40px;
		position: absolute;
		margin-left: -50px;
		margin-top: 20px;
	}
	
	/* 아이디 찾기 모달 */
	#searchIdModal .search-id-modal {
		padding-top: 25px;
	}
	#searchIdModal .description p {
		font-size: 16px;
		line-height: 30px;
	}
	#searchIdModal .search-id-modal-footer {
		text-align: center;
		margin-top: 20px;
	}
	
</style>

	<div class="wrapper">
		<%@ include file="../include/header.jsp"%>

		<section id="id-search">
			<div class="container">
				<div class="row">
					<div class="id-search-header">
						<h1>아이디 찾기</h1>
                    </div>
				</div>
				<div class="row">
                    <div class="id-search-body">
                        <p>
                            아이디가 기억나지 않으세요?
                            <br>
                            Dream Come True에 
                            <br>
                            가입한 아이디 또는 이메일을 정확히 입력해 주세요.
                        </p>
                    </div>
				</div>
				<div class="row">
                    <div class="id-search-footer">
                        <input type="text" placeholder="아이디 또는 이메일을 입력해주세요.">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#searchIdModal" >찾기</button>
                    </div>
				</div>
			</div>
		</section>

		<%@ include file="../include/footer.jsp"%>

        <!-- Modal -->
        <div id="searchIdModal" class="modal fade">
            <div class="modal-dialog">
                <!-- Modal Centent-->
                <div class="modal-content search-id-modal">
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
                    <div class="search-id-modal-footer">
                        <button class="btn btn-primary">확인</button>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
