<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Come True 관리자 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="<c:url value='/css/sb-admin-2.min.css' />" rel="stylesheet">

	<style>
		.d-lg-block {
			position: relative;		
		}
		.d-lg-block .logo {
			margin: 0 auto;
			position: absolute;
			top: 50%;
			left: 55%;
			transform: translate(-50%, -50%);
			width: 90%;
		}
	</style>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block">
                    	<img class="logo" src="<c:url value='/img/logo.png' />" alt="logo">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">관리자 회원가입</h1>
                            </div>
                            <form class="user" action="<c:url value='/admin/adminJoin' />" method="post" id="adminJoinForm">
                                <div class="form-group row">
                                	<div class="col-sm-8 mb-3 mb-sm-0">
	                                    <input type="text" class="form-control form-control-user" name="adminId" id="adminId"
	                                        placeholder="아이디를 입력해주세요.">
                                	</div>
                         			<div class="col-sm-4">
	                                    <button type="button" class="btn btn-dark btn-user" id="adminIdCheckBtn">아이디 중복 확인</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="adminPw" name="adminPw" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="adminPwConfirm" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="adminName" name="adminName"
                                        placeholder="관리자의 성함을 입력해주세요.">
                                </div>
                                <button type="button" class="btn btn-primary btn-user btn-block" id="admin-signup-btn">
                                    회원가입 하기
                                </button>
                                <hr>
                            </form>
                            <div class="text-center">
                                <a class="small" href="<c:url value='/admin/admin_forgot-password' />">비밀번호 찾기</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="<c:url value='/admin/admin_login' />">이미 계정을 가지고 있나요?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/vendor/jquery/jquery.min.js' />"></script>
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js' />"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/js/sb-admin-2.min.js' />"></script>
    
    <script>
    	$(function() {
    		// 관리자 아이디 중복 체크
    		$('#adminIdCheckBtn').click(function() {
    			if($('#adminId').val() === '') {
    				alert('아이디는 필수값 입니다.')
    				$('#adminId').focus();
    				return;
    			}

    			const adminId = $('#adminId').val();
    			 
    			$.ajax({
    				type : 'post',
    				url: '<c:url value="/admin/adminIdCheck" />',
    				data : adminId,
    				contentType : 'application/json',
    				success : function(data) {
    					if(data === 'ok') {
    						$('#adminId').attr('readonly', true);
    						alert('사용 가능한 아이디 입니다.');
    					} else {
    						alert('아이디가 존재합니다.');
    						$('#adminId').focus();
    					}
    					
    				},
    				error : function() {
    					alert('통신 실패');
    				}
    			
    			}); // ajax admin id 중복 이벤트 끝 
    			 
    		}); // end adminIdCheckBtn 
    		
    		
    		// 회원가입 form 데이터 검증(입력값 없이 회원 가입 버튼 누른 경우)
    		$('#admin-signup-btn').click(function() {
    			if(!$('#adminId').attr('readonly')) {
    				alert('아이디 중복체크는 필수입니다.');
    				$('#adminId').focus();
    				return;
    			} else if($('#adminPw').val() === '' || $('#adminPw').val() !== $('#adminPwConfirm').val()) {
    				alert('비밀번호를 확인하세요.');
    				$('#adminPw').focus();
    				return;
    			} else if($('#adminName').val() === '') {
    				alert('이름은 필수입니다.');
    				$('#adminName').focus();
    				return;
    			} else {
    				$('#adminJoinForm').submit(); // 회원가입 폼 데이터 제출
    			}
    		}); // 관리자 회원가입 폼 데이터 검증처리 이벤트 끝

    		
    		/* 비밀번호 확인검사 */
    		$('#adminPwConfirm').keyup(function() {
    			if($('#adminPwConfirm').val() === $('#adminPw').val()) {
    				$('#adminPwConfirm').css('background-color', 'DeepSkyBlue');
    			} else {
    				$('#adminPwConfirm').css('background-color', 'red');
    			}
    		});
    		
		}); // end Jquery
    
    </script>

</body>

</html>