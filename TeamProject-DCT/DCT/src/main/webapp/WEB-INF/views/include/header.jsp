<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dream Come True</title>
    
   	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/ec7c1dce8a.js" crossorigin="anonymous"></script>
    
   	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css' />">
    <link rel="stylesheet" href="<c:url value='/css/main.css' />">
    
    <!-- ck 에디터 관련 -->
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" /> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="<c:url value='/js/bootstrap.js' />"></script>
    
    <style>
		/* 맨위로가기 버튼 */
		a.top-control {
		    position: fixed;
		    right: 15px;
		    bottom: 15px;
		    border-radius: 5px;
		    color: #ffffff;
		    text-align: center;
		    width: 45px;
		    height: 45px;
		    font-size: 40px;
		    background-color:#323232; opacity:0.5; filter:alpha(opacity=50);
		    z-index: 999;
		    display: none;
		}
		
		a.top-control:hover{
			background-color:#000
		}

		/* 채팅 버튼 */ 
		.btn-chatting-link {
			font-size: 45px;
			position: fixed;
			background-color: transparent;
			right: 100px;
			bottom: 40px;
		}
		
	</style>	
    
</head>

<body> 
   
<header id="header">
	<nav class="navbar">
		<div class="container">
			<div class="logo">
				<a href="<c:url value='/' />" class="">
					<img class="logo" src="<c:url value='/img/logo.png' />" alt="header-logo">
				</a>
			</div>
			<div class="navbar-menu">
				<div class="navbar-left">
						<li><a role="button" href="<c:url value='/lecture/lecturePage' />" class="btn-lecture"><span>강의</span></a></li>
						<li><a role="button" href="<c:url value='/lecture/mentoringList' />" class="btn-mentoring"><span>멘토링</span></a></li>
						<li><a role="button" href="<c:url value='/board/freeBoardList' />" class="btn-community"><span>커뮤니티</span></a></li>
						<li><a role="button" href="#" class="btn-notice"><span>공지사항</span></a></li>
						<div class="effect"></div>
				</div>
				<div class="navbar-right">
					<div class="btn-movement">
						<c:choose>
							<c:when test="${login == null}">
								<li><a role="button" href="#" class="btn-login" data-toggle="modal" data-target="#loginModal">로그인</a></li>
								<li><a role="button" href="<c:url value='/user/userJoin' />" class="btn-sign-in">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li><a role="button" href="<c:url value='/user/userMypage' />" class="btn-mypage">마이페이지</a></li>
								<li><a role="button" href="<c:url value='/user/logout'/>" class="btn-logout">로그아웃</a></li>	
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>				
		</div>
	</nav>
</header>

<a href="#" class="top-control"><i class="fa-solid fa-angle-up"></i></a>

<button class="btn-chatting-link" onclick="window.open('chatting', 'chatting', 'width=550,height=650');">채팅</button>

<!-- Modal -->
<div id="loginModal" class="modal fade">
	<div class="modal-dialog">
		<form action="<c:url value='/user/loginCheck' />" method="post" id="loginForm">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="modal-header-logo">
					<img class="logo" src="<c:url value='/img/logo.png' />" alt="modal-header-logo">
				</div>
				<div class="modal-body">
					<input type="text" name="userId" id="signInId" placeholder="아이디를 입력해 주세요.">
					<input type="password" name="userPw" id="signInPw" placeholder="비밀번호를 입력해 주세요.">
				</div>
				<div class="modal-body-check">
					<input type="checkbox" name="auto-login" class="input-auto" checked="checked" id="auto-login"><p>자동로그인</p>
				</div>
				<div class="modal-sign-more">
					<a href="<c:url value='/user/userIdSearch' />">아이디 찾기</a>
					<a href="<c:url value='/user/userPwSearch' />">비밀번호 찾기</a>
					<a href="<c:url value='/user/userJoin' />">회원가입</a>
				</div>
				<div class="btn-modal-footer">
					<button type="button" id="loginBtn" class="btn btn-success" data-dismiss="modal" >로그인</button>
				</div>
				<div class="span-check">
					<span id="idCheck"></span>
					<span id="pwCheck"></span>
				</div>					
			</div>
		</form>
	</div>
</div>

</body>

<script>
	//Start Jquery
	$(function() {
		 
		let chk1 = false, chk2= false;
	
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 50) {
					$('.top-control').fadeIn();
				} else {
					$('.top-control').fadeOut();
				}
			});
			$('.top-control').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 200);
				return false;
			});
		});
		
		// 로그인 ID 입력값 검증(공백, 정규표현식)
		$('#signInId').keyup(function() {
			
	     	const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
	     	
			if($(this).val() === '') {
				$('#idCheck').css('background-color', 'pink');
				$('#idCheck').html('<b style="font-size: 14px; color: red;">[아이디를 입력해주세요.]</b>');
				chk1 = false;
			} else if(!getIdCheck.test($(this).val())) {
				$('#idCheck').css('background-color', 'pink');
				$('#idCheck').html('<b style="font-size: 14px; color: red;">[영문자, 숫자 포함 4-14자 입니다.]</b>');
				chk1 = false;
			} else {
				$('#idCheck').html('<b style="font-size: 14px; color: green;">[아이디 입력 완료]</b>');
				chk1 = true;
			}
		}); // 로그인 ID 검증
		
		// 로그인 비밀번호 입력값 검증 (공백, 정규표현식)
		$('#signInPw').keyup(function() {
			
			const getPwCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
			
			if($(this).val() === '') {
				$('#pwCheck').css('background-color', 'pink');
				$('#pwCheck').html('<b style="font-size: 14px; color: red;">[비밀번호를 입력해주세요.]</b>');
				chk2 = false;
			} else if(!getPwCheck.test($(this).val())) {
				$('#pwCheck').css('background-color', 'pink');
				$('#pwCheck').html('<b style="font-size: 14px; color: red;">[영문자, 숫자 포함 4-14자 입니다.]</b>');
				chk2 = false;
				
			} else {
				$('#pwCheck').html('<b style="font-size: 14px; color: green;">[비밀번호 입력 완료]</b>');
				chk2 = true;
			}
		}); // 로그인 비밀번호 검증
		
		$('#loginBtn').click(function() {
	        
	        if(chk1 && chk2) {
	            
	            const id = $('#signInId').val();
	            const pw = $('#signInPw').val();
	            
	            const autoLogin = $('#auto-login').is(':checked');
	            
	            console.log('id: ' + id);
	            console.log('pw: ' + pw);
	            
	            const userInfo = {
	                "userId" : id,
	                "userPw" : pw,
	                "autoLogin" : autoLogin
	            };
	            
	            $.ajax({
	                type : "POST",
	                url : "/user/loginCheck",
	                contentType : "application/json",
	                dataType : "text",
	                data : JSON.stringify(userInfo),
	                success : function(data) {
	                    if(data === 'idFail') {
	                        // console.log('아이디가 없습니다.');
	                        $('#signInId').css('background-color', 'pink');
	                        $('#signInId').html('<b style="font-size: 14px; color: red;">[아이디가 존재하지 않습니다.]</b>');
	                        $('#signInId').val('');
	                        $('#signInId').focus(); // 커서를 이동시키고, 스크롤도 해당 위치로 이동시키는 함수
	                        chk1 = false, chk2 = false;
	                        alert('아이디가 없습니다');
	                    } else if(data === 'pwFail') {
	                        // console.log('비밀번호가 틀렸습니다.');
	                        $('#signInPw').css('background-color', 'pink');
	                        $('#signInPw').html('<b style="font-size: 14px; color: red;">[비밀번호가 틀렸습니다.]</b>');
	                        $('#signInPw').val('');
	                        $('#signInPw').focus();
	                        chk2 = false;
	                    } else {
	                        // console.log('로그인 성공');
	                        alert('로그인 성공');
	                        location.href = '/';
	                    }
	                },
	                error : function() {
	                    console.log('통신 실패!');
	                    
	                } 
	                
	            }); //end ajax (로그인 비동기 처리)
	                
	        } else {
	            alert('입력 정보를 다시 확인하세요!');
	        }

	    }); //로그인 버튼 이벤트 끝
		
		/* 위로가기 버튼 */ 
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 50) {
					$('.top-control').fadeIn();
				} else {
					$('.top-control').fadeOut();
				}
			});
			$('.top-control').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 200);
				return false;
			});
		}); // 위로가기 버튼 이벤트 끝
		
	}); //end JQuery       

	
	
</script>

</html>