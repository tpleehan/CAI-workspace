<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <style>

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

    .my-lectures{
        display: flex;
    }

    .my-lectures-part li{
        list-style-type: none;
        float: left;
        margin-left: 20px;
        display: flex;
    }

    .control_order_by {
        margin-top: 30px;
        display: flex;
        color: #000;
        width: 100%;
    }

    .clearfix::after{
        display: flex;
    }

    .control__wrapper {
        display: flex;
        margin-top: 20px;
    }

    .control_container .control {
        display: flex;
    }

    .lecture-label {
        margin-right: 20px;
    }

    .select-study {
        border: 1px solid black;
    }

    .is-link {
        height: 6px;
        display: block;
        width: 100%;
        border-radius: 0;
        margin-top: 0.4rem;
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
                                            <span><b>내가 본 강의</b></span>
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
                            <div class="col-md-9">
                                <div class="my-lectures">
                                    <div>
                                        <ul class="my-lectures-part">
                                            <li class="my-question"><b>보유한 강의</b></li>
                                            <li class="my-free"><a href="<c:url value='/user/userMypageConfirmation' />">수강확인증</a></li>
                                            <li class="my-study"><a href="<c:url value='#' />">수료증</a></li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="control_container">
                                    <div class="control__wrapper">
                                        <div class="control order_by">
                                            <label class="lecture-label">정렬기준</label>
                                                <div class="list-study">
                                                    <select class="select-study">
                                                        <option value="recent-study">최근 공부</option>
                                                        <option value="create-study">최근 수강신청</option>
                                                        <option value="abc-study">제목순</option>
                                                    </select>
                                                </div>
                                            <div class="control filter_progress">
                                                <label class="lecture-label">진행률</label>
                                                <div class="list-study">
                                                    <select class="select-study">
                                                        <option value="recent-study">모두 보기</option>
                                                        <option value="create-study">학습중</option>
                                                        <option value="abc-study">완강</option>
                                                    </select>
                                                </div>
                                            </div>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <section>
                                <div class="container">
                                    <ul class="row">
                                        <li class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="lec-list-inner">
                                                <img src="/img/spring.png" alt="spring">
                                                <div class="lec-content clearfix">
                                                    <div class="card-content">
                                                        <div class="course-title-wrapper">
                                                            <span>강의명</span><br>
                                                            <span class="lecture-progress"> 진도율: </span>
                                                            <progress class="progress is-link" value="8"
                                                                max="100">n%</progress>
                                                            <span class="time-limit"> 기한: </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    <ul class="row">
                                        <li class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="lec-list-inner">
                                                <img src="/img/spring.png" alt="spring">
                                                <div class="lec-content clearfix">
                                                    <div class="card-content">
                                                        <div class="course-title-wrapper">
                                                            <span>강의명</span><br>
                                                            <span class="lecture-progress"> 진도율: </span>
                                                            <progress class="progress is-link" value="8"
                                                                max="100">n%</progress>
                                                            <span class="time-limit"> 기한: </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    <ul class="row">
                                        <li class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="lec-list-inner">
                                                <img src="/img/spring.png" alt="spring">
                                                <div class="lec-content clearfix">
                                                    <div class="card-content">
                                                        <div class="course-title-wrapper">
                                                            <span>강의명</span><br>
                                                            <span class="lecture-progress"> 진도율: </span>
                                                            <progress class="progress is-link" value="8"
                                                                max="100">n%</progress>
                                                            <span class="time-limit"> 기한: </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    <ul class="row">
                                        <li class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="lec-list-inner">
                                                <img src="/img/spring.png" alt="spring">
                                                <div class="lec-content clearfix">
                                                    <div class="card-content">
                                                        <div class="course-title-wrapper">
                                                            <span>강의명</span><br>
                                                            <span class="lecture-progress"> 진도율: </span>
                                                            <progress class="progress is-link" value="8"
                                                                max="100">n%</progress>
                                                            <span class="time-limit"> 기한: </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    <ul class="row">
                                        <li class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="lec-list-inner">
                                                <img src="/img/spring.png" alt="spring">
                                                <div class="lec-content clearfix">
                                                    <div class="card-content">
                                                        <div class="course-title-wrapper">
                                                            <span>강의명</span><br>
                                                            <span class="lecture-progress"> 진도율: </span>
                                                            <progress class="progress is-link" value="8"
                                                                max="100">n%</progress>
                                                            <span class="time-limit"> 기한: </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    <ul class="row">
                                        <li class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="lec-list-inner">
                                                <img src="/img/spring.png" alt="spring">
                                                <div class="lec-content clearfix">
                                                    <div class="card-content">
                                                        <div class="course-title-wrapper">
                                                            <span>강의명</span><br>
                                                            <span class="lecture-progress"> 진도율: </span>
                                                            <progress class="progress is-link" value="8"
                                                                max="100">n%</progress>
                                                            <span class="time-limit"> 기한: </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                     </ul>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
<%@ include file="../include/footer.jsp"%>