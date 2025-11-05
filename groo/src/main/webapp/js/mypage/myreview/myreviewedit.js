/**
 * 
 */

boardeditselect = (boardId) => {
	$('.summernote').summernote({
		height: 400,
		placeholder: '게시글 내용을 입력해 주세요.',
		tabsize: 2,

		toolbar: [
			['fontname', ['fontname']],
			['fontsize', ['fontsize']],
			['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
			['color', ['forecolor', 'color']],
			['table', ['table']],
			['para', ['ul', 'ol', 'paragraph']],
			['height', ['height']],
			['insert', ['picture', 'link', 'video']],
			['view', ['fullscreen', 'help']]
		],

		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
		fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
	});

	$.ajax({
		url: 'boarddetailselect.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId
		},
		success: function(response) {
			$('#postTitle').val(response.postTitle);
			$('#postWriter').val(response.memNick);
			$('#postContent').summernote('code', response.postContent);			
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

boardedit = (boardId) => {
	const postTitle = $('#postTitle').val();
	const postContent = $('#postContent').val();
	$.ajax({
		url: 'boardupdate.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId,
			postTitle: postTitle,
			postContent: postContent
		},
		success: function(response) {
			console.log("성공");
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

$(document).ready(function() {
	const url = new URL(window.location.href);
	const boardId = url.searchParams.get('id');

	boardeditselect(boardId);

	$('#submitBtn').on('click', function() {
		boardedit(boardId);
		window.location.href="postdetail.do?id="+boardId;
	});
	
	$('.btn-secondary').on('click', function() {
		window.location.href="postdetail.do?id="+boardId;
	});
});

