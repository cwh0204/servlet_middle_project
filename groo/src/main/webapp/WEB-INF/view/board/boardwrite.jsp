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
<link href="css/board/boardWrite.css" rel="stylesheet">
<script src="js/board/boardWrite.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
<body>
	<div class="board-form-container">
		<h2 class="mb-4 board-title-heading">✏️ 새 게시글 작성</h2>

		<div class="form-group">
			<label for="postTitle">제목</label> <input type="text"
				class="form-control" id="postTitle" name="title"
				placeholder="제목을 입력해 주세요." value="제목을 입력해주세요" required>
		</div>

		<div class="form-group">
			<label for="postWriter">작성자</label> <input type="text"
				class="form-control" id="postWriter" name="writer" readonly>
		</div>

		<div class="form-group">
			<label>내용</label>
			<div class="summernote" id="postContent" name="content">
				<p>여기에 입력해주세요.</p>
			</div>
		</div>
		<div class="action-buttons">
			<button class="btn btn-primary" id="submitBtn">등록</button>
			<a href="boardlist.do" class="btn btn-secondary">취소</a>
		</div>
	</div>
</body>
</html>