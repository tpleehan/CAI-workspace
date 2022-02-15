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

          <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/freeBoard/freeModify?bno=${article.bno}" />'">수정</button>
          <button type="button" class="btn btn-dark" id="listBtn">목록</button>
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
       <div id="replyList">
       
       <%-- 
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
        --%>
        
       </div>
       <button class="form-control" id="moreList">더보기(페이징)</button>
      </div>
    </div>
  </div>
</section>

<!-- 모달 -->
<div class="modal fade" id="replyModal" role="dialog">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
            <h4 class="modal-title">댓글수정</h4>
         </div>
         <div class="modal-body">
            <!-- 수정폼 id값 확인-->
            <div class="reply-content">
            <textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
	            <div class="reply-group clearfix">
	               <div class="reply-input">
	                  <input type="hidden" id="modalRno">
	                  <input type="password" class="form-control" placeholder="비밀번호" id="modalPw">
	               </div>
	               <button class="right btn btn-info" id="modalModBtn">수정하기</button>
	               <button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
	            </div>
            </div>
            <!-- 수정폼 끝 -->
         </div>
      </div>
   </div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
	
	$(function() {
		$('#listBtn').click(function() {
			location.href="<c:url value='/freeBoard/freeList' />"
	 	});
	});
	
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
		        	getList(1, true); // 등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현
		         },
		         error : function() {
		        	 alert('등록에 실패했습니다.');
		         }
			}); // ajax 댓글 등록 비동기 통신
			
		}); // 댓글 등록 이벤트
		
		// 더보기 버튼 처리(클릭 시 전역변수 페이지번호에 + 1 값 전달)
		$('#moreList').click(function() {
			// 더보기 (누적)
			// 1페이지의 댓글 내용 밑에 2페이지 추가
			// 1페이지를 지우고 2페이지를 보여주는 것이 아니다. (기존 페이지 유지)
			getList(++page, false);
			
		});
		
		// 목록 요청
		let page = 1; // 페이지 번호
		let strAdd = ''; // 화면에 그려넣을 태그를 문자열의 형태로 추가할 변수
		
		getList(1, true); // 상세보기 화면에 처음 진입 시 댓글 리스트를 불러온다.
		
		// getList 매개값으로 요청된 페이지 번호 (pageNum)
		// 화면의 리셋 여부를 boolean타입의 변수 (reset)
		// reset 변수를 선언한 이유 
		// (페이지가 그대로 머물면서 댓글이 밑으로 쌓이기 때문에 페이지를 
		//	리셋해서 새롭게 가져올 것인지, 누적해서 쌓을 것인지 여부 확인)
		function getList(pageNum, reset) {
			
			const bno = '${article.bno}'; // 게시글 번호
			
			// getJSON 함수를 통해 JSON 형식의 파일을 읽어올 수 있다.
			// get방식의 요청을 통해 서버로부터 받은 JSON 데이터를 로드한다.
			// $.getJSON(url, [DATA], [통신 성공 여부])
			
			$.getJSON(
				"<c:url value='/reply/getList/' />" + bno + '/' + pageNum,
				function(data) {
					console.log(data);
					
					let total = data.total; // 총 댓글 수
					console.log('총 댓글 수: ' + total);
					let replyList = data.list; // 댓글 리스트
					
					// insert, update, delete 작업 후 댓글을 누적하고 있는 strAdd 변수를 초기화해서 화면이 리셋된 것처럼 보여줘야 한다.
					if(reset === true) {
						strAdd = '';
						page = 1;
					}
					
					// 페이지번호 * 데이터 수보다 전체 댓글 개수가 작으면 더보기 버튼 없애기
					console.log('현재 페이지: ' + page);
					if(total <= page * 5) {
						$('#moreList').css('display', 'none');
					} else {
						$('#moreList').css('display', 'block');
					}
					
					
					// 응답 데이터의 길이가 0보다 작으면 함수 종료
					if(replyList.length <= 0) {
						return; // 함수 종료
					}
					
					for(let i = 0; i < replyList.length; i++) {
						
						strAdd += "<div class='reply-wrap' style='display:none;'>";
                        strAdd += "<div class='reply-image'>";
                        strAdd += "<img src='../resources/img/profile.png'>";
                        strAdd += "</div>";
                        strAdd += "<div class='reply-content'>";
                        strAdd += "<div class='reply-group'>";
                        strAdd += "<strong class='left'>"+ replyList[i].replyId +"</strong>"; 
                 		strAdd += "<small class='left'>"+ timeStamp(replyList[i].replyDate) +"</small>";
                        strAdd += "<a href='" + replyList[i].rno + "' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
                        strAdd += "<a href='" + replyList[i].rno + "' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
                        strAdd += "</div>";
                        strAdd += "<p class='clearfix'>"+ replyList[i].reply +"</p>";
                        strAdd += "</div>";
						strAdd += "</div>";
						
					}
					
					$('#replyList').html(strAdd); // replyList영역에 문자열 형식으로 모든 댓글 추가
					
					// 화면에 댓글을 표현할 때 reply-wrap이 display: none으로 선언되어 있고
					// jQuery의 fadeIn 함수로 서서히 드러나도록 처리
					$('.reply-wrap').fadeIn(500);
					
				}
				
			); // end getJSON
			
		} // end getList()
		
		// 수정, 삭제
		/*		
		$('.replyModify').click(function(e) {
			e.preventDefault();
			console.log('수정 이벤트 발생');
			
		});
		ajax(getJSON, get) 함수의 실행이 더 늦게 완료 되기 때문에 실제 이벤트 선언이 먼저 실행하게 된다.
		화면에 댓글 관련 창은 아무것도 등록되지 않은 형태라 일반 클릭 이벤트는 동작하지 않는다.
		
		이미 존재하는 #replyList에 이벤트를 등록하고 이벤트를 자식에게 전파하여 사용하는 jQuery 이벤트 위임 함수를 반드시 사용해야 한다.
		*/
		
		
		$('#replyList').on('click', 'a', function(e) {
			e.preventDefault(); // 태그의 고유 기능 중지
			// 1. a태그 두개(수정, 삭제)이기 때문에 해당 버튼 확인
			// 수정, 삭제가 발생하는 댓글 번호가 몇 번인지 여부 확인
			const rno = $(this).attr('href');
			$('#modalRno').val(rno);
			
			// 2. 모달 창 하나를 이용해서 상황에 따라 수정 / 삭제 모달을 구분하기 위해 조건문 작성
			// hasClass()는 클래스 이름에 매개값이 포함되어 있다면 true, 없으면 false
			if($(this).hasClass('replyModify')) {
				// 수정 버튼을 눌렀기 때문에 수정 모달 형식으로 변경
				$('.modal-title').html('댓글 수정');
				$('#modalReply').css('display', 'inline');
				$('#modalModBtn').css('display', 'inline');
				$('#modalDelBtn').css('display', 'none'); // 수정 버튼을 눌렀기 때문에 삭제 버튼 숨김
				// jQuery를 이용한 모달 창 열기/닫기 ('show' / 'hide')
				// BootStrap에서 trigger를 통해 모달을 열고 닫았지만,
				// 해당 jsp에서는 trigger가 없기 때문에 jQuery를 이용해서 모달을 직접 열어준다.
				$('#replyModal').modal('show');
			} else {
				// 삭제 버튼을 눌렀기 때문에 삭제 모달 형식으로 변경
				$('.modal-title').html('댓글 삭제');
				$('#modalReply').css('display', 'none');
				$('#modalModBtn').css('display', 'none');
				$('#modalDelBtn').css('display', 'inline');
				$('#replyModal').modal('show');
			}
			
			
		}); // 수정, 삭제 버튼 클릭 이벤트
		
		// 수정 처리 함수 (수정 모달을 열어서 수정 내용 작성 후 수정 버튼을 클릭)
		$('#modalModBtn').click(function() {
			
			/*
			 * 1. 모달창에 rno값, 수정한 댓글 내용(reply), replyPw값을 얻는다.
			 * 2. ajax함수를 이용해서 post방식으로 reply/update 요청, 필요한 값은 JSON형식으로 처리해서 요청.
			 * 3. 서버에서는 요청받을 메서드 선언해서 비밀번호 확인하고, 비밀번호가 맞다면 수정 진행
			 *    만약 비밀번호가 틀렸다면 "pwFail"을 반환해서 '비밀번호가 틀렸습니다.' 경고창을 띄우기
			 * 4. 업데이트가 진행된 다음에는 modal창의 모든 값을 ''로 처리해서 초기화하고 modal창 닫기 
			 *    수정된 댓글 내용이 반영될 수 있도록 댓글 목록을 다시 불러 온다.
             */
             
            const reply = $('#modalReply').val();
			const rno = $('#modalRno').val();
			const replyPw = $('#modalPw').val();
			
			if(reply === '' || replyPw === '') {
				alert('내용, 비밀번호를 입력해주세요.');
				return;	
			}
			
			$.ajax({
				type : 'post',
				url : "<c:url value='/reply/update' />",
				contentType : 'application/json',
				data : JSON.stringify({
					'reply' : reply,
					'rno' : rno,
					'replyPw' : replyPw
				}),
				success : function(data) {
					console.log('통신성공' + data);
					if(data === 'modSuccess') {
						alert('정상 수정되었습니다.');
						$('#modalReply').val('');
						$('#modalPw').val('');
						$('#replyModal').modal('hide');
						getList(1, true);
					} else {
						alert('비밀번호를 확인하세요.');
						$('#modalPw').val('');
					}
				},
				error : function() {
					alert('수정에 실패했습니다.')
				}
					
			}); // end ajax(수정)
             
		}); // 모달 수정 처리 이벤트 함수
	
		// 삭제 처리 함수
		$('#modalDelBtn').click(function() {
			
			/*
			 * 1. 모달창에 rno값, replyPw값을 얻는다.
             * 2. ajax함수를 이용해서 POST방식으로 reply/delete 요청 필요한 값은 JSON 형식으로 처리해서 요청
             * 3. 서버에서는 요청을 받아서 비밀번호를 확인하고, 비밀번호가 맞으면 삭제 진행
             * 4. 만약 비밀번호가 틀린 경우 문자열을 반환해서 '비밀번호가 틀렸습니다.' 경고창을 띄운다. 
			 */
			
			const rno = $('#modalRno').val();
			const replyPw = $('#modalPw').val();
			
			if(replyPw === '') {
				alert('비밀번호를 입력해주세요.');
				$('#modalPw').focus();
				return;
			}
			
			$.ajax({
				type : 'post',
				url : "<c:url value='/reply/delete' />",
				data : JSON.stringify({
					'rno' : rno,
					'replyPw' : replyPw
				}),
				headers : {
					'Content-type' : 'application/json'
				},
				success : function(data) {
					console.log('통신성공' + data);
					if(data === 'delSuccess') {
						alert('댓글이 삭제 되었습니다.');
						$('#modalPw').val(''); // 비밀번호 초기화
						$('#replyModal').modal('hide'); // 모달 숨기기
						getList(1, true);
					} else {
						alert('비밀번호가 틀렸습니다.');
						$('#modalPw').val('');
						$('#modalPw').focus();
					}
				},
				error : function() {
					alert('삭제에 실패했습니다.')
				}
			}); // end ajax(삭제)
			
		}); // 모달 삭제 처리 이벤트 함수
		
		// 날짜 처리 이벤트 함수
		function timeStamp(millis) {
			
			const date = new Date(); // 현재 날짜
			// 현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
			const gap = date.getTime() - millis;
			
			let time; // 화면에 보여질 리턴되는 시간
			
			if(gap < 60 * 60 * 24 * 1000) { // 1일 미만인 경우
				if(gap < 60 * 60 * 1000) { // 1시간 미만인 경우
					time = '방금 전';
				
				} else { // 1시간 이상일 경우
					time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
				
				}
			
			} else { // 1일 이상일 경우
				const today = new Date(millis);
				const year = today.getFullYear(); // 년
				const month = today.getMonth() + 1; // 월
				const day = today.getDate(); // 일
				const hour = today.getHours(); // 시
				const minute = today.getMinutes(); // 분
				
				time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시 ' + minute + '분';
				
			}
			
			return time;
			
		}
		
	}); // end jQuery

</script>
