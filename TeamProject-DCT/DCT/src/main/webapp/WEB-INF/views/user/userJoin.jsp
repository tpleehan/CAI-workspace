<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <style>
    
        
    #main {
        min-height: 800px;
        display: block;
    }
    :after, :before {
        box-sizing: inherit;
    }

    .join-form .titlebox h4 {
        text-align: center;
    }

    .join-group {
        border-radius: 8px;
        width: 600px;
        margin: 0 auto;
        padding: 15px; 
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15)
    }

    .form-join {
        display: flex;
        flex-direction: column;
    }

    :after, :before {
        box-sizing: inherit;
    }

    .userJoinForm {
        display: block;
        margin-top: 0em;
    }


    .ac-button.is-solid.is-primary {
        border-color: rgba(233, 161, 233, 0.651);
        font-weight: 700;
        background-color: rgba(233, 161, 233, 0.651);
    }

    .pg_signup .form__button {
        margin-top: 16px;
        margin-bottom: 12px;
    }

    .ac-button.is-solid {
        border: 1px solid;
        color: #fff;
    }

    .ac-button.is-lg {
        padding: 0 16px;
        height: 48px;
        line-height: 1.47;
        font-size: 15px;
        letter-spacing: -.3px;
    }

    .ac-button.is-primary {
        border-color: rgba(233, 161, 233, 0.651);
        font-weight: 700;
        background-color: rgba(233, 161, 233, 0.651);
    }

    .ac-button {
        position: relative;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 4px;
        line-height: 1.47;
        font-weight: 500;
        cursor: pointer;
        -webkit-appearance: none;
        padding: 0 12px;
       	width: 100%;
        line-height: 1.43;
        font-size: 14px;
        letter-spacing: -.3px;
        border: 1px solid;
        color: #fff;
    }
    

/* 회원가입 종료 */
    </style>

<%@ include file="../include/header.jsp"%>

<div id="wrapper">
	<header data-include-path="./include/header.html"></header>

	<main id="main">
		<section class="signup">
			<div class="container">
				<div class="row">
					<div class="join-form">
						<div class="titlebox">
							<h4>회원가입</h4>
						</div>
						<div class="join-group">
							<form action="<c:url value='/user/join' />" method="post" id="joinForm">
								<div class="form-group">
									<label for="id">ID</label>
										<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디(영문 포함 4~12자 이상)">
										<button type="button" class="btn btn-primary" id="idCheckBtn">아이디 중복체크</button>
									<span id="msgId">*필수 사항입니다.</span>
									<!--아이디 중복 여부 메시지 공간-->
								</div>
								 <div class="form-group">
                                <label for="email">이메일</label>
                                    <input type="text" id="userEmail" name="userEmail" class="form-control" placeholder="유효한 이메일을 입력해 주세요.">
                           		 </div>
								<div class="form-group">
									<label for="password">Password</label> <input type="password"
										id="userPw" class="form-control" name="userPw"
										placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자)"> <span
										id="msgPw"></span>
									<!--비밀번호 유효성 메세지 공간-->
								</div>
								<div class="form-group">
									<label for="pw-confirm">Password</label> <input type="password"
										id="pwConfirm" class="form-control"
										placeholder="비밀번호를 확인해 주세요."> <span id="msgPw-c"></span>
									<!--비밀번호 유효성 메세지 공간-->
								</div>
								<div class="form-group">
									<label for="name">Name</label> <input type="text" id="name" name="userName"
										class="form-control" placeholder="이름을 입력해 주세요."> <span
										id="msgPw-c"></span>
									<!--비밀번호 유효성 메세지 공간-->
								</div>
								<div class="form-group">
									<label for="hp">Phone</label>
										<input type="tel" id="hp" class="form-control" id="userPhone" name="userPhone"
											placeholder="전화번호를 입력해 주세요.">
								</div>
								<div class="form-group">
									<label for="addr-num">Address</label>
									<div class="input-group">
										<input type="text" id="userZipcode" class="form-control" name="userZipcode"
											placeholder="우편번호" onclick="searchAddress()">
									</div>
								</div>
								<div class="form-group">
									<input type="text" id="userAddress" name="userAddress" class="form-control" placeholder="기본주소" readonly>
								</div>
								<div class="form-group">
									<input type="text" id="userAddressDetails" name="userAddressDetails" class="form-control" placeholder="상세주소">
								</div>

								<div class="form-group">
									<button type="button" class="ac-button is-lg is-solid is-primary e-sign-up-button form__button " id="signup-btn" >회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>

<%@ include file="../include/footer.jsp"%>

<!-- 카카오API 사용하기 위한 cdn -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>


// 아이디 중복 체크
$('#idCheckBtn').click(function() {
	if($('#userId').val() === '') {
		alert('아이디는 필수값 입니다.')
		$('#userId').focus();
		return;
	}

	const userId = $('#userId').val();
	 
	$.ajax({
		type : 'post',
		url: '<c:url value="/user/idCheck" />',
		data : userId,
		contentType : 'application/json',
		success : function(data) {
			if(data === 'ok') {
				$('#userId').attr('readonly', true);
				$('#msgId').html('사용 가능한 아이디 입니다.');
			} else {
				$('#msgId').html('중복된 아이디 입니다.');
				$('#userId').focus();
			}
			
		},
		error : function() {
			alert('통신 실패');
		}
	
	}); // ajax id 중복 
	 
}); // end idCheckBtn 


// 폼 데이터 검증(회원 가입 버튼을 눌렀을 경우)
$('#signup-btn').click(function() {
	if(!$('#userId').attr('readonly')) {
		alert('아이디 중복체크는 필수입니다.');
		$('#userId').focus();
		return;
	} else if($('#userPw').val() === '' || $('#userPw').val() !== $('#pwConfirm').val()) {
		alert('비밀번호를 확인하세요.');
		$('#userPw').focus();
		return;
	} else if($('#name').val() === '') {
		alert('이름은 필수입니다.');
		$('#name').focus();
		return;
	} else {
		$('#joinForm').submit(); // 폼 데이터 제출
	}
	
}); // 폼 데이터 검증처리


function searchAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            document.getElementById('userZipcode').value = data.zonecode;
            document.getElementById("userAddress").value = addr;
            document.getElementById("userAddressDetails").focus();
        }
    }).open();
}

/* 아이디 형식 검사 스크립트 */
var id = document.getElementById("userId");
id.onkeyup = function() {
    /* 자바스크립트의 정규표현식 입니다 */
    /* test메서드를 통해 비교하며, 매칭되면 true, 아니면 false 반환 */
    var regex = /^[A-Za-z0-9+]{4,12}$/; 
    if(regex.test(document.getElementById("userId").value )) {
        document.getElementById("userId").style.borderColor = "green";
        document.getElementById("msgId").innerHTML = "아이디 중복체크는 필수 입니다";
    
    } else {
        document.getElementById("userId").style.borderColor = "red";
        document.getElementById("msgId").innerHTML = "4글자 이상, 12글자 이하로 작성하세요.";
    }
}
/* 비밀번호 형식 검사 스크립트 */
var pw = document.getElementById("userPw");
pw.onkeyup = function(){
    var regex = /^[A-Za-z0-9+]{8,16}$/;
     if(regex.test(document.getElementById("userPw").value )) {
        document.getElementById("userPw").style.borderColor = "green";
        document.getElementById("msgPw").innerHTML = "사용가능합니다";
    } else {
        document.getElementById("userPw").style.borderColor = "red";
        document.getElementById("msgPw").innerHTML = "비밀번호는 8자 이상이어야 합니다.";
    }
}
/* 비밀번호 확인검사 */
var pwConfirm = document.getElementById("pwConfirm");
pwConfirm.onkeyup = function() {
    var regex = /^[A-Za-z0-9+]{8,16}$/;
    if(document.getElementById("pwConfirm").value == document.getElementById("userPw").value ) {
        document.getElementById("pwConfirm").style.borderColor = "green";
        document.getElementById("msgPw-check").innerHTML = "비밀번호가 일치합니다";
    } else {
        document.getElementById("pwConfirm").style.borderColor = "red";
        document.getElementById("msgPw-check").innerHTML = "비밀번호 확인란을 확인하세요";
    }
}


</script>
