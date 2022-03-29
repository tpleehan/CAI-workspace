<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>


<style>

/*------------- lec-eva-----------------------------*/
        
    .lec-eva{
        margin-left: 200px;
        width: 75%;
    }

    .eva-normal {
        margin-top: 2px;
    }

    .eva-normaal > li {
        margin-top: 1.5px;
    }

    .eva-main > li {
        margin-bottom: 2px;
    }

    .eva-left-part > ul {
        margin-top: 20px;
    }

    .eva-middle-part{
        margin-top: 20px;   
        padding-right: 0;
    }

    .eva-right-part{
        margin-top: 20px;
        padding-left: 0;
        padding-right: 0;
        float: left;
    }

	
</style>

<div class="container">

<section>

         <div class="container lec-eva">
            <div class="col-md-2 eva-left-part">
                <nav class="community-body-nav col-md-2">
                    <ul class="">
                        <h6>Dreams Come True</h6>
                        <li><a href="<c:url value='/notice/noticeList' />"><span>공지사항</span></a></li>
                        <li><a href="<c:url value='/notice/introduce' />"><span>사이트 소개</span></a></li>
                    </ul>
                    <ul>
                        <h6>강의</h6>
                        <li><a href="<c:url value='/lecture/lecturePage' />"><span>전체 강의</span></a></li>
                        <li><a href="<c:url value='/lecture/lectureEva' />"><span>수강평</span></a></li>
                    </ul>
                    <ul>
                        <h6>커뮤니티</h6>
                        <li><a href="<c:url value='/board/freeBoardList' />"><span>자유게시판</span></a></li>
                        <li><a href="<c:url value='/notice/frequentqna' />"><span>자주묻는 질문</span></a></li>
                    </ul>
                </nav>

            </div> <!-- left part close-->


            <div class="col-md-8 eva-middle-part">
                <div>
                    <div class="article">
                        <div class="eva-reply">
                           <a href="#" class="media-content">
                           <div class="col-md-8">
                              <h4 class="post_title"><span class="has-text-link">새소식</h4>
                                 <p class="post_metas">
                                     <span class="updated_at">7일전</span> &nbsp;
                                     <span class="author">글쓴이:김아무개</span>&nbsp;
                                     <span class="to">대상: 전체</span>
                                     <hr width = "100%" color = "black" border:none>
                                 </p>  
                              </div>
                              <div class="col-md-3">
                                 <img src="/img/python.png" alt="python">
                              </div>
                           </a>
                        </div>
                     </div>

                     <div class="article">
                        <div class="lec-reply">
                           <a href="#" class="media-content">
                           <div class="col-md-8">
                              <h4 class="post_title"><span class="has-text-link">새소식</h4>
                                 <p class="post_metas">
                                     <span class="updated_at">7일전</span> &nbsp;
                                     <span class="author">글쓴이:김아무개</span>&nbsp;
                                     <span class="to">대상: 전체</span>
                                     <hr width = "100%" color = "black" border:none>
                                 </p>  
                              </div>
                              <div class="col-md-3">
                                 <img src="/img/python.png" alt="python">
                              </div>
                           </a>
                        </div>
                     </div>

                     <div class="article">
                        <div class="lec-reply">
                           <a href="#" class="media-content">
                           <div class="col-md-8">
                              <h4 class="post_title"><span class="has-text-link">새소식</h4>
                                 <p class="post_metas">
                                     <span class="updated_at">7일전</span> &nbsp;
                                     <span class="author">글쓴이:김아무개</span>&nbsp;
                                     <span class="to">대상: 전체</span>
                                     <hr width = "100%" color = "black" border:none>
                                 </p>  
                              </div>
                              <div class="col-md-3">
                                 <img src="/img/python.png" alt="python">
                              </div>
                           </a>
                        </div>
                     </div>

                     <div class="article">
                        <div class="lec-reply">
                           <a href="#" class="media-content">
                           <div class="col-md-8">
                              <h4 class="post_title"><span class="has-text-link">새소식</h4>
                                 <p class="post_metas">
                                     <span class="updated_at">7일전</span> &nbsp;
                                     <span class="author">글쓴이:김아무개</span>&nbsp;
                                     <span class="to">대상: 전체</span>
                                     <hr width = "100%" color = "black" border:none>
                                 </p>  
                              </div>
                              <div class="col-md-3">
                                 <img src="/img/python.png" alt="python">
                              </div>
                           </a>
                        </div>
                     </div>

                     <div class="article">
                        <div class="lec-reply">
                           <a href="#" class="media-content">
                           <div class="col-md-8">
                              <h4 class="post_title"><span class="has-text-link">새소식</h4>
                                 <p class="post_metas">
                                     <span class="updated_at">7일전</span> &nbsp;
                                     <span class="author">글쓴이:김아무개</span>&nbsp;
                                     <span class="to">대상: 전체</span>
                                     <hr width = "100%" color = "black" border:none>
                                 </p>  
                              </div>
                              <div class="col-md-3">
                                 <img src="/img/python.png" alt="python">
                              </div>
                           </a>
                        </div>
                     </div>

                  </div>  

            </div> <!--middle-part close -->

                  <div class="col-md-2 eva-right-part">
                     <a href="#" class="list-group-item active">핫한 강의</a>
                     <a href="#" class="list-group-item">파이썬 해결</a>
                     <a href="#" class="list-group-item">10000만원 요리</a>
                     <a href="#" class="list-group-item">CSS 한번에</a>
                     <a href="#" class="list-group-item">DIY 초급편</a>
                  </div> <!-- right-part close-->

         </div> <!-- col-md-7 close -->
         
       
      </section>
            
 </div>




	
<%@ include file="../include/footer.jsp" %>
