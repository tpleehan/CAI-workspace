<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tbody{
		font-size: 20px;
	}
	.page-link {
		background-color: orange;
	}
	.btn-countPerPage {
		background-color: gray;
		color: white;
	}
</style>

</head>
<body>
	
	<%--
		로그인하지 않은 사용자가 게시판에 들어왔을 경우 돌려보내는 코드를 작성
	 
	<c:if test="${user == null}">
		<script>
			alert("회원만 이용 가능한 게시판 입니다. 로그인을 하시기 바랍니다.");
			// board_list.jsp로 직접 요청이 들어가는 경우는 없기 때문에
			// 컨트롤러를 기준으로 상대 경로로 작성하거나 절대경로로 사용한다.
			location.href="user/user_login.jsp";
		</script>
	</c:if>
	 --%>
	
	<c:if test="${searchFail != null}">
		<script>
			alert("조회 결과가 없습니다.");
			location.href="/MyWeb/list.board";
		</script>
	</c:if>
	
	<jsp:include page="../include/header.jsp"/>

	<div class="container">
		<h2>My Web게시판</h2>
		
		<span style="float: right; margin-bottom: 15px">
			<input class="btn btn-countPerPage" type="button" value="10" onclick="location.href='/MyWeb/list.board?page=1&countPerPage=10'">
			<input class="btn btn-countPerPage" type="button" value="20" onclick="location.href='/MyWeb/list.board?page=1&countPerPage=20'">
			<input class="btn btn-countPerPage" type="button" value="30" onclick="location.href='/MyWeb/list.board?page=1&countPerPage=30'">
		</span>
		
		<table class="table table-secondary table-hover table-bordered">
			<thead style="font-size: 25px">
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- items="${boardList}"에는 requestScope.boardList가 생략되어 있다. -->
				<c:forEach var="b" items="${boardList}">
					<tr>
						<td>${b.boardId}</td>
						<td>${b.writer}</td>
						<td>
							<a href="/MyWeb/content.board?bId=${b.boardId}&page=${param.page}&countPerPage=${param.countPerPage}">${b.title}</a>
							&nbsp;&nbsp;
							<c:if test="${b.newMark}">
								<img alt="newMark" src="/MyWeb/img/icon_new.gif">
							</c:if>
						</td>
						<td>
							<fmt:formatDate value="${b.regDate}" pattern="yyyy년 MM월 dd일 a hh시 mm분"/>
						</td>
						<td>${b.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
			
			<%-- 페이징을 처리할 구간 --%>
			<tbody>
			   <tr>
			      <td colspan="5" align="center">
			         <ul class="pagination pagination-lg">
			         
				         <%-- 이전 버튼 --%>
				         <c:if test="${pc.prev}">
			                 <li class="page-item"><a class="page-link"
			                    href="/MyWeb/list.board?page=${pc.beginPage-1}&countPerPage=${pc.paging.countPerPage}"
			                    style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
			                 </li>
				         </c:if>
		
		            	 <%-- 페이지 버튼 --%>
		           		 
		           		 <c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
			                 <li class="page-item">
				                 <a href="/MyWeb/list.board?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link"
				                    style="margin-top: 0; height: 40px; color: pink; border: 1px solid #643691; ${pageNum == pc.paging.page ? 'background-color: orange;' : ''}">${pageNum}</a>
			                 </li>
		           		 </c:forEach>
		     
		             	 <%-- 다음 버튼 --%>
		             	 <c:if test="${pc.next}">
			                 <li class="page-item"><a class="page-link"
			                    href="/MyWeb/list.board?page=${pc.endPage+1}&countPerPage=${pc.paging.countPerPage}"
			                    style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
			                 </li>
		             	 </c:if>
			         
			         </ul>
			      </td>
			   </tr>
			</tbody>
			
			<tbody>
				<tr>
					<td colspan="5" align="right">
						<form action="/MyWeb/search.board" class="form-inline" >
						  <div class="form-group">
						  	<select name="category" class="form-control">
						  		<option value="title">제목</option>
						  		<option value="writer">작성자</option>
						  		<option value="content">내용</option>
						  	</select>
						    <input type="text" name="search" placeholder="검색어 입력" class="form-control" >
						  	<input type="submit" value="검색" class="btn btn-default">
							<input type="button" value="글 작성" class="btn btn-default" onclick="location.href='/MyWeb/write.board'">
						  </div>
						</form> 
					</td>
				</tr>
			</tbody>
		
		</table>
	</div>

	<jsp:include page="../include/footer.jsp"/>

</body>
</html>