<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

	/* ---------------------- 글상세 ---------------------- */
	/* 타이틀 */
	section.community-header {
	    color: aliceblue;
	    font-size: 30px;
	    background-color: rgb(144, 173, 211);
	    padding: 1em 0;
	}

	.board-content .board-content-body .t-title {
		padding: 14px 8px;
	}
	
	.board-content .board-content-body .t-control textarea {
		resize: none;
	}
	
	.board-content .content-button {
		text-align: right;
	}
	
	.content-reply .content-button {
		text-align: right;
	}
	
	section.board-content div .button {
		text-align: right;
	}
	
	section.content-reply .reply-list .reply-prof {
		height: 40px;
		padding: 0;
		margin-bottom: 15px;
	}
	
	section.content-reply .reply-list .reply-prof>div {
		height: 40px;
		display: inline-block;
	}
	
	section.content-reply .reply-list .reply-prof img {
		width: 40px;
	}
	
	section.content-reply .reply-list .reply-prof .prof-name {
		font-size: 16px;
	}
	
	section.content-reply .reply-list .reply-prof .reply-date {
		font-size: 16px;
		margin-top: 8px;
	}
	
	section.content-reply .reply-list .reply-list-content textarea {
		margin: 0;
		overflow: visible;
		resize: none;
	}
	
	section.content-reply .reply-list .reply-list-content>div>a:nth-child(2),
		a:nth-child(3) {
		float: right;
	}
	
	section.content-reply .reply-form .reply-content textarea {
		margin: 20px 0 10px 0;
		resize: none;
	}
	
	section.content-reply .reply-form .content-button {
		margin-bottom: 10px;
		
	}
</style>

<div id="wrapper">
	<%@ include file="../include/header.jsp"%>
	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>자유게시판</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="board-content">
		<div class="container">
			<div class="row">
				<div class="content-wrap col-md-12">
					<div class="board-content-body">
						<table class="table">
							<tbody class="t-control">
								<tr>
									<td class="t-title">글쓴이</td>
									<td><input type="text" class="form-control"
										value="${article.userName}" readonly></td>
								</tr>
								<tr>
									<td class="t-title">제목</td>
									<td><input type="text" class="form-control"
										value="${article.communityTitle}"><input type="hidden" value="${article.userNo}"></td>
								</tr>
								<tr>
									<td class="t-title">내용</td>
									<td><textarea class="form-control" rows="20">${article.communityContent}</textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<form class="button" id="formObj" role="form"
							action="<c:url value='/board/freeBoardDelete' />" method="post">
							<input type="hidden" name="userName" value="${article.userName}">
							<input type="hidden" name="communityNo" value="${article.communityNo}">
							
							
							<input id="list-btn" class="btn" type="button" value="목록">&nbsp;&nbsp;

							<c:if test="${login.userName == article.userName}">
								<input id="mod-btn" class="btn btn-warning" type="button" value="수정">&nbsp;&nbsp;
		         				<input class="btn btn-danger" type="submit" value="삭제"
									onclick="return confirm('정말로 삭제하시겠습니까?')">&nbsp;&nbsp;
       						</c:if>
       						
						</form>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</section>

	<section class="content-reply">
		<div class="container">
			<div class="row">
					
				<div class="reply-wrap col-md-12">
					<!-- 댓글 작성 공간 -->
					<div class="reply-form">
						<form action="#">
							<div class="col-md-12 reply-content">
								<textarea class="form-control" id="replyText" rows="4">댓글 작성 내용</textarea>
							</div>
							<div class="col-md-12 content-button">
								<button class="btn btn-primary" id="boardReplyRegist">등록</button>
							</div>
						</form>
					</div>
						
					<!-- 댓글 목록 공간 -->
					<div class="col-md-12 reply-list" id="replyList">
					<!--  
						<div class="reply-list-prof">
							<div class="col-md-12 reply-prof">
								
								<div>
									<span class="prof-name">이름</span> &nbsp;&nbsp;
									<span class="reply-date">2022-02-01</span>	
								</div>
							</div>
							<div class="reply-list-content">
								<div class="reply-group">
									<textarea class="form-control col-md-12" name="" id=""
										rows="auto">댓글
										</textarea>
									<a href="#"><span class="glyphicon glyphicon-pencil"></span>수정</a>
									<a href="#"><span class="glyphicon glyphicon-remove"></span>삭제</a>
								</div>
							</div>
						</div>
					</div> 
					-->
						<!-- reply-list close -->
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
				<button type="button" class="btn btn-default pull-right"
					data-dismiss="modal">닫기</button>
				<h4 class="modal-title">댓글수정</h4>
			</div>
			<div class="modal-body">
				<!-- 수정폼 id값을 확인하세요-->
				<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply"
						placeholder="내용입력"></textarea>
					<div class="reply-group clearfix">
						<div class="reply-input">
							<input type="hidden" id="modalRno"> 
							<input type="hidden" class="form-control" value="${article.userNo}" id="modalUserNo">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
					</div>
				</div>
				<!-- 수정폼끝 -->
			</div>
		</div>
	</div>
</div>

	<%@ include file="../include/footer.jsp"%>

</div>

<script>

	const msg = '${msg}';
	if (msg != '') {
		alert(msg);
	}

	//제이쿼리 시작
	$(document).ready(function() {
		//목록 버튼 클릭 이벤트 처리.
		$('#list-btn').click(function() {
			console.log('목록 버튼이 클릭됨!');
			location.href='/board/freeBoardList?pageNum=${p.pageNum}&countPerPage=${p.countPerPage}'
			+ '&keyword=${p.keyword}&condition=${p.condition}';
		});
		
		//수정 버튼 클릭 이벤트 처리
		$('#mod-btn').click(function() {
			$('#formObj').attr({
				'action': '<c:url value="/board/freeBoardModify" />',
				'method': 'get'
			});
			$('#formObj').submit();
		});
	});
	
	
	
	
	
	//댓글 등록
	$(document).ready(function() {
		
		$('#boardReplyRegist').click(function(){
			const communityNo = '${article.communityNo}';
			const replyText = $('#replyText').val();
			const replyWriter = '${login.userName}';
			const userNo = '${article.userNo}';
			
			
			if(replyText === '' || communityNo === '' || replyWriter === ''){
				alert('로그인 또는 내용을 입력해주세요');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/freeReply/boardReplyRegist" />',
				data: JSON.stringify(
					{
						"communityNo": communityNo,
						"replyText": replyText,
						"replyWriter": replyWriter,
						"userNo": userNo
				}
			),
			dataType: 'text',
			contentType: 'application/json',
			success: function(data) {
				console.log('통신성공!' + data);
				$('#replyText').val('');
				getList(1,true);
			},
			error: function(){
					alert('댓글 등록에 실패했습니다. 관리자에게 문의하세요');				
				
				}
			}); //ajax끝
		});//댓글 등록하기 close
			
		//더보기 버튼처리(클릭 시 전역변수 페이지번호에 +1값을 전달)
		$('#moreList').click(function() {
			getList(++page, false)
			
		});//더보기 버튼처리 close
		
		
		//목록 요청
		let page = 1;
		let strAdd = '';
		
		getList(1,true);
		
		function getList(pageNum, reset) {
			
			const communityNo = '${article.communityNo}';
			
			$.getJSON(
			 	"<c:url value='/freeReply/getList/' />" + communityNo + '/' + pageNum,
			 	function(data) {
			 		console.log(data);
			 		
			 		let total = data.total; // 총 댓글수
			 		console.log('총 댓글수: '+ total);
			 		
			 		let replyList = data.list;//댓글 리스트
			 		
			 		if(reset === true) {
			 			strAdd ='';
			 			page = 1;
			 		}
			 		
			 		console.log('현재 페이지: ' + page);
			 		
			 		if(total <= page * 5) {
			 			$('#moreList').css('display', 'none');
			 		} else {
			 			$('#moreList').css('display', 'block');
			 		}
			 		
			 		if(replyList.length <= 0) {
			 			return;
			 		}
			 		
			 		for(let i=0; i<replyList.length; i++){
			 		strAdd += "<div class='reply-list-prof' style='' >";
			 			strAdd += "<div class='col-md-12 reply-prof'>";
			 			strAdd += "<div>";
			 			strAdd += "<span class='prof-name'>" + replyList[i].replyWriter +"</span> &nbsp;&nbsp;";
			 			strAdd += "<span class='reply-date'>"+ replyList[i].replyDate +"</span>";
			 			strAdd += "</div>";
			 			strAdd += "</div>";
			 			strAdd += "<div class='reply-list-content'>";
			 			strAdd += "<div class='reply-group'>";
			 			strAdd += "<textarea class='form-control col-md-12' name='' id='' rows='auto'>"+ replyList[i].replyText +"</textarea>";
			 			strAdd += "<a href='" + replyList[i].rno + "' class='replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
                        strAdd += "<a href='" + replyList[i].rno + "' class='replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
                        strAdd += "</div>";
                        strAdd += "</div>";
                    strAdd += "</div>";
                    console.log(strAdd)
			 		}
			 		$('#replyList').html(strAdd);
			 		$('.reply-wrap').fadeIn(500);
			 		
			 	}
			);//end getJson
			
		}//end getList
			
		
		//댓글& 삭제 버튼 이벤트
		$('#replyList').on('click', 'a', function(e) {
			e.preventDefault();	
			
			const rno = $(this).attr('href');
			$('#modalRno').val(rno);
			
			if($(this).hasClass('replyModify')) {
				$('.modal-title').html('댓글 수정');
				$('#modalReply').css('display', 'inline');
		        $('#modalModBtn').css('display', 'inline');
		        $('#modalDelBtn').css('display', 'none');
		        $('#replyModal').modal('show');
			} else {
				$('.modal-title').html('댓글 삭제');
	            $('#modalReply').css('display', 'none');
	            $('#modalModBtn').css('display', 'none');
	            $('#modalDelBtn').css('display', 'inline');
	            $('#replyModal').modal('show');  
			}
		});	//수정 or 삭제 버튼 클릭 이벤트 end

		//수정 처리함수
		$('#modalModBtn').click(function(){
			
			const replyText =$('#modalReply').val();
			const rno =$('#modalRno').val();
			const userNo = $('#modalUserNo').val();
			
			console.log(replyText);
			console.log(rno);
			console.log(userNo);
			if(replyText ==='') {
				alert('내용을 확인해 주세요!');
				return;
			} 
			
			$.ajax({
				type: 'post',
				url: "<c:url value='/freeReply/update' />",
				contentType: 'application/json',
				data: JSON.stringify({
					'replyText' : replyText,
					'rno' : rno,
					'userNo' : userNo
				}),
				success: function(data){
					if(data === 'modSucesss') {
						alert('정상 수정되었습니다.');
						$('#modalReply').val('');
		                $('#replyModal').modal('hide');
		                getList(1, true);
					} else {
						alert('다른 회원이 작성한 글입니다.');
					}
				},
				error : function() {
					alert('수정에 실패했습니다. 관리자에게 문의하세요');
				}						
					
			});//ajax 끝
		                  
		}); //수정처리함수 끝
					
		
		//삭제함수
		$('#modalDelBtn').click(function(){
			
			const rno = $('#modalRno').val();
			const userNo = $('modalUserNo').val();
			
			if(userNo=== ''){
				alert('로그인을 해주세요');
			 	return;
			}
			
			$.ajax({
				type:'post',
				url: "<c:url value='/freeReply/delete' /> ",
				data: JSON.stringify({
					'rno': rno,
					'userNo': userNo
				}),
				headers : {
					'Content-type' : 'application/json'
				},
				success : function(data) {
					if(data === 'delSuccess'){
						alert('댓글이 삭제되었습니다.');
						$('#replyModal').modal('hide'); //모달 내리기
						getList(1, true);
					} else{
						alert('등록회원이 아닙니다.');
					}
				},
				error: function() {
					alert('삭제에 실패했습니다. 관리자에게 문의하세요');
				}
						
			});//삭제 비동기 통신 끝
			
			
		});// 삭제함수 end
			
		
		//날짜 처리 함수         
	      function timeStamp(millis) {
	         
	         const date = new date(); //현재 날짜
	         //현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
	         const gap = date.getTime() - millis;
	         
	         let time; //리턴할 시간
	         if(gap < 60 * 60 * 24 * 1000) { //1일 미만일 겨우
	            if(gap < 60 * 60 * 1000) {//1시간 미만일 경우
	               time = '방금 전';
	            } else { //1시간 이상일 경우
	               time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
	            }
	         }  else { //1일 이상일 경우
	            const today = new Date(millis);
	            const year = today.getFullyear(); //1년   
	            const month = today.getMonth() + 1; //월 , +1을 안하면 0월이 나온다
	            const day = today.getDate(); //일
	            const hour = today.getHours();//시
	            const minute = today.getMinutes();//분	
	            
	            time = year +'년' + month + '월' + day + '일' + hour + '시' + minute + '분';
	            
	         }
	         
	         return time;
	      }	
			
		
		
		
		
		
	}); //댓글 기능 close
	
	
</script>
