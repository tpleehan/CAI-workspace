<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<style>

/* ---------------------- 글수정 ---------------------- */
/* 타이틀 */
section.community-header {
	color: aliceblue;
	font-size: 30px;
	background-color: rgb(61, 58, 58);
	padding: 1em 0;
}
/* ---------- */
.community-modify .modify-body textarea {
	resize: none;
}

.community-modify .modify-body .modify-bottom {
	text-align: right;
	margin-bottom: 30px;
}

.modify-body .t-control .t-title {
	padding: 14px 8px;
}
</style>

<div id="wrapper">

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<h2>자유게시판</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="community-modify">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<div class="modify-body">
						<form action="<c:url value='/board/freeBoardUpdate' />"
							name="updateForm" method="post">
							<input type="hidden" name="communityNo" value="${article.communityNo}">
							<table class="table">
								<tbody class="t-control">
									<tr>
										<td class="t-title">글쓴이</td>
										<td><input type="text" class="form-control" name="userName"
											value="${article.userName}" readonly></td>
									</tr>
									<tr>
										<td class="t-title">제목</td>
										<td><input type="text" class="form-control" name="communityTitle"
											value="${article.communityTitle}"></td>
									</tr>
									<tr>
										<td class="t-title">내용</td>
										<td><textarea class="form-control" name="communityContent" rows="20">${article.communityContent}</textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="modify-bottom">
								<button type="button" class="btn" id="listBtn">목록</button>
								<button type="button" class="btn btn-warning" id="updateBtn">수정</button>
								<button type="button" class="btn btn-danger" id="delBtn">삭제</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</div>


<script>
	

	

	//목록 이동 처리
	$(function() {
		$('#listBtn').click(function() {
			location.href = "<c:url value='/board/freeBoardList' />"
		});
	});

	//수정 버튼 이벤트 처리
	/*
	1. 폼 데이터가 공백인지 확인 처리
	2. 공백이 없으면 Controller에 freeUpdate 요청으로 데이터를 전송
	3. 컨트롤러에서 처리가 완료된 후에 "게시글 수정이 정상 처리되었습니다."라는 알림창이
	글 상세보기 페이지에서 처리될 수 있도록 해 주세요.
	 */

	const $updateBtn = document.getElementById('updateBtn');
	$updateBtn.onclick = function() {
		if (document.updateForm.communityTitle.value == '') {
			alert('제목은 필수 항목 입니다.');
			document.updateForm.communityTitle.focus();
			return;
		} else if (document.updateForm.communityContent.value == '') {
			alert('내용은 필수 항목 입니다.');
			document.updateForm.communityContent.focus();
			return;
		} else {
			document.updateForm.submit();
		}
	}

	//삭제 이벤트 처리
	/*
	삭제같은 경우에는 번호가 노출되면 안되기 때문에 
	form태그를 이용해서 데이터를 전송시키세요. (post)
	action 속성을 delete에 맞게 바꿔서 전송하시면 됩니다.
	 */
	$('#delBtn').click(
			function() {
				if (confirm('정말 삭제하시겠습니까?')) {
					$('form[name=updateForm]').attr('action',
							'<c:url value="/board/freeBoardDelete" />');
					//document.updateForm.setAttribute('action', ~~~);
					$('form[name=updateForm]').submit();
				} else
					return;
			});
</script>


