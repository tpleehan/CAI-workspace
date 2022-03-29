<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

	/* ---------------------- 공지사항상세 ---------------------- */
	/* 타이틀 */
	section.community-header {
    color: aliceblue;
    font-size: 30px;
    background-color: rgb(226, 188, 106);
    padding: 1em 0;
    }
	/* ---------- */
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
		margin-bottom: 200px;
	}
</style>

<div id="wrapper">
	<%@ include file="../include/header.jsp"%>
	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>공지사항</h2>
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
									<td class="t-title">제목</td>
									<td><input type="text" class="form-control"
										value="${article.noticeTitle}"></td>
								</tr>
								<tr>
									<td class="t-title">내용</td>
									<td><textarea class="form-control" rows="20">${article.noticeContent}</textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<form class="button" id="formObj" role="form"
							action="<c:url value='/board/freeBoardDelete' />" method="post">

							<input type="hidden" name="communityNo" value="${article.communityNo}">
							<input type="hidden" name="pageNum" value="${p.pageNum}"> 
							<input type="hidden" name="countPerPage" value="${p.countPerPage}">
							
							<input id="list-btn" class="btn" type="button" value="목록">&nbsp;&nbsp;

							<c:if test="${login.name == article.userNo}">
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

	<%@ include file="../include/footer.jsp"%>

</div>

<script>

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
				'action': '',
				'method': 'get'
			});
			$('#formObj').submit();
		});
	});
	
</script>
