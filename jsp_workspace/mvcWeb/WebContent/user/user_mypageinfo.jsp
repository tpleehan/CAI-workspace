<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/userinfo.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<div class="container">
			<div class="row join-wrap">
				<!--join-form을 적용한다 float해제 margin:0 auto-->
				<div class="col-xs-12 col-md-9 join-form">

					<div class="titlebox">MEMBER INFO</div>

					<p>*표시는 필수 입력 표시입니다</p>
					<form action="/mvcWeb/update.user" method="post" name="update_form">
						<table class="table">
							<tbody class="m-control">
								<tr>
									<td class="m-title">*ID</td>
									<td><input class="form-control input-sm" name="id" value="${user.id}" readonly></td>
								</tr>
								<tr>
									<td class="m-title">*이름</td>
									<td><input class="form-control input-sm" name="name" value="${user.name}" onfocus="this.value='';" ></td>
								</tr>
								<tr>
									<td class="m-title">*비밀번호</td>
									<td><input class="form-control input-sm" name="pw" type="password" value="${user.pw}" onfocus="this.value='';"></td>
								</tr>
								<tr>
									<td class="m-title">*비밀번호확인</td>
									<td><input class="form-control input-sm" name="pw_check" type="password"></td>
								</tr>
								<tr>
									<td class="m-title">*E-mail</td>
									<c:set var="emailValue" value="${user.email}" />
									<td><input class="form-control input-sm" name="email" value="${fn:substringBefore(emailValue, '@')}">@ <select
										class="form-control input-sm sel" name="emailSel" style="width:100px">
											<option>naver.com</option>
											<option>gmail.com</option>
											<option>daum.net</option>
									</select>
										<button class="btn btn-info">중복확인</button></td>
								</tr>
								<tr>
									<td class="m-title">*휴대폰</td>
									<c:set var="PhoneValue" value="${user.phone}" />
									<td><input class="form-control input-sm sel" name="phone" value="${fn:substring(PhoneValue,0,3)}" onfocus="this.value='';"> - <input
										class="form-control input-sm sel" name="phone2" value="${fn:substring(PhoneValue,3,7)}" onfocus="this.value='';"> - <input
										class="form-control input-sm sel" name="phone3" value="${fn:substring(PhoneValue,7,12)}" onfocus="this.value='';"></td>
								</tr>
								<tr>
									<c:set var="addressValue" value="${user.address}" />
									<td class="m-title">*주소</td>
									<td><input class="form-control input-sm add" name="address" value="${fn:substringBefore(user.address, ' ')}" onfocus="this.value='';"></td>
								</tr>
								<tr>
									<c:set var="addressValue" value="${user.address}" />
									<td class="m-title">*상세주소</td>
									<td><input class="form-control input-sm add" name="address2" value="${fn:substringAfter(user.address, ' ')}" onfocus="this.value='';"></td>
								</tr>
							</tbody>
						</table>

						<div class="titlefoot">
							<button type="button" onclick="updateConfirm()">수정</button>
							<a href="/mvcWeb/myPage.user">
								<button class="btn">목록</button>
							</a>
						</div>
					</form>

				</div>

			</div>

		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>