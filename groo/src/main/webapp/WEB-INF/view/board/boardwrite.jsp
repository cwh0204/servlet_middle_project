<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Summernote JSP</title>

<script src="jquery/jquery-3.7.1.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/js/bootstrap.min.js" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>

<link href="css/board/boardWrite.css" rel="stylesheet">
<script src="js/board/boardWrite.js"></script>
<body>
	<div class="board-form-container">
		<h2 class="mb-4 board-title-heading">✏️ 새 게시글 작성</h2>

		<div class="form-group">
			<label for="postTitle">제목</label> <input type="text"
				class="form-control" id="postTitle" name="title"
				placeholder="제목을 입력해 주세요." required>
		</div>

		<div class="form-group">
			<label for="postWriter">작성자</label> <input type="text"
				class="form-control" id="postWriter" name="writer" readonly>
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea class="summernote" id="postContent" name="content"></textarea>
		</div>

		<div class="action-buttons">
			<button class="btn btn-primary" id="submitBtn">등록</button>
			<div class="btn btn-secondary">취소</div>
		</div>
	</div>
	<%@ include file="../frontComponents/chatbot.jsp"%>
	<div class="chatbot-fixed-container-alt">
		<button type="button" class="chatbot-button" id="openChatBtn">
			<i class="bi bi-chat-dots-fill me-2"></i>채팅 열기
		</button>
	</div>
	<div id="loading" style="
	    display: none; 
	    position: fixed; 
	    top: 0; 
	    left: 0; 
	    width: 100%; 
	    height: 100%; 
	    background: rgba(255, 255, 255, 0.8); 
	    z-index: 9999; 
	    text-align: center;
	">
	    <div id="loading-container" style="
	        position: absolute; 
	        top: 50%; 
	        left: 50%; 
	        transform: translate(-50%, -50%); 
	        padding: 30px; 
	        background: #343a40; /* Dark background for visibility */
	        color: #fff;
	        border-radius: 8px;
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	    ">
	        <div class="spinner-border m-3 text-light" role="status">
	            <span class="visually-hidden">Loading...</span>
	        </div>
	        
	        <span id="loading-message" class="mt-2" style="font-size: 1.1em;"></span> 
	    </div>
	</div>
</body>
</html>