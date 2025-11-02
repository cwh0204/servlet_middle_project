<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script src="js/chatbot.js"></script>
<style type="text/css">
.message ol, .message ul, .message li {
	list-style-type: none; /* 목록 기호 제거 */
	margin-bottom: 0; /* 하단 여백 제거 */
}
/* 채팅창 오버레이 */
.chat-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1040;
	display: none;
	opacity: 0;
	transition: opacity 0.3s ease;
}

.chat-overlay.active {
	display: block;
	opacity: 1;
}

/* 채팅창 사이드바 */
.chat-sidebar {
	position: fixed;
	top: 0;
	right: -600px;
	width: 600px;
	height: 100%;
	background-color: white;
	box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
	z-index: 1050;
	transition: right 0.3s ease;
	display: flex;
	flex-direction: column;
}

.chat-sidebar.active {
	right: 0;
}

/* 채팅창 헤더 */
.chat-header {
	padding: 20px;
	background-color: #0d6efd;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-shrink: 0;
}

.chat-header h5 {
	margin: 0;
	font-weight: 600;
}

.chat-close {
	background: none;
	border: none;
	color: white;
	font-size: 24px;
	cursor: pointer;
	padding: 0;
	width: 32px;
	height: 32px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 4px;
	transition: background-color 0.2s;
}

.chat-close:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

/* 채팅 메시지 영역 */
.chat-messages {
	flex: 1;
	overflow-y: auto;
	padding: 20px;
	background-color: #f8f9fa;
}

/* 메시지 스타일 */
.message {
	margin-bottom: 15px;
	display: flex;
}

.message.received {
	justify-content: flex-start;
}

.message.sent {
	justify-content: flex-end;
}

.message-content {
	padding: 10px 15px;
	border-radius: 15px;
	word-wrap: break-word;
}

.message.received .message-content {
	background-color: white;
	border: 1px solid #dee2e6;
}

.message.sent .message-content {
	background-color: #0d6efd;
	color: white;
}

.message-time {
	font-size: 11px;
	color: #6c757d;
	margin-top: 5px;
}

.message.sent .message-time {
	text-align: right;
	color: rgba(255, 255, 255, 0.7);
}

/* 채팅 입력 영역 */
.chat-input {
	padding: 15px 20px;
	background-color: white;
	border-top: 1px solid #dee2e6;
	flex-shrink: 0;
}

.input-group {
	display: flex;
	gap: 10px;
}

.input-group input {
	flex: 1;
}

/* 플로팅 버튼 */
.floating-chat-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	background-color: #0d6efd;
	color: white;
	border: none;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
	font-size: 24px;
	cursor: pointer;
	transition: all 0.3s;
	z-index: 1000;
}

.floating-chat-btn:hover {
	background-color: #0b5ed7;
	transform: scale(1.1);
}

.floating-chat-btn .badge {
	position: absolute;
	top: -5px;
	right: -5px;
	background-color: #dc3545;
}

.chatbot-button {
	/* 기존 버튼 스타일 오버라이드 및 챗봇 스타일 적용 */
	background-color: #4CAF50; /* 산뜻한 초록색 */
	color: white;
	padding: 15px 20px; /* 패딩을 늘려 버튼 크기 확보 */
	border: none;
	border-radius: 50px; /* 둥근 모양으로 만들어 챗봇 아이콘 느낌 */
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 입체감 있는 그림자 */
	transition: background-color 0.3s, box-shadow 0.3s, transform 0.3s;
	/* 텍스트 '채팅 열기'가 있다면 아래 주석 해제하여 텍스트 정렬 */
	/* white-space: nowrap; */
}

/* 버튼 호버 효과 (마우스를 올렸을 때) */
.chatbot-button:hover {
	background-color: #45a049; /* 약간 더 어두운 색상 */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
	transform: translateY(-2px); /* 살짝 위로 이동하여 클릭 유도 */
}

/* 버튼 클릭 시 효과 */
.chatbot-button:active {
	background-color: #3e8e41; /* 더 어두운 색상 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	transform: translateY(0);
}

/* --- 고정 위치 스타일 --- */
.chatbot-fixed-container {
	/* position: sticky 적용 */
	position: sticky;
	/* 웹페이지의 오른쪽 하단에 고정 */
	bottom: 20px; /* 하단에서 20px 위로 */
	right: 20px; /* 오른쪽에서 20px 안쪽으로 */
	z-index: 1000; /* 다른 요소 위에 표시되도록 높은 z-index 설정 */
	/* sticky를 사용할 때 부모 요소의 높이/넓이에 따라 다르게 작동할 수 있으므로, 
       버튼 자체에 sticky를 적용하거나 컨테이너를 사용합니다. 
       대부분의 경우, fixed를 사용하는 것이 더 안정적입니다. */
}

/* 만약 스크롤에 상관없이 '항상' 화면에 고정하고 싶다면, 아래 `position: fixed`를 사용하세요. 
   'position: sticky'는 부모 요소 내에서만 동작하며, 고정되는 조건이 더 까다롭습니다. */
.chatbot-fixed-container-alt {
	position: fixed; /* 스크롤에 관계없이 화면에 영구 고정 */
	bottom: 20px;
	right: 20px;
	z-index: 1000;
}

.chatbot-fixed-container-alt {
	position: fixed;
	bottom: 60px;
	right: 60px;
	z-index: 1000;
}
</style>
</head>
<body>
	<div class="chat-overlay" id="chatOverlay"></div>

	<!-- 채팅 사이드바 -->
	<div class="chat-sidebar" id="chatSidebar">
		<!-- 채팅 헤더 -->
		<div class="chat-header">
			<h5>
				<i class="bi bi-chat-dots-fill me-2"></i>Groo 챗봇
			</h5>
			<div class="d-flex gap-2">
				<button type="button" class="chat-close" id="clearChatBtn"
					title="채팅 내용 지우기">
					<i class="bi bi-trash3"></i>
				</button>
				<button type="button" class="chat-close" id="closeChatBtn"
					title="채팅창 닫기">
					<i class="bi bi-x-lg"></i>
				</button>
			</div>
		</div>

		<!-- 채팅 메시지 영역 -->
		<div class="chat-messages" id="chatMessages"></div>

		<!-- 채팅 입력 영역 -->
		<div class="chat-input">
			<div class="input-group">
				<input type="text" class="form-control" id="messageInput"
					placeholder="메시지를 입력하세요...">
				<button class="btn btn-primary" type="button" id="sendMessageBtn">
					<i class="bi bi-send-fill"></i>
				</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>