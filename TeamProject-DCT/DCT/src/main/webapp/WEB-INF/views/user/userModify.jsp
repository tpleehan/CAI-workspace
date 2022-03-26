<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <style>
        /* 회원 정보 수정 */
        
    .modify_header .line{
        margin-bottom: 2rem;
        padding-bottom: 2rem;
        border-bottom: 0.2rem solid #424242;
    }

    .modify_header .big_class .user_info p {
        font-size: 1.5rem;
        color: black;
    }

    .modify_header .big_class .user_info .user_selection input  {
        border: 1px solid #000000;
        width: 200px;
    }

    .modify_header .big_class .hi #email-agree {
        border: 1px solid #000;
        width: 10px;
        height: 10px
    }

    .big_class input {
        width: 150px;
    }

    .big_class #address, #address_extra {
        width: 300px;
    }
    
    .user_selection #userAddress, #userAddressDetails {
    	width: 300px;
    }
    </style>

<%@ include file="../include/header.jsp"%>


<body>

    <div id="wrapper">

        <section>
            <div class="mypage_header">
                <div class="container">
                    <h2>마이페이지</h2>
                </div>
            </div>

            <div class="container">
                <div class="columns">
                    <div class="col-md-3">
                        <div class="aside_menu">
                            <aside class="sidebar_left">
                                <div class="menu_container">
                                    <p class="menu-label">학습 관리</p>
                                    <ul class="menu-list">
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>내가 본 강의</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>내가 올린 강의</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>작성한 게시글</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>멘토링</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <p class="menu-label">수강 신청 관리</p>
                                    <ul class="menu-list">
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>수강바구니</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>위시리스트</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>쿠폰함</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="btn_wrap " href="#">
                                                <span>구매내역</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <p class="menu-label">설정</p>
                                    <ul class="menu-list">
                                        <li>
                                            <a class="btn_wrap " href="/user/userModify">
                                                <span>프로필</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </aside>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <section class="modify_header">
                            <div class="big_class">
                                <h3>기본 정보 수정</h3>
                                <div class="line"></div>
                       		  		<form action="<c:url value='/user/userUpdate' />" method="post" id="updateForm">
                                    <ul class="user_info">
                                        <li>
                                            <p>이름</p>
                                        </li>
                                        <ul class="user_selection">
                                            <input id="user-name" type="text" name="name" value="${userInfo.userName}" minlength="2" readonly>
                                        </ul>
                                        <li>
                                            <p>아이디</p>
                                        </li>
                                        <ul class="user_selection">
                                            <input id="user-id" type="text" name="userId" value="${userInfo.userId}" minlength="2" readonly>
                                        </ul>
                                        <li>
                                            <p>이메일</p>
                                        </li>
                                        <ul class="user_selection">
                                            <input id="user-email" type="text" name="userEmail" minlength="2" value="${userInfo.userEmail}">
                                        </ul>
                                        <li>
                                            <p>휴대전화</p>
                                        </li>
                                        <ul class="user_selection">
                                            <input id="user-phone" type="text" name="userPhone" minlength="2" value="${userInfo.userPhone}">
                                        </ul>
                                        <li>
                                            <p>변경할 비밀번호</p>
                                        </li>
                                        <ul class="user_selection">
                                            <input type="password" id="userPw" type="text" name="userPw" minlength="2">
                                        </ul>
                                        <li>
                                            <p>변경할 비밀번호 확인</p>
                                        </li>
                                        <ul class="user_selection">
                                            <input type="password" id="userPwChk" type="text" name="userPwChk" minlength="2">
                                        </ul>
                                    </ul>
                                <h3>기본 배송 정보</h3>
                                <div class="line"></div>
                                    <ul class="user_info">
                                        <ul class="user_selection">
                                            <input type="text" id="userZipcode" name="userZipcode" value="${userInfo.userZipcode}" readonly>
                                            <button type="button" id="addrBtn"><span>검색</span></button><br><br>
                                            <input type="text" id="userAddress" name="userAddress" value="${userInfo.userAddress}" placeholder="검색 버튼으로 주소를 검색해 주세요" readonly><br><br>
                                            <input type="text" id="userAddressDetails" name="userAddressDetails" value="${userInfo.userAddressDetails}" placeholder="상세 주소를 입력해 주세요.">
                                    	</ul>
                                    </ul>
                                </form>
                            </div>
                            <div class="big_class">
                                <div class="line"></div>
                                <ul class="hi">
                                    <p>
                                        <span><input type="checkbox" id="email-agree"> 마케팅 수신 동의에 동의합니다.</span>
                                    </p>
                                </ul>
                                <button type="button" id="updateBtn" class="ac-button is-lg is-solid is-primary e-sign-up-button form__button ">수정하기</button>
                                <p><a href="<c:url value='/user/userDelete' />">계정 삭제하기</a></p>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </div>

<%@ include file="../include/footer.jsp"%>

<!-- 카카오API 사용하기 위한 cdn -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
 
<script>
	const msg = '${msg}';
	if(msg === 'updateSuccess') {
		alert('수정 정상 처리 되었습니다.');
	}
	$(function() {
		// 비밀번호가 올바른 정규표현식대로 작성이 되었는지 검증
		// 정규표현식에 맞지 않는 값이라면 alert()으로 검증
		// 나머지 입력창 빈칸 여부를 확인해서 모두 작성이 잘 될 경우 submit()처리
		const regex = /^[A-Za-z0-9+]{4,12}$/;
		
		$('#updateBtn').click(function() {
			// 비밀번호 검증
			if($('#userPw').val() === '') {
				alert('비밀번호는 필수 입력 입니다.');
				$('#userPw').focus();
				return;
			} else if(!regex.test($('#userPw').val())) {
				alert('비밀번호는 8~16자로 작성해 주세요.');
				$('#userPw').focus();
				return;
			} else if($('#userPw').val() !== $('#userPwChk').val()) {
				alert('비밀번호가 일치하지 않습니다. 비밀번호 확인란을 다시 작성해 주세요.');
				$('#userPwChk').focus();
				return;
				
			// 나머지 입력창 빈칸 여부 확인
			} else if($('#userEmail').val() === '') {		
				alert('이메일을 정확히 입력해 주세요.');
				$('#userEmail').focus();
				return;
			} else if($('#userPhone').val() === '') {		
				alert('전화번호를 정확히 입력해 주세요.');
				$('#userPhone').focus();
				return;
			} else if($('#userAddressDetails').val() === '') {		
				alert('상세주소를 정확히 입력해 주세요.');
				$('#userAddressDetails').focus();
				return;
				
			} else {
				if(confirm('수정할까요?')) {
					$('#updateForm').submit();
				} else {
					return;
				}
			}
		}); // 수정 버튼 이벤트
		
		// 카카오 주소 api를 수정페이지에서 똑같이 사용할 수 있도록 이벤트 처리
		$('#addrBtn').click(function() {
			new daum.Postcode({
		    		oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수
		
		            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }
		
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('userZipcode').value = data.zonecode;
		            document.getElementById("userAddress").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById("userAddressDetails").focus();
		        }
		    }).open();
			
		});
		
	});
	
 
</script>
