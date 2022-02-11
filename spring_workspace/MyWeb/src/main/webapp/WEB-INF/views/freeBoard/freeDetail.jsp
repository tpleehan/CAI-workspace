<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<section class="content">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-md-9 content-wrap">
        <div class="titlebox">
          상세보기
        </div>

        <form action="#">
          <div>
            <label>DATE</label>
            <p>${article.regdate}</p>
          </div>
          <div class="form-group">
            <label for="bId">번호</label>
            <input type="text" id="bId" value="${article.bno}" class="form-control" readonly>
          </div>
          <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" id="writer" value="${article.writer}" class="form-control" readonly>
          </div>
          <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" value="${article.title}" class="form-control" readonly>
          </div>
          <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" class="form-control" rows="10" readonly>${article.content}</textarea>
          </div>

          <button class="btn btn-primary">수정</button>
          <button class="btn btn-dark">목록</button>
        </form>
      </div>
    </div>
  </div>
</section> 


<section class="reply">
  <div class="container">
    <div class="row">
      <div class="col-md-9 col-xs-12 content-wrap">
        <!-- 댓글 작성 공간 -->
       <div class="reply-wrap">
         <div class="reply-image">
           <img src="<c:url value='/img/profile.png' />" alt="prof">
         </div>
         <div class="reply-content">
           <textarea class="form-control" rows="3" id="reply"></textarea>
           <div class="reply-group clearfix">
             <div class="reply-input">
               <input type="text" class="form-control" id="replyId" placeholder="이름">
               <input type="password" class="form-control" id="replyPw" placeholder="비밀번호">
             </div>
             <button type="button" class="btn btn-info" id="replyRegist">등록</button>
           </div>
         </div>
       </div>
       
       <!-- 댓글 달릴 공간 -->
        <div class="reply-wrap">
          <div class="reply-image">
            <img src="<c:url value='/img/profile.png' />" alt="prof">
          </div>
          <div class="reply-content">
            <div class="reply-group clearfix">
              <strong class="left">honggildong</strong>
              <small class="left">2022/01/06</small>

              <a class="right" href="#"><span class="glyphicon glyphicon-pencil"></span> 수정</a>
              <a class="right" href="#"><span class="glyphicon glyphicon-remove"></span> 삭제</a>
            </div>
            <p>댓글 영역</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="../include/footer.jsp"%>

<script>
	
	$(document).ready(function() {
		
		$('#replyRegist').click(function() {
			/*
			 * 댓글을 등록하려면 게시글 번호도 보내야 한다.
			 * 댓글 내용, 작성자, 댓글 비밀번호, 게시글 번호를
			 * json 표기 방법으로 하나로 모아서 전달해야 한다.
			 * 비동기 통신으로 댓글 삽입을 처리하고,
			 * console.log를 통해 '댓글 등록 완료!'를 
			 * 확인하고 실제 DB에 댓글이 추가되는지 확인
			 * 전송방식: POST, URL : /reply/replyRegist
             */
            
            const bno = '${article.bno}'; // 컨트롤러에서 넘어온 게시글 번호
			const reply = $('#reply').val(); // 댓글 내용
            const replyId = $('#replyId').val(); // 댓글 작성자 아이디
			const replyPw = $('#replyPw').val(); // 댓글 비밀번호
			
			if(reply === '' || replyId === '' || replyPw === '') {
				alert('이름, 비밀번호, 내용을 입력하세요.');
				return;
			}
			
			$.ajax({
				 type: 'post',
		         url: '<c:url value="/reply/replyRegist" />',
		         data : JSON.stringify(
					{
						"bno" : bno,
						"reply" : reply,
						"replyId" : replyId,
						"replyPw" : replyPw
					}
		         ),
		         dataType : "text", // 서버로부터 어떤 형식으로 받을지 (생략 가능)
		         contentType : "application/json",
		         success : function(data) {
		        	console.log('통신 성공 ' + data);
		        	$('#reply').val('');
		        	$('#replyId').val('');
		        	$('#replyPw').val('');
		        	getList(); // 등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현
		         },
		         error : function() {
		        	 alert('등록에 실패했습니다.');
		         }
			}); // ajax 댓글 등록 비동기 통신
			
		}); // 댓글 등록 이벤트
		
	}); // end jQuery

</script>
