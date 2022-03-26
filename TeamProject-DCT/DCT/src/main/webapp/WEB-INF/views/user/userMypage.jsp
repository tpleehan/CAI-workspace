<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	/* 마이 페이지 */
	.columns .aside_menu{
		float: left;
		margin-right: 130px;
		height: 800px;
	} 
	
	.container .row .col-md-4{
		width: 400px;
		height: 230px;
		background: rgb(193, 167, 194);
		color: #fff;
		margin: 10px;
		padding: .5rem 1rem;
		border: 3px dotted rgb(167, 166, 166);
	}
	
	.container .row .col-md-2{
		margin-left: 9px;
	}
	
	.container .row .col-md-7{
		width: 820px;
		height: 130px;
		background: rgb(193, 167, 194);
		color: #fff;
		margin: 10px;
		padding: .5rem 1rem;
		border: 3px dotted rgb(167, 166, 166);
	}
	
	.profile .box_profile { /* 프로필 */
		display: inline;
	}
	
	.title .box_profile .box_title { /* 최근 학습 강의*/
		display: flex;
	}
	
	.box_statistics{
		display: inline;
	}
	
	.box_title .box_sta{
		display: flex;
	}
	
	.box_title .box_content {
		display: flex;
		overflow: auto;
	}
	
	
	.box_title .box_content .columns_1 .status_value span{
		opacity: .5;
		font-size: 3em;
	}
	
	.box_title .columns_1 {
		display: inline;
	}
	
	.box_content .columns_1 .status_value{
		display: inline;
	}
	
	.box_content .columns_1 .status_label {
		display: inline;
		text-align: center;
	}
	
	.container .row{
		margin: 5px 0;
		
	}
	
	.col-md-4 {
		display: inline;
	}
	
	.col-md-4 .box_statistics{
		display: flex;
	}
	
	.title .box_profile .box_title .qna_title {
		float: right;
		margin-right: 270px;
	}
	
	.title .box_profile .box_title .qna_writer {
		float: right;
		margin-right: auto;
	}
	
	.title .box_profile .box_title .qna_answer {
		float: right;
		margin-right: auto;
	}
	
	/* 마이 페이지 종료 */

</style>

<%@ include file="../include/header.jsp"%>

	<div id="wrapper">

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
                                            <span>위시리스트</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="btn_wrap " href="#">
                                            <span>쿠폰함</span>
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
                            <div class="col-md-4">
                                <div class="profile">
                                    <div class="box_profile">
                                        <div class="box_title">
                                            <p>
                                                <span>님의 프로필</span>
                                            </p>
                                        </div>
                                        <div class="box_content">
                                            <div class="media-content">
                                                <span>님 안녕하세요!</span>
                                            </div>
                                               <a class="bottom_right" href="#">프로필 수정하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="title">
                                    <div class="box_profile">
                                        <div class="box_title">
                                            <p>
                                                <span>최근 학습 강의</span>
                                            </p>
                                        </div>
                                        <div class="box_content">
                                            <p class="course_title">
                                                <span class="last-content">1달 전</span>
                                            </p>
                                            <div class="progress">
                                                <label>진도율: </label>
                                                <progress class="progress is-link" value="57.14"
                                                    max="">n%</progress>
                                            </div>
                                            <div class="buttons bottom_right">
                                                <a href="#" class="button is-link">내 모든 강의</a>
                                                <a class="button is-primary" href="#">이어서 학습하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="box_title">
                                        <p class="box_sta">
                                            <span>학습 통계</span>
                                        </p>
                                    <div class="box_content">
                                        <div class="columns_1">
                                            <div class="status_value">
                                                <span>1</span>
                                            </div>
                                            <div class="status_label">완료 강의 수</div>
                                        </div>
                                        <div class="columns_1">
                                            <div class="status_value">
                                                <span>34</span>
                                            </div>
                                            <div class="status_label">완료 수업 수</div>
                                        </div>
                                        <div class="columns_1">
                                            <div class="status_value">
                                                <span>1</span>
                                            </div>
                                            <div class="status_label">획득 수료증</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="title">
                                    <div class="box_profile">
                                        <div class="box_title">
                                            <p>
                                                <span>완료한 강의</span>
                                            </p>
                                        </div>
                                        <div class="box_title">
                                            <p>
                                                <span>강의 제목</span>
                                            </p>
                                        </div>
                                        <div class="box_content">
                                            <p class="course_title">
                                                <span class="last-content">1달 전</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2" style="margin-left: 21px;">
                            </div>
                            <div class="col-md-7 mypage-footer">
                                <div class="title">
                                    <div class="box_profile">
                                        <div class="box_title">
                                            <p>
                                                <span>1:1 문의 (Q&A)</span>
                                            </p>
                                        </div>
                                        <div class="box_title">
                                            <p class="qna_title">
                                                <span><a href="#">이거 짜증나여</a></span>
                                            </p>
                                            <p class="qna_writer">
                                                <span>땡땡님</span>
                                            </p>
                                            <p class="qna_answer">
                                                <span>답변완료</span>
                                            </p>
                                            <p class="qna_date">
                                                <span>1달 전</span>
                                            </p>
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