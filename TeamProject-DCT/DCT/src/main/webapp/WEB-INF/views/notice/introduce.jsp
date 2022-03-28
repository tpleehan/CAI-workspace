<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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
	<head>
	<%@ include file="../include/header.jsp"%>
	
	</head>
		

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<h2>소개</h2>
				</div>
				
			</div>
		</div>
		
	</section>
<img style="text-align: center;"src="img/introduce.png" alt="">
	<section class="community-body">
		<div class="container">
			<div class="row">
				<nav class="community-body-nav col-md-2">
					<ul class="">
						<h6 class="">Dreams Come True</h6>
						<li class=""><a href="#"><span>공지사항</span></a></li>
						<li class=""><a href="#"><span>사이트 소개</span></a></li>
						<li class=""><a href="#"><span>자주하는 질문</span></a></li>
					</ul>
					<ul class="">
						<h6 class="">커뮤니티</h6>
						<li class=""><a href="#"><span>질문 &amp; 답변</span></a></li>
						<li class=""><a href="#"><span>자유게시판</span></a></li>
					</ul>
					<ul class="">
						<h6 class="">후기</h6>
						<li class=""><a href="#"><span>수강평</span></a></li>
						<li class=""><a href="#"><span>멘토링 후기</span></a></li>
					</ul>
				</nav>
				<div class="col-md-3">
					<p style="font-size: 25px; margin-top: 40px;">우리는 때로 무언가를 배워야
						합니다</p>


				</div>
				<div class="col-md-7" style="margin-top: 40px;">
					<p>꿈을 이루기 위해서, 하고 싶은걸 해나가기 위해선 그 분야에 대한 배움이 가장 기본적인 요소이기 때문입니다. 
					하지만, 모두에게 배우기 좋은 환경이 보장 되진 않죠.<br>
					<br>
					너무 비싸서, 거리가 멀어서.. 여러 이유로 당연하다고 생각되어 지는것들이 어떤 누군가에게는 사치가 되기도 
					합니다. 그런 현실에 도전하려 합니다. 인프런은 누구나, 경제적으로 시간적 제약없이 내가 원하는 것을 배우고, 
					지식을 나눌 수 있는 공간입니다.</p>

				<br>
				<br>
				<br>
				</div>

				<div class="col-md-3">
					<p style="font-size: 25px;">우리의 약속</p>


				</div>
				<div class="col-md-7">
					<p><h4>전문성</h4>
						수년~십수년씩 커리어를 쌓고 노력해온 지식공유자들이 지식과 노하우를 공유합니다. 당장 좋은 사수가 없거나,
						 교육을 받지 못하더라도 걱정하지 마세요.<br>
						 인프런에서 전문가들에게서 지식과 노하우를 배울 수 있습니다.<br>
						
						 
						<br>
						<h4>올바름에 대한 추구</h4>
						인프런은 눈앞의 돈을 쫓기 보다는 옳은 방향을 찾기위해 노력합니다. 인프런은 다른 곳들과는 달리 수강생수, 
						강의평가 등을 조작이나 선별 없이 공개합니다.<br>
						 이는 학습자들이 더 좋은 경험을 스스로 찾아서 하게 만들고, 
						지식공유자가 더 좋은 학습 콘텐츠를 만들 수 있도록 도와준다고 생각합니다. 학습자, 지식공유자 모두에게 
						장기적으로 도움이 되는 생태계를 만들기 위해 노력합니다.<br>
						
						<br>
						<h4>다양성과 경제성</h4>
						학교에서 배우기 어렵거나, 큰 비용을 지불해야만 배울 수 있는 전문적인 지식들을 제공합니다.<br>
						우리의 삶은 다양하고, 그만큼 다양한 꿈을 꿀 수 있습니다.<br> 인프런은 다양한 꿈을 이룰 수 있는 폭 넓고 깊은 지식을 전달하려 
						노력하겠습니다.<br> 오픈 플랫폼의 이점을 통해 다양성과 경제성을 모두 높입니다.<br>
						
						  
						<br>
						<h4>마케팅보다 좋은 콘텐츠에</h4>
						마케팅보다는 좋은 콘텐츠에 집중합니다.<br> 좋지 않은 콘텐츠라도 홍보와 포장을 통해 이윤을 남길 수 있지만, 
						우리는 콘텐츠에 집중합니다.<br> 좋은 콘텐츠를 통해 자연스럽게 알려지고, 소개하게 되어 모두 함께 성장하는 
						공간을 만들겠습니다.</p>


				</div>
<!-- 				<div class="col-md-5">
					<p style="font-size: 25px;">만든이의 편지</p>


				</div>
				<div class="col-md-5">
					<p>안녕하세요. 오늘은 어떤 하루를 보내고 계신가요?<br>

						예전에, 문득 게임을 하다가 '나도 이런 게임을 만들고 싶다'라는 생각을 했고, 
						게임 개발을 배우기 위해 이곳 저곳을 알아보았으나, 비싼 교육비와 참여하기 힘든 국비교육으로 
						마음을 접어야 했습니다.<br>

						하지만 이런 불편함을 겪는 사람은 저 뿐만이 아니었고, 배우고 싶은 것을 마음대로 배울 수 없는
						 현실을 극복하고 싶었습니다. 이런 생각에 많은 분들이 공감을 해주셨고 도움을 주셨어요.<br>
						  덕분에 비슷한 경험, 생각을 가진 사람들이 모여 지금의 인프런이 만들어 질 수 있었어요.<br>

					앞으로도 인프런이 배우고 싶은 것을 포기하기 않고 꿈을 이룰 수 있는 장소가 되었으면 합니다.<br>

					경제적으로, 언제 어디서나 학습가능한 생태계를 만들어 누구나 성장의 기회를 평등하게 갖도록 돕는게 인프런의 목표입니다.<br>

				인프런에서 필요한 것을 배우고 익힌다면 그 자체로 저희에게 의미가 있는 일이라고 생각합니다. 배우고, 익히고, 가능하다면 다른
				 필요한 분들에게 자신의 지식을 나눠주고..<br>
				그렇게 된다면 정말 멋지겠네요.😁<br>

			여러분이 한 단계 발전하는데 인프런이 보탬이 되었으면 좋겠어요.<br>
			당신의 성장을 늘 응원하겠습니다.<br>

			함께해 주셔서 감사합니다.<br>

인프런 올림</p>


				</div> -->
					<div class="col-md-13">
					<img style="text-align:center;"src="img/logo.png" alt="">
					</div>
	</section>
	

	<%@ include file="../include/footer.jsp"%>