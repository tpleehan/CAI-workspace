<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/ec7c1dce8a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="./css/bootstrap.css">
    <link rel="stylesheet" href="./css/main.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    <script src="./js/bootstrap.js"></script>
    <style>

/* 마이 페이지 */

body, html {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.mypage-section{
    position: relative;
    width: 970px;
    max-width: 1328px;
    min-height: 500px;
    margin: 0 auto;
}

.titleArea{
    margin: 5% 0 30px;
    text-align: left;
    margin-left: 12px;
}

.titleArea h2 {
    position: relative;
    font-size: 20px;
    font-style: bold;
    color: #111;
    text-transform: uppercase;
}

.mypage-user-box{
    display: block;
    text-align: center;
    border: 1px solid #e5e5e5;
    width: 90%;
}

.mypage-user-box .media-content{
    display: block;
    padding: 5px;
}

.mypage-user-box .media-content span{
    display: block;
    padding: 3px;
}



.mypage-user-block{
    margin: 20px 0 -1px;
}

.box_content .order{
    float: left;
    width: 80%;
}

.box_profile{
    width: 90%;
}

.box_profile .box_title {
    border: 1px solid #d5d5d5;
    display: block;
    font-size: 11px;
    line-height: 18px;
    color: #757575;
    background: #e5e5e5;
    text-shadow: none;
    border-collapse: collapse;
}
.box_profile .box_title h3 {
    font-size: 18px;
    margin: 1%;
}

.mypage_header{
    width: 970px;
}

.box_profile .box_content{
    text-align: center;
    border: 1px solid #d5d5d5;
    padding: 5px;
    border-top-style: none;
}

.box_profile .box_content .course_title .last-content-title {
    text-align: center;
}

.box_profile .box_content .course_title .last-content-title {
    text-align: center;
    display: block;
}

.box_profile .box_content .lecture-box a {
    text-align: center;
    display: block;
    margin: 2px;
}



.box_content .order li{
    float: left;
    width: 25%;
    padding: 0 0 4px;
    margin: 0 -1px 0 0;
    border-right: 1px dotted #e5e5e5;
    text-align: center;
}

.mypageMain{
    margin: 30px auto 0;
    overflow: hidden;
}

.mypageMain ul{
    margin: 1% -8px 0;
    width: 91%;
}

.mypageMain .pageMain {
    float: left;
    width: 25%;
    box-sizing: border-box;
    text-align: center;
}

.mypageMain .pageMain .box {
    margin: 8px;
    border: 1px #d5d5d5 solid;
}

.mypageMain .pageMain .box a {
    display: block;
    padding: 20px;
    font-size: 11px;
    line-height: 18px;
    color: #757575;
}

.mypageMain .pageMain .box h3 {
    position: relative;
    font-weight: normal;
    text-transform: uppercase;
}

.mypageMain .pageMain .box h3 span {
    display: block;
    padding: 6px 0 0;
    display: none;
}

.mypageMain .pageMain .box h3 strong {
    display: block;
    padding: 0 0 5px;
    font-size: 14px;
    font-weight: 900;
    color: #000;
}

.container::before{
    display: table;
    content: " ";
}

.container::after {
    content: "";
    display: block;
    clear: both;
}

.mypageMain .pageMain .box a:hover, .mypageMain .pageMain .box a:focus {
    color: #000;
    background: #f2f2f2;
}


    </style>
</head>

<body>

<%@ include file="../include/header.jsp"%>

    <div id="wrapper">
        <header data-include-path="./include/header.html"></header>

        <section class="mypage-section">
            <div class="mypage_header">
                <div class="titleArea">
                    <h2>MY PAGE</h2>
                </div>
            </div>

            <div class="container">
                <div class="mypage-user-box">
                    <div class="box-content-user">
                        <div class="media-content" style="text-align: center;">
                            <span>님 안녕하세요!</span>
                            <span>오늘도 dct에서 좋은 하루 보내세요!</span>
                        </div>
                    </div>
                </div>
            <div class="mypage-user-block"></div>
            <div class="my-profile">
                <div class="title">
                    <div class="box_profile">
                        <div class="box_title">
                            <h3>나의 강의 현황</h3>
                        </div>
                        <div class="box_content">
                            <p class="course_title">
                                <span class="last-content-title">최근 수강한 강의명</span>
                                <span class="last-content-date">1달 전</span>
                            </p>
                            <div class="progress">
                                <label>진도율: </label>
                                <progress class="progress is-link" value="57.14"
                                    max="">n%</progress>
                            </div>
                            <div class="lecture-box">
                                <a href="#">내 모든 강의 보기</a>
                                <a href="#">이어서 학습하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mypageMain">
                    <ul>
                        <li class="pageMain profile">
                            <div class="box">
                                <a href="<c:url value='/user/userModify' />">
                                    <h3>
                                        <strong>profile</strong>
                                        <span>내 프로필 수정하기</span>
                                    </h3>
                                    <p>
                                        고객님의 프로필을 수정할 수 있습니다.
                                        <br>
                                        회원 탈퇴는 여기를 눌러 주세요.
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="pageMain order">
                            <div class="box">
                                <a href="#">
                                    <h3>
                                        <strong>order</strong>
                                        <span>주문내역 조회</span>
                                    </h3>
                                    <p>
                                        고객님께서 주문하신 강의의
                                        <br>
                                        주문 내역을 확인하실 수 있습니다.
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="pageMain board">
                            <div class="box">
                                <a href="#">
                                    <h3>
                                        <strong>board</strong>
                                        <span>게시물 관리하기</span>
                                    </h3>
                                    <p>
                                        고객님께서 작성하신 게시물을
                                        <br>
                                        관리하는 공간입니다.
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="pageMain qna">
                            <div class="box">
                                <a href="<c:url value='/user/userMypageQna' />">
                                    <h3>
                                        <strong>Q&A</strong>
                                        <span>q&a 관리하기</span>
                                    </h3>
                                    <p>
                                        고객님께서 문의하신 게시물을
                                        <br>
                                        관리하는 공간입니다.
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="pageMain upload">
                            <div class="box">
                                <a href="<c:url value='/user/userMypageRecentLecture' />">
                                    <h3>
                                        <strong>내가 업로드한 강의</strong>
                                        <span>업로드 강의 관리하기</span>
                                    </h3>
                                    <p>
                                        고객님께서 업로드한 강의를
                                        <br>
                                        관리하는 공간입니다.
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="pageMain cart">
                            <div class="box">
                                <a href="<c:url value='/order/carts' />">
                                    <h3>
                                        <strong>장바구니</strong>
                                        <span>나의 장바구니</span>
                                    </h3>
                                    <p>
                                        고객님께서 결제 전 담아놓은 강의들을
                                        <br>
                                        관리하는 공간입니다.
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="pageMain buy">
                            <div class="box">
                                <a href="#">
                                    <h3>
                                        <strong>구매내역</strong>
                                        <span>나의 구매내역</span>
                                    </h3>
                                    <p>
                                        고객님께서 구매하신 강의를
                                        <br>
                                        관리하는 공간입니다.
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="pageMain metoring">
                            <div class="box">
                                <a href="#">
                                    <h3>
                                        <strong>멘토링</strong>
                                        <span>나의 멘토링 내역</span>
                                    </h3>
                                    <p>
                                        고객님의 멘토링 내역을
                                        <br>
                                        관리하는 공간입니다.
                                    </p>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 my-profile"></div>
            </div>
        </section>
    </div>
		

<%@ include file="../include/footer.jsp"%>