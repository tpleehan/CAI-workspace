<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

var bDisplay = false;
function doDisplay(){
	var con = document.getElementById("myDIV");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
var bDisplay = true;
function doDisplay2(){
	var con = document.getElementById("myDIV2");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
var bDisplay = true;
function doDisplay3(){
	var con = document.getElementById("myDIV3");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
var bDisplay = true;
function doDisplay4(){
	var con = document.getElementById("myDIV4");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
var bDisplay = true;
function doDisplay5(){
	var con = document.getElementById("myDIV5");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
var bDisplay = true;
function doDisplay6(){
	var con = document.getElementById("myDIV6");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
var bDisplay = true;
function doDisplay7(){
	var con = document.getElementById("myDIV7");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}var bDisplay = true;
function doDisplay8(){
	var con = document.getElementById("myDIV8");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
</script>


<style>

/* ---------------------- 자유게시판 ---------------------- */
/* 타이틀 */
section.community-header {
	color: aliceblue;
	font-size: 30px;
	background-color: rgb(61, 58, 58);
	padding: 1em 0;
}
/* ---------- */

/* 메뉴 */
section.community-body nav.community-body-nav ul h6 {
	color: purple;
	font-size: 16px;
	margin: 40px 0;
}

section.community-body nav.community-body-nav ul li {
	margin: 20px 0;
}

section.community-body nav.community-body-nav ul li span {
	color: plum;
	font-size: 20px;
}
/* ---------- */
.community-body-content {
	padding: 0;
}

.community-body .search-text {
	margin-top: 40px;
}

.community-body .search-text .form-group {
	margin: 0;
}

.community-body .community-body-write .write {
	padding: 0;
	text-align: right;
}

.community-body .community-body-content-list .table {
	margin-top: 120px;
}

.community-body .community-body-content-list .board-head th {
	text-align: center;
}

.community-body .community-body-content-list .board-body .board-likeDate
	{
	text-align: center;
}

.community-body .community-body-content .pagination-list {
	text-align: center;
}

</style>





<div id="wrapper">
<%@ include file="../include/header.jsp"%>

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<h2>자주하는 질문</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="community-body">
		<div class="container">
			<div class="row">
				<nav class="community-body-nav col-md-2">
                    <ul class="">
                        <h6>Dreams Come True</h6>
                        <li><a href="<c:url value='/notice/noticeList' />"><span>공지사항</span></a></li>
                        <li><a href="<c:url value='/notice/introduce' />"><span>사이트 소개</span></a></li>
                    </ul>
                    <ul>
                        <h6>강의</h6>
                        <li><a href="<c:url value='/lecture/lecturePage' />"><span>전체 강의</span></a></li>
                        <li><a href="<c:url value='/lecture/lectureEva' />"><span>수강평</span></a></li>
                    </ul>
                    <ul>
                        <h6>커뮤니티</h6>
                        <li><a href="<c:url value='/board/freeBoardList' />"><span>자유게시판</span></a></li>
                        <li><a href="<c:url value='/notice/frequentqna' />"><span>자주묻는 질문</span></a></li>
                    </ul>
                </nav>

				<div class="community-body-content col-md-10">
					<div class="search-text">
						<form action="#">
							<div class="col-md-2"></div>
							<div class="form-group col-md-2">
								<select id="condition" class="form-control" name="condition">
									<option value="title"
										${param.condition=='title' ? 'selected' : '' }>제목</option>
									<option value="content"
										${param.condition=='content' ? 'selected' : '' }>내용</option>
									<option value="writer"
										${param.condition=='writer' ? 'selected' : '' }>작성자</option>
									<option value="titleContent"
										${param.condition=='titleContent' ? 'selected' : ''
											}>제목+내용</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<div class="input-group">
									<input type="text" class="form-control" name="keyword"
										id="keywordInput" placeholder="검색어" value=""> <span
										class="input-group-btn"> <input type="submit"
										value="검색" class="btn btn-cpp btn-flat" id="searchBtn">
									</span>
								</div>
							</div>
							<div class="col-md-2"></div>
							<div class="col-md-2"></div>
						</form>
					</div>

					<div class="community-body-write">
						<form action="#">
							<div class="col-md-12"></div>
						</form>
					</div>

					<div class="community-body-content-list">
						<table class="table table-hover">
							<thead class="board-head">
								<tr class="active">
									<th>질문</th>

								</tr>
							</thead>
							<tbody class="board-body">
<tr>
									<td><a href="javascript:doDisplay();">[계정]이메일 계정을 변경하고 싶어요</a>
									<div id="myDIV">
										<p>다른 이메일 주소로 변경하고 싶을 경우 방법은 아래와 같아요. 
											
											1.[대시보드]-[프로필]-[이메일]에서 새로운 이메일 입력
											2. 안내된 인증 절차를 거치면 계정 변경 완료
											
											※ 소셜 계정으로 가입한 경우 로그아웃 상태에서 '비밀번호 찾기'를 통해 비밀번호를 먼저 설정 후 진행해 주셔야 해요.</p>
									</div><td>
								</tr>		
								<tr>
									<td><a href="javascript:doDisplay2();">[계정]비밀번호를 찿고 싶어요</a>
									<div id="myDIV2">
										<p>로그인 화면에서 '비밀번호 찾기'를 클릭해주세요.
											사용 중인 계정을 입력하면 이메일을 통해 비밀번호 변경 링크를 보내드려요.
											
											※ 혹시, 소셜 계정으로 연동해 사용 중이신가요? (카카오톡/페이스북/구글/깃허브/애플)
											소셜 계정의 경우 인프런에서는 여러분의 비밀번호를 보관하고 있지 않아요.
											인프런에서 사용하는 별도의 비밀번호를 생성하고 싶으시다면 프로필 설정에서 새로운 비밀번호를 발급받아주세요.
											
											※ 소셜 계정으로 가입한 경우 로그아웃 상태에서 '비밀번호 찾기'를 통해 비밀번호를 먼저 설정 후 진행해 주셔야 해요.</p>
									</div><td>
								</tr>								
								<tr>
									<td><a href="javascript:doDisplay3();">[강의]동시 접속이 가능한가요?</a>
									<div id="myDIV3">
										<p>수강 중 동시 접속은 제한하고 있어요.
											즉, 학습페이지는 1대에서만 접속할 수 있으며 다른 곳에서 동시 학습할 경우 학습이 제한될 수 있어요.
											해당 내용은 이용약관에 동시 접속 부정이용에 대하여 명시하였기에 법적 제재를 받으실 수 있는 점 참고해 주세요.</p>
									</div><td>
								</tr>
								<tr>
									<td><a href="javascript:doDisplay4();">[강의]진도율을 초기화 할수 있나요?</a>
									<div id="myDIV4">
										<p>진도율은 환불 및 수료증 발급과 밀접하게 관련된 정보로 초기화 기능이 제공되지 않아요.

											※ 혹시 이미 완강한 강의를 복습하고 계신가요?
											재수강 진도율 체크가 불편할 땐 '강의 노트 기능'을 사용해보세요. 언제, 어디까지 강의를 들었는지 메모할 수 있어요.</p>
									</div><td>
								</tr>
								<tr>
									<td><a href="javascript:doDisplay5();">[계정]구매했던 강의가 전부 사라졌어요.</a>
									<div  id="myDIV5">
										<p>인프런은 여러 개의 계정을 동시에 사용할 수 있어요. 소유하신 다른 계정이 있다면 확인 부탁드려요.
											
											※ 혹시 다른 계정 확인 후에도 구매한 강의를 찾지 못하셨나요?
											우측 하단의 1:1 문의하기로 내용 남겨주시면 확인 후 계정을 찾아드릴게요 :-)</p>
									</div><td>
								</tr>
								<tr>
									<td><a href="javascript:doDisplay6();">[결제]강의를 환불하고 싶어요.</a>
									<div  id="myDIV6">
										<p>수강 신청한 유료강의를 환불하고 싶으신가요?
										프로필 > 구매내역에서 환불을 원하는 '주문명'를 클릭하시면 직접 환불하실 수 있어요. 단, 환불 조건에 부합하지 않는 경우 취소 버튼이 비활성화되니 참고해 주세요!
										
										인프런의 환불 원칙은 다음과 같습니다.
										1) 강의 구매일 1주 이내에 진도율 7% 미만일 경우 전액 환불이 가능합니다.
										2) 강의 구매일이 1주일이 넘었거나, 진도율이 7% 이상일 경우 환불이 불가합니다.
										3) 1강으로 구성된 개별강의는 원칙적으로 환불이 불가능 합니다.
										4) 강의 자료를 다운로드 받는 경우, 환불이 불가합니다.
										5) 특별강의는 이벤트성 강의, 비정규 강의, 특별기획 강의 등으로서 이는 별도의 수강 취소, 변경 및 환불규정이 적용될 수 있습니다.
										
										※ 더 자세한 내용은 이용약관 제20조 청약철회에서 확인하실 수 있어요.</p>
									</div><td>
								</tr>
								<tr>
									<td><a href="javascript:doDisplay7();">[결제]할인과 쿠폰은 중복적용이 가능한가요?</a>
									<div  id="myDIV7">
										<p>모든 할인 및 쿠폰은 하나만 적용이 가능해요.
											할인 중인 강의라면 강의 할인이 우선 적용되어 쿠폰 적용이 안되는 점 참고해 주세요.
											더욱 자세한 쿠폰 & 할인 이용 안내는 쿠폰함 우측 상단에서 확인해 주세요.</p>
									</div><td>
								</tr>
								<tr>
									<td><a href="javascript:doDisplay8();">[멘토링]멘토링 서비스가 궁금해요.</a>
									<div  id="myDIV8">
										<p>인프런 멘토링은 멘토와 멘티를 연결해 약속을 잡아주는 기능이에요.
											커리어 상담부터 코드, 포트폴리오 리뷰까지 멘토가 필요할 땐 인프런 멘토링을 이용해 보세요. 지식공유자와 학습자가 더 쉽게 지식을 나누며 성장할 수 있답니다.</p>
									</div><td>
								</tr>
								

							</tbody>
						</table>
					</div>




				</div>
			</div>
		</div>
	</section>

</div>

<%@ include file="../include/footer.jsp"%>
</div>