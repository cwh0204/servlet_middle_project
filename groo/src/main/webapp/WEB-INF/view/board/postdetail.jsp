<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="css/board/postdetail.css">
</head>
<body>

	<div class="view-container">

		<div class="board-header">
			<h2 class="post-title"></h2>
			<div class="post-meta">
				<span class="meta-item">게시자: <strong></strong></span>
				 <span class="meta-separator">|</span>
				  <span class="meta-item" id="Date"></span> <span class="meta-separator">|</span> <span
					class="meta-item" id="postViews">조회수: 340</span>
			</div>
		</div>

		<div class="board-content">
			<p>
				커뮤니티 사용자 여러분께, 안정적인 서비스 제공을 위한 업데이트가 성공적으로 완료되었습니다.<br> <br>
				**[주요 개선 사항]**<br> 1. 게시판 목록 로딩 속도가 획기적으로 개선되었습니다.<br> 2.
				댓글 시스템의 Ajax 처리 오류가 완전히 수정되었습니다.<br> 3. 모바일 환경에서의 가독성이
				최적화되었습니다.<br> <br> 이용에 불편함이 없도록 최선을 다하겠습니다. 감사합니다.
			</p>

			<div class="attachments">
				<a href="download.do?fileId=F999">첨부파일 다운로드 (업데이트 요약.pdf)</a>
			</div>
		</div>

		<div class="board-actions">
			<button class="btn-primary"
				onclick="location.href='boardmodify.do?id=A1'">수정</button>
			<button class="btn-danger"
				onclick="location.href='boarddelete.do?id=A1'">삭제</button>
			<button class="btn-secondary" onclick="location.href='boardlist.do'">목록으로</button>
		</div>

		<div class="reaction-section">
			<button id="likeBtn">👍 좋아요 (55)</button>
			<button id="reportPostBtn"
				onclick="location.href='boardreport.do?id=A1'">🚨 게시글 신고</button>
		</div>

		<div class="comment-section">
			<h3>댓글 (3)</h3>

			<div class="comment-form">
				<textarea id="commentContent" placeholder="댓글을 입력하세요..." rows="3"></textarea>
				<button id="commentSubmit">등록</button>
			</div>

			<div class="comment-list">

				<div class="comment-item">
					<div class="comment-meta">
						<strong>파워유저</strong> <span>2025-10-28 18:55:00</span>
					</div>
					<p>로딩 속도 정말 빨라졌어요! 체감됩니다.</p>
					<button class="comment-report">신고</button>
					<button class="comment-delete">삭제</button>
				</div>

				<div class="comment-item">
					<div class="comment-meta">
						<strong>궁금러</strong> <span>2025-10-28 19:00:00</span>
					</div>
					<p>모바일 최적화 정말 필요했는데 감사합니다!</p>
					<button class="comment-report">신고</button>
					<button class="comment-delete">삭제</button>
				</div>

				<div class="comment-item">
					<div class="comment-meta">
						<strong>AI팬</strong> <span>2025-10-28 19:05:00</span>
					</div>
					<p>수고하셨습니다. 덕분에 게시판 이용이 훨씬 쾌적해졌어요.</p>
					<button class="comment-report">신고</button>
					<button class="comment-delete">삭제</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {

		/* const writer = 로그인한 사용자 ID (세션); */
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const boardId = urlParams.get('id');

 		$.ajax({
			url : 'boarddetailselect.do',
			type : 'POST',
			dataType : 'json',
			data : {
				boardId : boardId
			},
			success : function(response) {
				console.log(response)
				response.postTitle;
				$('.post-title').text(response.postTitle);
				$('.meta-item strong').text(response.memNick);
				$('#Data').text(response.postingDate);
				$('.board-content').text(response.postContent);
				$('.comment-section h3').text(`댓글 (${response.comentCount})`);
				$('#postViews').text(response.postViews);
				
				
			},
			error : function() {
				alert("서버 통신 오류가 발생했습니다.");
			}
		});
	});
</script>
</html>