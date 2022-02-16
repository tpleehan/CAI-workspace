<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>    
    
<!-- form section-->
<section>
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-7 col-xs-10 login-form">
        <div class="titlebox">
          로그인
        </div>
        <form action="<c:url value='/user/login' />" method="post" id="loginForm">
          <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디">
          </div>
          <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호">
          </div>
          <div class="form-group">
            <button type="button" id="loginBtn" class="btn btn-info btn-block">로그인</button>
            <button type="button" class="btn btn-primary btn-block">회원가입</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<%@ include file="../include/footer.jsp"%>

<script>
	const msg = '${msg}';
	if(msg === 'joinSuccess') {
		alert('회원 가입 정상 처리 되었습니다.');
	} else if (msg === 'loginFail') {
		alert('로그인 실패. 아이디와 비밀번호를 확인하세요.');
	} 
	
	
	// 입력란이 공백인지 확인 후 공백이 아니라면 submit 진행
	// mapper에 작성한 login 메서드의 리턴 타입이 UserVO
	// 리턴 타입에 맞게 sql문을 작성
	
	$(function() {
		$('#loginBtn').click(function() {
			if($('#userId').val() === '') {
				alert('아이디를 입력하세요.');
				$('#userId').focus();
				return;
			} else if($('#userPw').val() === '') {
				alert('비밀번호를 입력하세요.');
				$('#userPw').focus();
				return;
			} else {
				$('#loginForm').submit();
			}
		});
	});

</script>