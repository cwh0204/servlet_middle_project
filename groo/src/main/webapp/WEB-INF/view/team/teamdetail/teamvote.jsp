<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팀 투표 게시판 - Groo</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: #f8f9fa;
	font-family: 'Noto Sans KR', sans-serif;
}

.header {
	background-color: white;
	border-bottom: 1px solid #e0e0e0;
	padding: 15px 0;
}

.header-content {
	max-width: 1400px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
}

.logo img {
	height: 50px;
}

.nav-menu {
	display: flex;
	gap: 50px;
	list-style: none;
}

.nav-menu a {
	text-decoration: none;
	color: #333;
	font-weight: 500;
	font-size: 16px;
}

.nav-menu a.active {
	color: #5a9a5a;
	border-bottom: 3px solid #5a9a5a;
	padding-bottom: 22px;
}

.container-main {
	max-width: 1400px;
	margin: 0 auto;
	display: flex;
	gap: 20px;
	height: 100%;
    width: 100%;
}

.main-content {
	flex: 1;
	background-color: white;
	padding: 30px;
	border-radius: 8px;
}

.page-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 30px;
	color: #333;
}

.btn-create {
	background-color: #5a9a5a;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	float: right;
	margin-bottom: 20px;
}

.btn-create:hover {
	background-color: #4a8a4a;
}

.vote-card {
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	padding: 20px;
	margin-bottom: 20px;
	transition: box-shadow 0.3s;
}

.vote-card:hover {
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.vote-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.vote-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.vote-status {
	padding: 5px 15px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: bold;
}

.status-ongoing {
	background-color: #e3f2e3;
	color: #5a9a5a;
}

.status-closed {
	background-color: #e0e0e0;
	color: #666;
}

.vote-info {
	color: #666;
	font-size: 14px;
	margin-bottom: 15px;
}

.vote-options {
	margin-top: 15px;
}

.vote-option {
	margin-bottom: 10px;
}

.vote-option-header {
	display: flex;
	justify-content: space-between;
	margin-bottom: 5px;
	font-size: 14px;
}

.progress {
	height: 25px;
	cursor: pointer;
}

.progress-bar {
	background-color: #5a9a5a;
}

.vote-footer {
	margin-top: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: #999;
	font-size: 13px;
}

.btn-vote {
	background-color: #5a9a5a;
	color: white;
	border: none;
	padding: 8px 20px;
	border-radius: 5px;
	font-size: 14px;
}

.btn-vote:hover {
	background-color: #4a8a4a;
}

.modal-body .form-label {
	font-weight: bold;
	margin-top: 15px;
}

.option-input-group {
	margin-bottom: 10px;
}

.btn-add-option {
	background-color: #f0f0f0;
	color: #666;
	border: 1px dashed #ccc;
	width: 100%;
	padding: 10px;
	margin-top: 10px;
}

.btn-remove-option {
	background-color: #dc3545;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 3px;
	font-size: 12px;
}

.btn-x {
	height: 44px;
	margin: 0 12px 0 0;
}

.btn-o {
	margin: 0;
}
</style>
</head>
<body>

	<!-- 메인 컨텐츠 -->
	<div class="container-main">
		<!-- 투표 게시판 -->
		<div class="main-content">
			<div class="clearfix">
				<h2 class="page-title" style="float: left;">팀 투표 게시판</h2>
				<button class="btn btn-create" id="btnCreateVote">투표 만들기</button>
			</div>

			<div style="clear: both;"></div>
			<div id="voteListContainer" class="main-content"></div>
		</div>
	</div>

	<!-- 투표 만들기 모달 -->
	<div class="modal fade" id="createVoteModal" tabindex="-1"
		aria-labelledby="createVoteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="createVoteModalLabel">새 투표 만들기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="voteTitle" class="form-label">투표 제목 *</label> <input
							type="text" class="form-control" id="voteTitle"
							placeholder="투표 제목을 입력하세요" required>
					</div>

					<div class="mb-3">
						<label for="voteDescription" class="form-label">투표 설명</label>
						<textarea class="form-control" id="voteDescription" rows="3"
							placeholder="투표에 대한 설명을 입력하세요"></textarea>
					</div>

					<div class="mb-3">
						<label for="voteDeadline" class="form-label">마감 일시 *</label> <input
							type="datetime-local" class="form-control" id="voteDeadline"
							required>
					</div>

					<div class="mb-3">
						<label class="form-label">투표 항목</label>
						<div>
							<div class="option-input-group d-flex gap-2 mb-2">
								<input type="text" id="voteOptionsContainer"
									class="form-control" placeholder="항목 1" required>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-x"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-create btn-o"
						id="btnSubmitVote">투표 만들기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


	<script>
	function renderVoteCards(voteList) {
	    const $container = $('#voteListContainer'); // ✅ 투표 카드가 추가될 컨테이너의 ID를 지정하세요.
	    $container.empty(); // 기존 내용을 비워 누적되는 것을 방지합니다.

	    if (!voteList || voteList.length === 0) {
	        $container.html('<p class="no-data">등록된 투표가 없습니다.</p>');
	        return;
	    }

	    voteList.forEach(vote => {
	        // 1. 필요한 데이터 추출 및 형식 변환 (예: 마감일)
	        const voteEnd = vote.voteEnd ? 
	            new Date(vote.voteEnd).toLocaleString('ko-KR', { 
	                year: 'numeric', month: '2-digit', day: '2-digit', 
	                hour: '2-digit', minute: '2-digit', hour12: false 
	            }).replace(/\. /g, '.').replace(/\.$/, '') // '2025. 11. 06. 23:40' -> '2025.11.06 23:40'
	            : '미정';
	            
	        // 2. 투표 진행 상태 결정 (실제 로직에 따라 구현 필요. 여기서는 '진행중' 고정)
	        const statusClass = 'status-ongoing'; 
	        const statusText = '진행중'; 

	        // 3. 템플릿 리터럴 (Template Literal)을 사용하여 HTML 문자열 생성
	        
	        console.log(vote);
	        
	        const TOTAL_VOTERS = 15; 

			// 현재 옵션의 득표 수
			const optionVotes = vote.voteOk; 
			
			// 게이지 폭 (퍼센트) 계산
			// (현재 득표 수 / 총 인원 5명) * 100
			let percentage = 0;
			if (TOTAL_VOTERS > 0) {
			    // 득표율을 계산하고 반올림합니다.
			    percentage = Math.round((optionVotes / TOTAL_VOTERS) * 100); 
			}
	        
	        const cardHtml = 
			    '<div class="vote-card" data-vote-id="' + vote.voteId + '">' +
			        '<div class="vote-header">' +
			            '<div class="vote-title">' + vote.voteTitle + '</div>' +
			            '<span class="vote-status ' + statusClass + '">' + statusText + '</span>' +
			        '</div>' +
			        '<div class="vote-info">' +
			            '작성자: ' + vote.studyRoll + ' ' + vote.memNick + '	 |  ' +
			            '마감: ' + voteEnd + '  |  ' +
			            
			        '</div>' +
			        '<p>' + vote.voteContent + '</p>' +
			
			        '<div class="vote-options">' +
			            '<div class="vote-option">' +
			                '<div class="vote-option-header">' +
			                    '<span>투표 진행 상황</span> <span>'+ vote.voteOk + ' 표 </span>' +
			                '</div>' +
			                '<div class="progress">' +
			                    '<div class="progress-bar" role="progressbar" style="width: ' + percentage + '%"></div>' +
			                '</div>' +
			            '</div>' +
			        '</div>' +
			    '</div>';
	        
	        // 4. 컨테이너에 HTML 추가
	        $container.append(cardHtml);
	    });
	}
	
	var voteSelect = (studyId) => {
        $.ajax({
            url: 'voteselect.do',
            method: 'POST',
            data: {
            	studyId: studyId
            },
            success: function(response) {
            	renderVoteCards(response);
            },
            error: function() {
            	console.log(response);
            }
        });
	}
	
        $(document).ready(function() {

        	var studyId = sessionStorage.getItem('teamId');
			
        	voteSelect(studyId);
        	

            // 투표 만들기 버튼 클릭
            $('#btnCreateVote').on('click', function() {
                var myModal = new bootstrap.Modal(document.getElementById('createVoteModal'));
                myModal.show();
            });

            // 투표 만들기 제출
            $('#btnSubmitVote').on('click', function() {
            	
            	const memLoginId = sessionStorage.getItem('userId');
            	const studyId = sessionStorage.getItem('teamId');
                const voteTitle = $('#voteTitle').val();
                const voteContent = $('#voteDescription').val();
                const voteEnd = $('#voteDeadline').val();
                const voteSubject = $('#voteOptionsContainer').val();
                
                if(!voteTitle || !voteContent || !voteSubject) {
                    alert('필수 항목을 모두 입력해주세요. (제목, 마감일시, 최소 1개의 항목)');
                    return;
                }
                
                $.ajax({
                    url: 'voteinsert.do',
                    method: 'POST',
                    data: {
                    	memLoginId: memLoginId,
                    	studyId: studyId,
                    	voteTitle: voteTitle,
                    	voteContent: voteContent,
                    	voteEnd: voteEnd,
                    	voteSubject: voteSubject
                    },
                    success: function(response) {
                        alert('투표가 생성되었습니다!');
                        voteSelect(studyId);
                        bootstrap.Modal.getInstance(document.getElementById('createVoteModal')).hide();
                    },
                    error: function() {
                        alert('투표 생성에 실패했습니다.');
                    }
                });
            });
            

            // 투표하기 버튼 클릭
            $('.btn-vote').on('click', function() {
                alert('투표 참여 기능은 개발 중입니다.');
            });
            
            // 진행률 바 클릭 시 투표
            $('#voteListContainer').on('click', '.progress', function() {
                const $progress = $(this);
                const $voteCard = $progress.closest('.vote-card');
                const voteId = $voteCard.data('vote-id');
                // 1. 투표가 '진행중' 상태인지 확인
                if($progress.closest('.vote-card').find('.status-ongoing').length > 0) {
                    // 2. 정확한 투표 옵션 텍스트를 찾기 위한 DOM 탐색 로직 수정
                    // `.progress`의 부모인 `.vote-option`을 찾은 후, 그 안에서 헤더 텍스트를 찾습니다.
                    const $voteOption = $progress.closest('.vote-option');
                    var optionText = $voteOption.find('.vote-option-header span:first').text();
                    // 3. 투표 확인 및 완료 로직
                    if(confirm(optionText + '에 투표하시겠습니까?')) {
                        console.log(voteId);
                        $.ajax({
                            url: 'voteok.do',
                            method: 'POST',
                            data: {
                            	voteId: voteId
                            },
                            success: function(response) {
                                alert('투표가 완료되었습니다!');
                                voteSelect(studyId);
                                bootstrap.Modal.getInstance(document.getElementById('createVoteModal')).hide();
                            },
                            error: function() {
                                alert('투표 생성에 실패했습니다.');
                            }
                        });
                    }
                }
            });
        });
    </script>
</body>
</html>