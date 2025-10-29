/**
 * 
 */
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
				$('#Date').text(response.postingDate);
				$('.likeBtn').text(response.postContent);
				$('.comment-section h3').text(`댓글 (${response.comentCount})`);
				$('.comment-section h3').text(`댓글 (${response.comentCount})`);
				$('#postViews').text(response.postViews);				
			},
			error : function() {
				alert("서버 통신 오류가 발생했습니다.");
			}
		});
		
		
	/*	$('#likeBtn').on('click', function() {
			$('.likeBtn').text(`좋아요 (${response.comentCount})`);
		});*/
});