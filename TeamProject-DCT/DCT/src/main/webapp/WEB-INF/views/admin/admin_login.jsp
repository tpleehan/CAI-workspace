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

    <title>Dream Come True 관리자 - Login</title>

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

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                            	<img class="logo" src="<c:url value='/img/logo.png' />" alt="logo">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
                                    </div>
                                    <form action="<c:url value='/admin/adminLoginCheck' />" id="adminLoginForm" class="user" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" name="adminId"
                                                id="adminId" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력해주세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="adminPw"
                                                id="adminPw" placeholder="비밀번호를 입력해주세요.">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" name="adminAutoLogin" id="autoLoginCheck">
                                                <label class="custom-control-label" for="autoLoginCheck">로그인 상태 유지</label>
                                            </div>
                                        </div>
                                        <button type="button" id="adminLoginBtn" class="btn btn-primary btn-user btn-block">로그인</button>
                                        <a href="javascript:loginWithKakao();" class="btn-kakao-login btn-user btn-block">
                                            <img class="kakao-login" src="<c:url value='/img/kakao_login_large_wide.png' />" alt="kakao-login">
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="<c:url value='/admin/admin_forgot-password' />">비밀번호 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="<c:url value='/admin/admin_register' />">계정 생성</a>
                                    </div>
                                </div>
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

	<!-- 카카오 API sdk -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

	<script>
	
		const msg = '${msg}';
		
		if(msg === 'adminJoinSuccess') {
			alert('회원 가입 정상 처리 되었습니다.');
		} else if(msg === 'adminLoginFail') {
			alert('로그인 실패. 아이디와 비밀번호를 확인해주세요.');
		}  else if(msg === 'adminLogout') {
			alert('로그아웃 되었습니다.');
		}
	
		//df373eef4355df05d43485c0c1b4e35f
		window.Kakao.init("df373eef4355df05d43485c0c1b4e35f");
		
		function loginWithKakao() {
			window.Kakao.Auth.login({
				scope: 'profile_nickname, account_email, gender',
				success: function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: function(response) {
							var accessToken = Kakao.Auth.getAccessToken();
							Kakao.Auth.setAccessToken(accessToken);
							console.log('response : ' + response);
							console.log('accessToken : ' + accessToken);
							alert('로그인 성공');
							location.href='/admin/admin_index';
						}
					});
				}
			});
			
		}
		
		$(function() {
			
			let adminChk1 = false, adminChk2 = false;
			
			// 관리자 로그인 id 입력값
			$('#adminId').keyup(function() {
				
				if($(this).val() === '') {
					alert('아이디를 입력하세요.');
					$('#adminId').focus();
					adminChk1 = false;
				} else {
					adminChk1 = true;
				}
				
			}); // 관리자 로그인 id 검증
			
			// 관리자 로그인 비밀번호 입력값
			$('#adminPw').keyup(function() {
				
				if($(this).val() === '') {
					alert('비밀번호를 입력하세요.');
					$('#adminPw').focus();
					adminChk2 = false;
				} else {
					adminChk2 = true;
				}
			}); // 관리자 로그인 비밀번호 검증
			
			
			// 로그인 버튼 클릭
			$('#adminLoginBtn').click(function() {
				
				if(adminChk1 && adminChk2) {
					const adminId = $('#adminId').val();
					const adminPw = $('#adminPw').val();
					const adminAutoLogin = $('#autoLoginCheck').is(':checked');
					
		            console.log('id: ' + adminId);
		            console.log('pw: ' + adminPw);
		            
		            const adminInfo = {
		                "adminId" : adminId,
		                "adminPw" : adminPw,
		                "adminAutoLogin" : adminAutoLogin
		            }
		            
		            
		            $.ajax({
		                type : "POST",
		                url : "/admin/adminLoginCheck",
		                contentType : "application/json",
		                dataType : "text",
		                data : JSON.stringify(adminInfo),
		                success : function(data) {
		                    if(data === 'adminIdFail') {
		                    	alert('아이디 또는 비밀번호가 틀렸습니다.')
		                        $('#adminId').val('');
		                        $('#adminId').focus(); 
		                        chk1 = false, chk2 = false;
		                    } else if(data === 'adminPwFail') {
		                    	alert('아이디 또는 비밀번호가 틀렸습니다.')
		                        $('#adminPw').val('');
		                        $('#adminPw').focus(); 
		                        chk2 = false;
		                    } else {
		                        alert('로그인 성공');
		                        location.href = '/admin/admin_index';
		                    }
		                },
		                
		                error : function() {
		                    console.log('통신 실패!');
		                    
		                } 
		                
		            }); //end ajax (로그인 비동기 처리)
		            
				} else {
					alert('입력 정보를 다시 확인해주세요.');
				}
				
			}); // 로그인 버튼 이벤트 끝
			
			
			
		});
		
		
	</script>


</body>

</html>