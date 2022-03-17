<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		* {
			margin:0;
			padding:0;
		}
		.container {
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1 {
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chat {
			background-color: #ADE7F7;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chat p {
			color: #000000;
			text-align: left;
		}
		input {
			width: 330px;
			height: 25px;
		}
		#yourMsg {
			display: none;
		}
	</style>

</head>
<body>

	<div id="container" class="container">
		<h1>채팅</h1>
		<div id="chat" class="chat"></div>
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="nameRegiBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>

</body>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		ws = new WebSocket('ws://' + location.host + '/chat');
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			if(msg !== null && msg.trim() !== ''){
				$('#chat').append('<p>' + msg + '</p>');
			}
		}

		document.addEventListener('keypress', function(e) {
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $('#userName').val();
		if(userName === null || userName.trim() === '') {
			alert('사용자 이름을 입력해주세요.');
			$('#userName').focus();
		} else {
			wsOpen();
			$('#yourName').hide();
			$('#yourMsg').show();
		}
	}

	function send() {
		var userName = $('#userName').val();
		var msg = $('#chatting').val();
		var chatting = $('#chatting').val();
		
		if(chatting == null || chatting.trim() == "") {
			alert('메시지를 입력해주세요.');
			$('chatting').focus();
		} else {
			ws.send(userName + ' : ' + msg);
			$('#chatting').val("");
			$('chatting').focus();
		}
		$('#chat').scrollTop($('#chat').prop('scrollHeight'));
	}
	

	
</script>
</html>
