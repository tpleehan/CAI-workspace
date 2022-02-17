<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp" %>

<section>
     <!-- Toggleable / Dynamic Tabs 긁어옴 -->
     <div class="container">
         <div class="row">
             <div class="col-sm-12 col-md-10 col-lg-9 myInfo">
                 <div class="titlebox">
                     MEMBER INFO                    
                 </div>
                 
                 <ul class="nav nav-tabs tabs-style">
                     <li class="active"><a data-toggle="tab" href="#info">내정보</a></li>
                     <li><a data-toggle="tab" href="#myBoard">내글</a></li>
                     <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
                 </ul>
                 <div class="tab-content">
                     <div id="info" class="tab-pane fade in active">

                         <p>*표시는 필수 입력 표시입니다</p>
                         <form action="<c:url value='/user/userUpdate' />" method="post" id="updateForm">
                         <table class="table">
                             <tbody class="m-control">
                                 <tr>
                                     <td class="m-title">*ID</td>
                                     <td><input class="form-control input-sm" name="userId" value="${userInfo.userId}" readonly></td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*이름</td>
                                     <td><input class="form-control input-sm" value="${userInfo.userName}" readonly></td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*비밀번호</td> 
                                     <td><input type="password" class="form-control input-sm" id="userPw" name="userPw"></td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*비밀번호확인</td>
                                     <td><input type="password" class="form-control input-sm" id="userPwChk" name="userPwChk"></td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*E-mail</td>
                                     <td>
                                         <input class="form-control input-sm" name="userEmail1" value="${userInfo.userEmail1}">@
                                         <select class="form-control input-sm sel" name="userEmail2">
                                             <option ${userInfo.userEmail2 == '@naver.com' ? 'selected' : ''}>naver.com</option>
                                             <option ${userInfo.userEmail2 == '@gmail.com' ? 'selected' : ''}>gmail.com</option>
                                             <option ${userInfo.userEmail2 == '@daum.net' ? 'selected' : ''}>daum.net</option>
                                         </select>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*휴대폰</td>
                                     <td>
                                         <select class="form-control input-sm sel" name="userPhone1">
                                             <option ${userInfo.userPhone1 == '010' ? 'selected' : ''}>010</option>
                                             <option ${userInfo.userPhone1 == '011' ? 'selected' : ''}>011</option>
                                             <option ${userInfo.userPhone1 == '017' ? 'selected' : ''}>017</option>
                                             <option ${userInfo.userPhone1 == '018' ? 'selected' : ''}>018</option>
                                         </select>
                                         <input class="form-control input-sm" name="userPhone2" value="${userInfo.userPhone2}">
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*우편번호</td>
                                     <td><input class="form-control input-sm" id="addrZipNum" name="addrZipNum" value="${userInfo.addrZipNum}" readonly>
                                        <button type="button" class="btn btn-primary" id="addrBtn">주소찾기</button>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*주소</td>
                                     <td><input class="form-control input-sm add" id="addrBasic" name="addrBasic" value="${userInfo.addrBasic}" readonly></td>
                                 </tr>
                                 <tr>
                                     <td class="m-title">*상세주소</td>
                                     <td><input class="form-control input-sm add" id="addrDetail" name="addrDetail" value="${userInfo.addrDetail}"></td>
                                 </tr>
                             </tbody>
                         </table>
                         </form>

                         <div class="titlefoot">
                             <button type="button" class="btn" id="updateBtn">수정</button>
                             <button type="button" class="btn">목록</button>
                         </div>
                     </div>
                     <!-- 첫번째 토글 끝 (내 정보, 내가 쓴 글들을 탭으로 관리) -->
                     <div id="myBoard" class="tab-pane fade">
                         <p>*내 게시글 관리</p>
                         <form>
                         <table class="table">
                             <thead>
                                 <tr>
                                     <th>번호</th>
                                     <th>제목</th>
                                     <th>작성일</th>
                                 </tr>
                             </thead>
                             <tbody>
                             	<c:forEach var="vo" items="${userInfo.userBoardList}">
		                            <tr>
		                            	<td>${vo.bno}</td>
		                                <td>
											<a href="<c:url value='/freeBoard/freeDetail?bno=${vo.bno}' />">${vo.title}</a>
		                                </td>
		                                <td>${vo.regdate}</td>
		                             </tr>      
                             	</c:forEach>
                             </tbody>
                         </table>
                         </form>
                     </div>
                     <!-- 두번째 토글 끝 -->
                     <div id="menu2" class="tab-pane fade">
                         <h3>Menu 2</h3>
                         <p>Some content in menu 2.</p>
                     </div>
                 </div>
             </div>
         </div>
     </div>
</section>
 
<%@ include file="../include/footer.jsp" %>

<!-- 카카오API 사용하기 위한 cdn -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
 
<script>

	const msg = '${msg}';
	if(msg === 'updateSuccess') {
		alert('수정이 정상 처리 되었습니다.');
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
			} else if($('input[name=userEmail1]').val() === '') {		
				alert('이메일을 정확히 입력해 주세요.');
				$('input[name=userEmail1]').focus();
				return;
			} else if($('input[name=userPhone2]').val() === '') {		
				alert('전화번호를 정확히 입력해 주세요.');
				$('input[name=userPhone2]').focus();
				return;
			} else if($('input[name=addrDetail]').val() === '') {		
				alert('상세주소를 정확히 입력해 주세요.');
				$('input[name=addrDetail]').focus();
				return;
				
			} else {
				if(confirm('수정을 하실껀가요?')) {
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
		            document.getElementById('addrZipNum').value = data.zonecode;
		            document.getElementById("addrBasic").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById("addrDetail").focus();
		        }
		    }).open();
			
		});
		
	});
	
 
</script>
 