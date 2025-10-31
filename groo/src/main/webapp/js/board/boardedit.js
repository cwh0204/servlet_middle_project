

boardeditselect = (boardId) => {
	$.ajax({
		url: 'boarddetailselect.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId
		},
		success: function(response) {
			console.log(response);
			const postTitle = response.postTitle;
			const postContent = response.postContent;
			$('#postTitle').val(postTitle);
			$('#postContent').summernote('code', postContent);
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

boardedit = (boardId) => {
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
		boardedit(boardId, postTitle, postContent);
	});
});

