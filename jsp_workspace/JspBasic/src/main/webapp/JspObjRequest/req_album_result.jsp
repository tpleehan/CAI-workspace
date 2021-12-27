<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
	<%
		String select = request.getParameter("select");
	%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% if (select.equals("sel1")) {%>
			<div align="center">
				<h2>선택한 인물 정보</h2>
				<hr>
				<p>
					선택한 인물은 <strong>Steven Paul "Steve" Jobs</strong> 입니다.
				</p>
				<hr>
				<h3>스티브잡스 전설의 프레젠테이션</h3>
				<iframe width="959" height="539" src="https://www.youtube.com/embed/GbtXavOLL5o?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				
			</div>
			
	<% } else if (select.equals("sel2")) {%>
			<div align="center">
				<h2>선택한 인물 정보</h2>
				<hr>
				<p>
					선택한 인물은 <strong>William Henry "Bill" Gates III</strong> 입니다.
				</p>
				<hr>
				<h3>빌 게이츠 하버드 졸업식 연설</h3>
				<iframe width="959" height="533" src="https://www.youtube.com/embed/v0FOgpnolJw?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				
			</div>
	<% } %>
	
</body>
</html>