function teamlist() {
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
		allStudies.forEach(function(team) {
			const leaderNick = leaderMap.get(team.studyId);
			team.memNick = leaderNick || '팀장 정보 없음';
			generateStudyCard(team);
		});
	} else {
		console.error("스터디 응답 형식이 배열이 아닙니다.");
	}
}

// 기존 pageLoad 함수 수정

var pageLoad = (studyId) => {
   const pageToLoad = 'teamdetail.do?studyId=' + studyId;
    sessionStorage.removeItem('team_last_view');
    console.log("마지막 페이지"+pageToLoad);
    
    // 3. $('#contentArea')의 내용을 서버 응답으로 받은 HTML로 교체합니다.
    $('#contentArea').load(pageToLoad, function(response, status, xhr) {
        if (status === "success") {
           
           sessionStorage.setItem('teamId', studyId);
           
            
        } else {
            // 사용자에게 실패 메시지를 표시할 수 있습니다.
            $('#contentArea').html('<p>상세 정보를 불러오는 데 실패했습니다. 다시 시도해 주세요.</p>');
        }
    });
}

function generateStudyCard(team) {
	const cardHtml = `
            <article class="study-card glass-card">
                <div class="card-gradient"></div>
                <div class="badge-corner badge-gold"></div>
                <div class="card-header">
                    <div class="study-name">
                        <span class="name-text">${team.studyTitle}</span>
                    </div>
                </div>
                <div class="study-stats">
                    <div class="stat-item">
                        <div class="stat-icon">👥</div>
                        <div class="stat-info">
                            <span class="stat-label">팀원</span>
                            <span class="stat-value">${team.studyMax}명</span>
                        </div>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <div class="stat-icon">
                            <img src="https://i.postimg.cc/N0CsYrW9/free-icon-love-9812568.png" class="heart">
                        </div>
                        <div class="stat-info">
                            <span class="stat-label">좋아요</span>
                            <span class="stat-value">${team.studyPick}</span>
                        </div>
                    </div>
                </div>
                <div class="badge-info">
                    <div class="badge-stat-gold">
                        <div class="badge-stat-count">${team.studyGold}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                    <div class="badge-divider"></div>
                    <div class="badge-stat-silver">
                        <div class="badge-stat-count">${team.studySilver}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                    <div class="badge-divider"></div>
                    <div class="badge-stat-bronze">
                        <div class="badge-stat-count">${team.studyBlonze}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                </div>
                <div class="leader-info">
                    <span>팀장</span>
                    <span class="leader-name">${team.memNick}</span>
                </div>
                <div class="card-actions">
                    <button class="btn-detail" data-study-id="${team.studyId}">
                        <span>상세보기</span>
                    </button>
                </div>
            </article>
        `;

	$('#cardGrid').append(cardHtml);
}