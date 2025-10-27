<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="css/board/boardwrite.css" rel="stylesheet">
<script src="js/board/boardwrite.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
<body>

<!-- 	<form id="postForm" action="boardwrite.do" method="post"> -->
		<div class="board-form-container">
			<h2 class="mb-4 board-title-heading">✏️ 새 게시글 작성</h2>

			<div class="form-group">
				<label for="postTitle">제목</label> <input type="text"
					class="form-control" id="postTitle" name="title"
					placeholder="제목을 입력해 주세요." value="제목을 입력해주세요" required>
			</div>

			<div class="form-group">
				<label for="postWriter">작성자</label> <input type="text"
					class="form-control" id="postWriter" name="writer"
					value="테스터 (test01)" readonly>
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
			<input type="text" style=" display: none; "id="border-type" value="1111">
		</div>
<!-- 	</form> -->
</body>
<script type="text/javascript">

boardInsert = () => {
	const postContent = $('#postContent').summernote('code');
	const postTitle = $('#postTitle').val();
	
 	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'boardinsert.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memId : '',
			boardType : '',
			postContent : postContent,
			postTitle : postTitle
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log("성공");
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

$('#submitBtn').click(function () {
	boardInsert();
});
</script>
</html>