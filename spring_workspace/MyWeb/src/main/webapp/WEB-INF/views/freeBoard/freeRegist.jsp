<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
    
<section>
  <div class="container">
    <div class="row">
      <div class="col-xs-12 write-wrap">
        <div class="titlebox">
          게시판 글쓰기
        </div>
        
        <form action="<c:url value='/freeBoard/registForm' />" name="registForm" method="post">       
          <table class="table">
            <tbody class="t-control">
              <tr>
                <td class="t-title">NAME</td>
                <td><input type="text" class="form-control" name="writer"></td>
              </tr>
              <tr>
                <td class="t-title">TITLE</td>
                <td><input type="text" class="form-control" name="title"></td>
              </tr>
              <tr>
                <td class="t-title">CONTENT</td>
                <td><textarea class="form-control" rows="10" name="content"></textarea></td>
              </tr>
            </tbody>
          </table>

          <hr>
          <div class="titlefoot">
            <button class="btn" id="registBtn">등록</button>
            <button class="btn" id="listBtn">목록</button>
          </div>

        </form>
      </div>
    </div>
  </div>
</section>

<%@ include file="../include/footer.jsp"%>

<script>
	
	const $registBtn = document.getElementById('registBtn');
	
	$registBtn.onclick = function() {
		// form태그는 document.폼 네임으로 바로 접근이 가능하다.
		if(document.registForm.writer.value === '') {
			alert('작성자는 필수 항목입니다.');
			document.registForm.writer.focus();
			return; // 강제 종료
		} else if (document.registForm.title.value === '') {
			alert('제목은 필수 항목입니다.');
			document.registForm.title.focus()
			return; // 강제 종료
		} else if (document.registForm.content.value === '') {
			alert('내용은 필수 항목입니다.');
			document.registForm.content.focus()
			return; // 강제 종료
		} else {
			document.registForm.submit();
			
		}
		
	}
	
	/*
	$(function() {
		$('#registBtn').click(function() {
			if($('input[name=writer]').val() === '') {
				alert('작성자는 필수 항목입니다.');
				$('input[name=writer]').focus();
				return;
			} else if ($('input[name=title]').val() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=title]').focus();
				return;
			} else if ($('input[name=content]').val() === '') {
				alert('내용은 필수 항목입니다.');
				$('input[name=content]').focus();
				return;
			}
		});
	});
	*/
	
	$('#listBtn').click(function() {
		if(confirm('목록으로 돌아갈껀가요?')) {
			location.href="<c:url value='/freeBoard/freeList' />";
		} else {
			return;
		}
	});
	
</script>