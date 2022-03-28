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

    .vouchers-list{
        list-style: none;
        margin-top: auto;
        margin-bottom: 5px;
        border-bottom: 1px solid #e9ebee;
        height: 50px;
    }

    .ac-gif__img {
        display: block;
        width: 50px;
        height: 32px;
        -o-object-fit: cover;
        object-fit: cover;
        -o-object-position: 50% 50%;
        object-position: 50% 50%;
        margin-top: 10px;
    }

    .vouchers-list .voucher-item {
        list-style-type: none;
        font-weight: 400;
        line-height: 1.47;
        letter-spacing: -.3px;
        font-size: 15px;
        overflow: hidden;
        text-overflow: ellipsis;
        padding-right: 24px;
        font-weight: 500;
    }

    .voucher-title a {
        cursor: pointer;
    }

    .container .lecture-img {
        float: left;
        width: 100px;
        text-align: center;
    }

    .container .voucher-title {
        float: left;
        width: 100px;
        text-align: center;
        margin-top: 10px;
        margin-left: 30px;
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
                    <h2>MY PAGE</h2>
                </div>
            </div>

            <div class="container">
                <div class="columns">
                    <div class="col-md-2">
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
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="my-lectures">
                                    <div>
                                        <ul class="my-lectures-part">
                                            <li class="my-question"><a href="<c:url value='/user/userMypageRecentLecture' />">보유한 강의</a></li>
                                            <li class="my-free"><b>수강확인증</b></li>
                                            <li class="my-study"><a href="<c:url value='#' />">수료증</a></li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="control_container">
                                    <div class="control__wrapper">
                                        <div class="control order_by">
                                            <p>전체 강의 수: </p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <section>
                                <div class="container">
                                    <ul class="row">
                                        <ul class="col-md-8 vouchers-list">
                                            <li class="voucher-item">
                                                <section class="ac-gif course-cover-img">
                                                    <div class="lecture-img">
                                                        <img class="ac-gif__img" src="/img/spring.png" alt="spring">
                                                    </div>
                                                </section>
                                                    <div class="voucher-title">
                                                        <a href="#">강의명</a>
                                                    </div>
                                            </li>
                                        </ul>
                                        <ul class="col-md-8 vouchers-list">
                                            <li class="voucher-item">
                                                <section class="ac-gif course-cover-img">
                                                    <div class="lecture-img">
                                                        <img class="ac-gif__img" src="/img/spring.png" alt="spring">
                                                    </div>
                                                </section>
                                                    <div class="voucher-title">
                                                        <a href="#">강의명</a>
                                                    </div>
                                            </li>
                                        </ul>
                                        <ul class="col-md-8 vouchers-list">
                                            <li class="voucher-item">
                                                <section class="ac-gif course-cover-img">
                                                    <div class="lecture-img">
                                                        <img class="ac-gif__img" src="/img/spring.png" alt="spring">
                                                    </div>
                                                </section>
                                                    <div class="voucher-title">
                                                        <a href="#">강의명</a>
                                                    </div>
                                            </li>
                                        </ul>
                                        <ul class="col-md-8 vouchers-list">
                                            <li class="voucher-item">
                                                <section class="ac-gif course-cover-img">
                                                    <div class="lecture-img">
                                                        <img class="ac-gif__img" src="/img/spring.png" alt="spring">
                                                    </div>
                                                </section>
                                                    <div class="voucher-title">
                                                        <a href="#">강의명</a>
                                                    </div>
                                            </li>
                                        </ul>
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