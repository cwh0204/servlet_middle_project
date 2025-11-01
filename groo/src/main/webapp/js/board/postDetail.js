//댓글 수정
comentedit = (boardId, comentId, comentContent) => {
	$.ajax({
		url: 'comentedit.do',
		type: 'POST',
		dataType: 'json',
		data: {
				comentId : comentId,
				comentContent : comentContent
		},
		success: function(response) {
			window.location.href = "postdetail.do?id=" + boardId;
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

//댓글 삭제
comentdelete = (boardId, commentIdToDelete) => {
	$.ajax({
		url: 'comentdelete.do ',
		type: 'POST',
		dataType: 'json',
		data: {
			comentId: commentIdToDelete
		},
		success: function(response) {
			console.log("asdasd");
			window.location.href = "postdetail.do?id=" + boardId;
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}



//게시물 삭제
boardelete = (boardId) => {
	$.ajax({
		url: 'boarddelete.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId
		},
		success: function(response) {
			window.location.href = "main.do";
		},
		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

//내 댓글
mycoment = (boardId, writer) => {
	$.ajax({
		url: 'comentselect.do',
		type: 'POST',
		dataType: 'json',
		data: {
			boardId: boardId,
			memLoginId: writer
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

//모든 유저가 쓴 댓글
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
					const $commentItem = $('<div>').addClass('comment-item').attr('data-comment-id', item.comentId);

					const $commentMeta = $('<div>').addClass('comment-meta');

					// 2. 메타 정보 추가
					$commentMeta.append($('<strong>').text(item.memNick));
					$commentMeta.append($('<span>').text(item.comentDate));

					const $commentContent = $('<p>').text(item.comentContent);

					// 3. 버튼 추가
					const $reportButton = $('<button>').addClass('comment-report').text('신고')
					const $editButton = $('<button>').addClass('comment-edit').text('수정').attr('data-comment-id', item.comentId).css('display', 'block').on('click', function() {

						// 1. 클릭된 버튼을 기준으로 해당 댓글 항목(부모 요소)을 찾습니다.
						const $commentItem = $(this).closest('.comment-item'); // ⭐️ .comment-item 클래스를 부모 요소로 가정
						console.log($commentItem);

						const $contentP = $commentItem.find('p');
						console.log($contentP);

						const currentContent = $contentP.text().trim();

						const $editTextarea = $('<textarea>')
							.addClass('form-comment-item comment-meta')
							.val(currentContent);
							
						const $saveButton = $('<button>')
							.addClass('comment-edit save-edit-btn me-1')
							.text('완료')
							.attr('data-comment-id', item.comentId)
							.css({
								'display': 'block',
							}).on('click', function() {
								const commentId = $(this).data('commentId');
								comentedit(boardId, commentId, $editTextarea[0].value);
							});
								
						const $cancelButton = $('<button>')
							.addClass('comment-delete save-edit-btn me-1')
							.text('취소')
							.css({
								'display': 'block',
							})

						$contentP.replaceWith($editTextarea);

						$(this).hide(); // 수정 버튼 숨김 (클릭된 자기 자신)
						$commentItem.find('.comment-delete').hide();

						$editTextarea.after($saveButton, $cancelButton);

						$cancelButton.on('click', function() {
							$editTextarea.replaceWith($contentP.show()); // <p> 태그 복원
							$saveButton.remove();
							$cancelButton.remove();
							$editButton.show(); // 수정 버튼 다시 표시
							$commentItem.find('.comment-delete').show(); // 삭제 버튼 다시 표시
						});
					});
					
					const $deleteButton = $('<button>').addClass('comment-delete').text('삭제').attr('data-comment-id', item.comentId).css('display', 'block').on('click', function() {
						const commentId = $(this).data('commentId');
						comentdelete(boardId, commentId);
					});

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

//게시물 댓글 등록
boardComentinsert = (boardId, writer) => {
	const commentContent = $('#commentContent').val();

	$.ajax({
		url: 'comentinsert.do',
		type: 'POST',
		dataType: 'json',
		data: {
			memLoginId: writer,
			boardId: boardId,
			comentContent: commentContent
		},

		success: function(response) {
			const commentCount = $('.comment-list .comment-item').length + 1;
			$('.comment-section h3').text(`댓글 (${commentCount})`);
			$('.comment-list').empty();
			allcoment(boardId);
		},

		error: function() {
			alert("서버 통신 오류가 발생했습니다.");
		}
	});
}

//게시물 좋아요 css
boardLikeUserCheck = (boardId, writer) => {
	$.ajax({
		url: 'boardlikesearch.do',
		type: 'POST',
		dataType: 'json',
		data: {
			findName: writer,
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

//게시물 좋아요 개수
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

//게시물 좋아요
boardlikeinsert = (boardId, writer) => {
	$.ajax({
		url: 'boardlikeinsert.do',
		type: 'POST',
		dataType: 'json',
		data: {
			findName: writer,
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

//게시물 상세
boarddetailselect = (boardId, writer) => {
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
			$('.board-content').html(response.postContent);
			$('#likeBtn').text(`👍 좋아요 (${response.boardLikeCount})`);
			$('.comment-section h3').text(`댓글 (${response.comentCount})`);
			$('#postViews').text(response.postViews);

			if (response.memLoginId != writer) {
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
	const writer = sessionStorage.getItem('userId');
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const boardId = urlParams.get('id');
	
	//로그인이 되어 있는 상태
	if (writer) {
		boarddetailselect(boardId, writer);
		boardLikeUserCheck(boardId, writer);
		allcoment(boardId, writer);
		mycoment(boardId, writer);
		
		//좋아요 클릭시
		$('#likeBtn').on('click', function() {
			boardlikeinsert(boardId, writer);
		});

		//목록으로 클릭시
		$('.btn-secondary').on('click', function() {
			window.location.href = "main.do";
		});

		//수정버튼 클릭시
		$('.btn-primary').on('click', function() {
			window.location.href = "boardedit.do?id=" + boardId;
		});

		//댓글등록 클릭시
		$('#commentSubmit').on('click', function() {
			window.location.href = "postdetail.do?id=" + boardId;
			boardComentinsert(boardId, writer);
		});

		//댓글수정버튼 클릭시
		$('.comment-delete').on('click', function() {
			comentedit(boardId, writer);
		});

		//삭제버튼 클릭시
		$('.btn-danger').on('click', function() {
			boardelete(boardId);
		});
		//신고버튼 클릭시
		$('#reportPostBtn').on('click',function(){
			console.log("신고버튼 클릭");
		});
		
	} else {
		alert("로그인을 해야 이용할 수 있는 서비스입니다.");
		history.go(-1);
	}
});





