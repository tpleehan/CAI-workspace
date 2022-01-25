<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		1. res-quiz01 파일의 화면처리를 할 수 있는 메서드부터 생성
			(맵핑url은 res-quiz01로, 메서드 이름은 편하게 지정)
		2. 폼 태그 작성해서 아이디와 비밀번호를 받는다.
		 	action: res-login으로 맵핑, POST 전송
		3. ID:kim123, PW: 1234라면 res-quiz02페이지로 이동해서
			"로그인 성공! kim123님 환영합니다!" 를 출력.
		4. 아니라면 res-quiz03페이지로 이동해서
			"로그인 실패! '작성한 id'는 회원이 아니거나 비밀번호가 틀렸습니다."
			view에 id값을 전달, 사용자가 입력한 id를 보내야 한다.
	 --%>
	 
	<h2>res-quiz01 화면</h2>
	
	<form action="/basic/response/res-login" method="POST">
		<p>
			# ID: <input type="text" name="userId" size="10"> <br>
			# PW: <input type="password" name="userPw" size="10"> <br>
			<input type="submit" value="로그인">
		</p>
	</form>

</body>
</html>