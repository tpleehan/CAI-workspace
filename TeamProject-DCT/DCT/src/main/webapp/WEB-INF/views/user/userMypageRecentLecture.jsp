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
    
    .modal-dialog { 
    	width: 100%; 
    	height: 100%; 
    	margin: 0; 
    	padding: 0; 
   	}
	
	.modal-body {
		margin-top:10px;
	}

	.modal-content {
		width:1100px;
		height:800px;
	}

    
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
                                            <li class="my-question"><b>내가 올린 강의</b></li>
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
												 <c:forEach var="vo" items="${myUploadlist.userUploadList }">
													<li class="col-md-3 col-sm-6 col-xs-12">
													
														<a href="<c:url value='/lecture/lectureUpdate?lectureNo=${vo.lectureNo}' />">
																<div class="lec-list-inner">
																	<img src="<c:url value='/lecture/lectureDisplay?thumbnailFileLoca=${vo.thumbnailFileLoca}&thumbnailFilename=${vo.thumbnailFilename}' />">
																	<div class="lec-content clearfix">
																		<div class="lec-info">
																			<span>${vo.lectureTitle}</span> 
																			<span>${vo.lectureWriter}</span> 
																			<span>별점칸</span>
																			<br> <span class="time">${vo.lectureCreateDate }</span>
																		</div>
																		<div class="lec-price">
																			<strong>${vo.lecturePrice }</strong>
																		</div>
																	</div>
																</div>
														</a>
														
														<!-- 모달창 -->
														<button class="btn btn-default" data-target="#uploadVideo" data-toggle="modal">강의	출력버튼</button><br/>
														<div class="modal fade modal-xl" id="uploadVideo">
														  <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
														    <div class="modal-content" style="width:1100px; height:800px;">
														      <!-- header -->
														      <div class="modal-header">
														        <!-- 닫기(x) 버튼 -->
														        <button type="button" class="close" data-dismiss="modal">×</button>
														        <!-- header title -->
														        <h4 class="modal-title">${vo.lectureTitle}</h4>
														      </div>
														      <!-- body -->
														      	<div class="modal-body" style="margin-top:10px;">
														        	<div class="embed-responsive embed-responsive-16by9 video">
											                       	 	<iframe class="embed-responsive-item" src="<c:url value='/lecture/videoDisplay?videoFileLoca=${vo.videoFileLoca}&videoFilename=${vo.videoFilename}' />"></iframe>
											                    	</div>  
														      	</div>
														      <!-- Footer -->
														      <div class="modal-footer">
														        	${vo.lectureWriter}
														        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
														      </div>
														    </div>
														  </div>
														</div>

												    </li>
												
												 </c:forEach>
											</ul>
											<!--ul close-->	                                        
														 

                                </div> <!-- container close -->
                                
                                
                                
                            </section>
                            
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </section> <!--  전체 section  -->
    </div>
    
<%@ include file="../include/footer.jsp"%>



<script>





</script>

