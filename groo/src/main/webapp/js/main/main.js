function grooteam() {
	$.ajax({
		url: "teamselectall.do",
		type: "GET",
		dataType: "json",
		success: function(allStudiesResponse) {

			$.ajax({
				url: "teammemberleaders.do",
				type: "GET",
				dataType: "json",
				success: function(leaderResponse) {

					processAndRenderCards(allStudiesResponse, leaderResponse);
				},
				error: function(xhr, status, error) {
					console.error("리더 AJAX 요청 실패:", status, error);
				}
			});
		},
		error: function(xhr, status, error) {
			console.error("스터디 AJAX 요청 실패:", status, error);
		}
	});
}
function processAndRenderCards(allStudies, leaderList) {
	const leaderMap = new Map();
	leaderList.forEach(leader => {
		leaderMap.set(leader.studyId, leader.memNick);
	});

	$('#cardGrid').empty();

	if (Array.isArray(allStudies)) {
		allStudies.forEach(function(study) { 
			const leaderNick = leaderMap.get(study.studyId);
			study.memNick = leaderNick || '팀장 정보 없음';
			generateStudyCard(study); 
		});
	} else {
		console.error("스터디 응답 형식이 배열이 아닙니다.");
	}
}

function generateStudyCard(card) { // 👈 매개변수 이름을 'card'로 변경
	const cardHtml = `
            <article class="study-card glass-card">
                <div class="card-gradient"></div>
                <div class="badge-corner badge-gold"></div>
                <div class="card-header">
                    <div class="study-name">
                        <span class="name-text">${card.studyTitle}</span> 
                    </div>
                </div>
                <div class="study-stats">
                    <div class="stat-item">
                        <div class="stat-icon">👥</div>
                        <div class="stat-info">
                            <span class="stat-label">팀원</span>
                            <span class="stat-value">${card.studyMax}명</span>
                        </div>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <div class="stat-icon">
                            <img src="https://i.postimg.cc/N0CsYrW9/free-icon-love-9812568.png" class="heart">
                        </div>
                        <div class="stat-info">
                            <span class="stat-label">좋아요</span>
                            <span class="stat-value">${card.studyLike}</span>
                        </div>
                    </div>
                </div>
                <div class="badge-info">
                    <div class="badge-stat-gold">
                        <div class="badge-stat-count">${card.studyGold}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                    <div class="badge-divider"></div>
                    <div class="badge-stat-silver">
                        <div class="badge-stat-count">${card.studySilver}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                    <div class="badge-divider"></div>
                    <div class="badge-stat-bronze">
                        <div class="badge-stat-count">${card.studyBlonze}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                </div>
                <div class="leader-info">
                    <span>팀장</span>
                    <span class="leader-name">${card.memNick}</span>
                </div>
                <div class="card-actions">
                    <button class="btn-detail" data-study-id="${card.studyId}">
                        <span>상세보기</span>
                    </button>
                </div>
            </article>
        `;

	$('#cardGrid').append(cardHtml);
}