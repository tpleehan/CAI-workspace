<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	table {
		width: 800px;
	}
	
	td {
		text-align: center;
	}
	
</style>	
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>인물 사진</th>
				<th>이름</th>
				<th>회사</th>
				<th>회사 창립일</th>
			</tr>
			<tr>
				<td>
					<img alt="apple" src="image/apple.jpg" width="150">
				</td>
				<td>스티브 잡스</td>
				<td>
					<a href="req_album_result.jsp?select=sel1">Apple, 미국 캘리포니아 로스앨토스</a>
				</td>
				<td>1976.04.01</td>
			</tr>
			<tr>
				<td>
					<img alt="micro" src="image/micro.jpg" width="170" height="170">
				</td>
				<td>빌 게이츠</td>
				<td>
					<a href="req_album_result.jsp?select=sel2">Microsoft, 미국 뉴멕시코 앨버커키</a>
				</td>
				<td>1975.04.04</td>
			</tr>
		</table>
	</div>
</body>
</html>