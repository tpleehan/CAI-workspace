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
		<form action="req_album_result.jsp">
			<table border="1" >
				<tr>
					<th></th>
					<th>인물 사진</th>
					<th>이름</th>
					<th>회사</th>
					<th>회사 창립일</th>
				</tr>
				<tr>
					<td>
						<input type="radio" name="select" value="sel1"> <!-- value는 꼭 써야한다. -->
					</td>
					<td>
						<img alt="apple" src="image/apple.jpg" width="150">
					</td>
					<td>스티브 잡스</td>
					<td>Apple, 미국 캘리포니아 로스앨토스</td>
					<td>1976.04.01</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="select" value="sel2">
					</td>
					<td>
						<img alt="micro" src="image/micro.jpg" width="170" height="170">
					</td>
					<td>빌 게이츠</td>
					<td>Microsoft, 미국 뉴멕시코 앨버커키</td>
					<td>1975.04.04</td>
				</tr>
				<tr>
					<td colspan="5">
						<input type="submit" value="확인">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>