<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 상세 보기</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/board/postDetail.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/base.css" rel="stylesheet">
<link rel="stylesheet" href="css/board/postdetail.css">
</head>
<body>
<% %>
	<div class="view-container">

		<div class="board-header">
			<h2 class="post-title"></h2>
			<div class="post-meta">
				<span class="meta-item">게시자: <strong></strong></span> <span
					class="meta-separator">|</span> <span class="meta-item" id="Date"></span>
				<span class="meta-separator">|</span> <span class="meta-item"
					id="postViews"></span>
			</div>
		</div>

		<div class="board-content">
			<div class="attachments">
				<a href="download.do?fileId=F999">첨부파일 다운로드 (업데이트 요약.pdf)</a>
				<!-- 수정필요 -->
			</div>
		</div>

		<div class="board-actions">
			<button class="btn-primary" id="modifyButton">수정</button>
			<button class="btn-danger" id="deleteButton">삭제</button>
			<button class="btn-secondary" id="toBoardList">목록으로</button>
		</div>

		<div class="reaction-section">
			<button id="likeBtn"></button>
			<button id="reportPostBtn" data-bs-toggle="modal"
				data-bs-target="#reportModal">🚨 게시글 신고</button>
		</div>

		<div class="comment-section">
			<h3></h3>
			<div class="comment-form">
				<textarea id="commentContent" placeholder="댓글을 입력하세요..." rows="3"></textarea>
				<button id="commentSubmit">등록</button>
			</div>

			<div class="comment-list"></div>
		</div>
	</div>
	<%@ include file="../frontComponents/reportmodal.jsp"%>
</body>
</html>