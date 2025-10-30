/**
 * 
 */

mycoment = (boardId) => {
	$.ajax({
		url: 'comentselect.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId,
			memLoginId: 'cwh0204'
		},
		success: function(response) {
			if (response.length != 0) {
				allcoment(boardId, response[0].memNick);
			} else {
				allcoment(boardId);
			}
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

allcoment = (boardId, userNickName) => {
	$.ajax({
		url: 'comentselect.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId
		},
		success: function(response) {

			// 🚨 개선된 부분: 새로운 목록을 추가하기 전에 기존 목록을 모두 비웁니다.
			$('.comment-list').empty();

			// 네이티브 forEach로 배열을 순회합니다.
			response.forEach(item => {

				if (item.memNick === userNickName) {
					// 1. 각 요소를 jQuery 객체로 생성 및 속성 설정
					const $commentItem = $('<div>').addClass('comment-item')
						.attr('data-comment-id', item.comentId);

					const $commentMeta = $('<div>').addClass('comment-meta');

					// 2. 메타 정보 추가
					$commentMeta.append($('<strong>').text(item.memNick));
					$commentMeta.append($('<span>').text(item.comentDate));

					const $commentContent = $('<p>').text(item.comentContent);

					// 3. 버튼 추가
					const $reportButton = $('<button>').addClass('comment-report').text('신고')
					const $editButton = $('<button>').addClass('comment-edit').text('수정').attr('data-comment-id', item.comentId).css('display', 'block');
					const $deleteButton = $('<button>').addClass('comment-delete').text('삭제').attr('data-comment-id', item.comentId).css('display', 'block');
					// 4. 모든 요소를 최상위 요소에 조립
					$commentItem.append($commentMeta);
					$commentItem.append($commentContent);
					$commentItem.append($reportButton);
					$commentItem.append($editButton);
					$commentItem.append($deleteButton);

					// 5. 완성된 항목을 DOM에 추가
					$('.comment-list').append($commentItem);
				} else {
					// 1. 각 요소를 jQuery 객체로 생성 및 속성 설정
					const $commentItem = $('<div>').addClass('comment-item')
						.attr('data-comment-id', item.comentId);

					const $commentMeta = $('<div>').addClass('comment-meta');

					// 2. 메타 정보 추가
					$commentMeta.append($('<strong>').text(item.memNick));
					$commentMeta.append($('<span>').text(item.comentDate));

					const $commentContent = $('<p>').text(item.comentContent);

					// 3. 버튼 추가
					const $reportButton = $('<button>').addClass('comment-report').text('신고')
					const $editButton = $('<button>').addClass('comment-edit').text('수정').attr('data-comment-id', item.comentId);
					const $deleteButton = $('<button>').addClass('comment-delete').text('삭제').attr('data-comment-id', item.comentId);

					// 4. 모든 요소를 최상위 요소에 조립
					$commentItem.append($commentMeta);
					$commentItem.append($commentContent);
					$commentItem.append($reportButton);
					$commentItem.append($editButton);
					$commentItem.append($deleteButton);

					// 5. 완성된 항목을 DOM에 추가
					$('.comment-list').append($commentItem);
				}
			});
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

boardComentinsert = (boardId) => {
	const commentContent = $('#commentContent').val();
		
	$.ajax({
		url: 'comentinsert.do',
		type: 'POST',
		dataType: 'json',
		data: {
			memLoginId: 'aqw1232',
			boardId: boardId,
			comentContent: commentContent
		}, //컨트롤러에게 보내는 데이터
		
		success: function(response) {
			const commentCount = $('.comment-list .comment-item').length+1;
			$('.comment-section h3').text(`댓글 (${commentCount})`);
			$('.comment-list').empty();
			allcoment(boardId);
		},
		
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

boardLikeUserCheck = (boardId) => {
	$.ajax({
		url: 'boardlikesearch.do',
		type: 'POST',
		dataType: 'json',
		data: {
			findName: 'aqw1232',
			boardId: boardId
		},
		success: function(response) {
			if (response.boardLikeCount == 1) {
				boardLikeTotalCount(boardId);
				$('#likeBtn').css('background-color', '#fff3cd');

			} else {
				boardLikeTotalCount(boardId);
				$('#likeBtn').css('background-color', '#fff');

			}
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

boardLikeTotalCount = (boardId) => {
	$.ajax({
		url: 'boardlikesearch.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId
		},
		success: function(response) {
			$('#likeBtn').text(`👍 좋아요 (${response.boardLikeCount})`);
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

boardlikeinsert = (boardId) => {
	$.ajax({
		url: 'boardlikeinsert.do',
		type: 'POST',
		dataType: 'json',
		data: {
			findName: 'aqw1232',
			boardId: boardId
		},
		success: function(response) {
			boardLikeUserCheck(boardId);
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

boarddetailselect = (boardId) => {
	$.ajax({
		url: 'boarddetailselect.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId
		},
		success: function(response) {			
			$('.post-title').text(response.postTitle);
			$('.meta-item strong').text(response.memNick);
			$('#Date').text(response.postingDate);
			$('.board-content').text(response.postContent);
			$('#likeBtn').text(`👍 좋아요 (${response.boardLikeCount})`);
			$('.comment-section h3').text(`댓글 (${response.comentCount})`);
			$('#postViews').text(response.postViews);
			
			if(response.memLoginId != 'aqw1232') {
				const $modifyButton = $('#modifyButton');
				const $deleteButton = $('#deleteButton');
				$modifyButton.hide();
				$deleteButton.hide();
			}
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

$(document).ready(function() {
	/* const writer = 로그인한 사용자 ID (세션); */
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const boardId = urlParams.get('id');

	boarddetailselect(boardId);
	boardLikeUserCheck(boardId);

	$('#likeBtn').on('click', function() {
		boardlikeinsert(boardId);
	});

	$('#commentSubmit').on('click', function() {
		boardComentinsert(boardId);
	});
	
	$('.btn-secondary').on('click', function() {
	        window.history.back();
	});
	
	allcoment(boardId);
	mycoment(boardId);
	
	
	
});





