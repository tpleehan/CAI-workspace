<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>
    
<!-- form section-->
<section>
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-9 col-sm-12 join-form">
        <div class="titlebox">
          회원가입
        </div>
        <form action="<c:url value='/user/join' />" method="post" id="joinForm">
          <div class="form-group">
            <label for="id">아이디</label>
            <div class="input-group">
              <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디(영문 포함 4~12자 이상)">
              <div class="input-group-addon">
                <button type="button" class="btn btn-primary" id="idCheckBtn">아이디 중복체크</button>
              </div>
            </div>
            <span id="msgId"> * 필수 사항 입니다.</span> <!-- 아이디 중복 여부 메시지 공간 -->
          </div>
          <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호 (영 대/소문자, 숫자조합 8~16자">
            <span id="msgPw"></span> <!-- 비밀번호 유효성 메시지 공간-->
          </div>
          <div class="form-group">
            <label for="pw-confirm">비밀번호 확인</label>
            <input type="password" id="pwConfirm" class="form-control" placeholder="비밀번호를 확인해 주세요.">
            <span id="msgPw-check"></span> <!-- 비밀번호 유효성 메시지 공간-->
          </div>
          <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="userName" id="name" class="form-control" placeholder="이름을 입력하세요.">
          </div>
          <div class="form-group">
            <label for="hp">전화번호</label>
            <div class="input-group">
              <select class="form-control phone1" name="userPhone1" id="userPhone1">
                <option>010</option>
                <option>011</option>
                <option>017</option>
                <option>018</option>
              </select>
              <input type="text" name="userPhone2" id="hp" class="form-control" placeholder="전화번호를 입력하세요.">

            </div>
          </div>
          <div class="form-group email-form">
            <label for="email">이메일</label>
            <div class="input-group">
              <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일">
              <select class="form-control" name="userEmail2" id="userEmail2">
                <option>@naver.com</option>
                <option>@daum.net</option>
                <option>@gmail.com</option>
                <option>@hanmail.com</option>
                <option>직접 입력</option>
              </select>
              <div class="input-group-addon">
			    <button type="button" class="btn btn-primary" id="mail-check-btn">이메일인증</button>
              </div>
            </div>
            <div class="mail-check-box">
              <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력하세요." disabled="disabled" maxlength="6">
            </div>
            <span id="mail-check-warning"></span>
          </div>
          <div class="form-group">
            <label for="addr-num">주소</label>
            <div class="input-group">
              <input type="text" name="addrZipNum" id="addrZipNum" class="form-control" placeholder="우편번호" readonly>
              <div class="input-group-addon">
                <button type="button" class="btn btn-primary" onclick="searchAddress()">주소 검색</button>
              </div>
            </div>
          </div>
          <div class="form-group">
            <input type="text" name="addrBasic" id="addrBasic" class="form-control" placeholder="기본주소">
          </div>
          <div class="form-group">
            <input type="text" name="addrDetail"  id="addrDetail" class="form-control" placeholder="상세주소">
          </div>
          
          <div class="form-group">
            <button type="button" class="btn btn-lg btn-success btn-block" id="joinBtn">회원가입</button>
          </div>
          <div class="form-group">
            <button type="button" class="btn btn-lg btn-info btn-block">로그인</button>
          </div>
          
        </form>
      </div>
    </div>
  </div>
</section>

<%@ include file="../include/footer.jsp"%>

<!-- 카카오API 사용하기 위한 cdn -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>

<script>

	let code = ''; // 이메일 전송 인증번호 저장을 위한 변수
	
	// 아이디 중복 체크
	$('#idCheckBtn').click(function() {
		if($('#userId').val() === '') {
			alert('아이디는 필수값 입니다.')
			$('#userId').focus();
			return;
		}
		
		/*
		 * 아이디값을 받아와서 비동기 통신을 통해 서버와 통신하고 중복되었다면 '중복된 아이디입니다.',
		 * 아닐 경우 '사용 가능한 아이디입니다' 라고 화면에 띄운다.
		 * attr()를 이용해서 readonly 속성을 true를 주어서 작성하지 못하도록 처리한다.
		 */
		
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
	
	// 이메일 인증번호 전송
	$('#mail-check-btn').click(function() {
		const email = $('#userEmail1').val() + $('#userEmail2').val();
		console.log('완성된 이메일: ' + email);
		const checkInput = $('.mail-check-input'); // 인증번호 입력 하는 곳
		
		$.ajax({
			type : 'get',
			url : '<c:url value="/user/mailCheck?email=" />' + email,
			success : function(data) {
				console.log('data: ' + data);
				checkInput.attr('disabled', false);
				code = data;
				alert('인증번호 전송되었습니다. 확인 후 입력란에 정확히 입력하세요.');
			}
			
		}); // end ajax (이메일 인증번호 전송)
		
	}); // 이메일 인증번호 전송
	
	// 인증번호 비교
	// blur()는 focus가 벗어나면 이벤트 발생 
	$('.mail-check-input').blur(function() {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warning');
		
		if(inputCode === code) {
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color', 'green');
			$('#mail-check-btn').attr('disabled', true);
			// disabled를 적용하면 서버로 이동이 안된다. readonly인 읽기전용으로 해야 한다.
			$('#userEmail1').attr('readonly', true);
			$('#userEmail2').attr('readonly', true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
			$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
			
		} else {
			$resultMsg.html('인증번호를 다시 확인해 주세요.');
			$resultMsg.css('color', 'red');
		}
		
	}); // 인증번호 비교
	
	// 폼 데이터 검증(회원 가입 버튼을 눌렀을 경우)
	$('#joinBtn').click(function() {
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
	
	/* 
	// 행정안전부 주소 팝업
	function goPopup() {
		// 절대경로로 팝업창 오픈
		const pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
		
	}
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 콜백으로 받아온 데이터를 가입폼에 입력
		document.getElementById('addrBasic').value = roadAddrPart1;
		document.getElementById('addrDetail').value = addrDetail;
		document.getElementById('addrZipNum').value = zipNo;
		
	}
	 */

	// 카카오 주소 api 
    function searchAddress() {
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
                document.getElementById('addrZipNum').value = data.zonecode;
                document.getElementById("addrBasic").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrDetail").focus();
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
            document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";
        
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
