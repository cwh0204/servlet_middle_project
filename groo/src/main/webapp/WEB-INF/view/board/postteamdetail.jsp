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
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
</head>
<style>
/* 관리자 리뷰 폼 섹션 스타일 (작성 폼) */
.admin-review-form-section {
	border: 2px solid #5cb85c; /* 성공/승인 관련 초록색 테두리 */
	background-color: #f7fff7; /* 매우 연한 초록색 배경 */
	padding: 25px;
	margin-top: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(92, 184, 92, 0.1); /* 은은한 그림자 */
}

.admin-review-form-section h4 {
	color: #449d44;
	margin-bottom: 15px;
	border-bottom: 3px solid #449d44;
	padding-bottom: 5px;
	font-weight: 700;
}

/* 등록된 리뷰 표시 섹션 스타일 */
.admin-review-display-section {
	margin-top: 30px;
	padding: 15px 0;
}

.admin-review-display-section h4 {
	color: #333;
	font-size: 1.3em;
	margin-bottom: 15px;
	border-bottom: 1px solid #eee;
	padding-bottom: 5px;
}

.review-card {
	border: 1px solid #d4e8d4;
	border-left: 6px solid #5cb85c; /* 초록색 세로 막대 강조 */
	padding: 20px;
	background-color: #f8fff8;
	border-radius: 8px;
	margin-bottom: 20px;
	transition: all 0.3s ease;
}

.review-card:hover {
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.review-card h5 {
	color: #2e6e2e; /* 짙은 초록색 제목 */
	font-weight: 600;
	margin-bottom: 8px;
	display: flex;
	align-items: center;
}

.review-card h5::before {
	content: "👍"; /* 아이콘 추가 */
	margin-right: 10px;
	font-size: 1.2em;
}

.review-meta {
	font-size: 0.85em;
	margin-bottom: 15px;
	padding-left: 30px; /* 아이콘 공간만큼 들여쓰기 */
}

.review-content {
	white-space: pre-wrap; /* 줄바꿈 유지 */
	line-height: 1.6;
	color: #444;
	border-top: 1px dashed #e0e0e0;
	padding-top: 10px;
}
</style>
<body>
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

		<div id="adminReviewFormSection"
			class="admin-review-form-section mt-4" style="display: none;">
			<h4>관리자 피드백 작성</h4>
			<form id="adminReviewForm" action="submitReview.do" method="post">
				<input type="hidden" name="postId" value="${post.postId}">

				<div class="form-group mb-3">
					<label for="reviewTitle">리뷰 제목:</label> <input type="text"
						id="reviewTitle" name="reviewTitle" class="form-control" required>
				</div>
				<div class="form-group mb-3">
					<label for="reviewContent">피드백 내용:</label>
					<textarea id="reviewContent" name="reviewContent"
						class="form-control" rows="5"
						placeholder="게시글에 대한 공식적인 피드백을 작성하세요." required></textarea>
				</div>
				<button type="submit" class="btn-success">✅ 피드백 등록</button>
			</form>
		</div>

		<!-- 2. 등록된 관리자 리뷰를 표시하는 공간 -->
		<div class="admin-review-display-section mt-4 mb-4">
			<h4>Groo Ai 피드백</h4>
			<div id="adminReviewList">

				<div class="review-card">
					<p class="review-meta"></p>
				</div>
			</div>
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
<script type="text/javascript">
var grooComent = () => {
	const url = new URL(window.location.href);
	const boardId = url.searchParams.get('id');
	$.ajax({
		url: 'groobotselect.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId
		},
		success: function(response) {
			const botComment = marked.parse(response.botComment);
			$('.review-meta').html(botComment);
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});	
}

$(document).ready(function() {
	grooComent();
});
</script>
</html>