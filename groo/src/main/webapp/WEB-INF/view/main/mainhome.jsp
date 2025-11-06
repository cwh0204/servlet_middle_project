<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/team/myteam/myteamhome.css" rel="stylesheet">

<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1 class="title">스터디</h1>
			<p class="subtitle">Groo 스터디를 확인해보세요</p>
		</div>

		<div class="card-grid" id="cardGrid"></div>
	</div>
</body>

<script type="text/javascript">
	// === 1. 데이터 결합 및 렌더링을 처리하는 핵심 로직 함수 (완성) ===
	// 이 함수는 두 Ajax 응답을 모두 받아 데이터를 합치고 카드를 생성합니다.
	function processAndRenderCards(allStudies, leaderList) {
		// 1. 리더 리스트(leaderList)를 Map으로 변환하여 O(1) 시간 복잡도로 빠르게 검색할 수 있게 합니다.
		const leaderMap = new Map();
		leaderList.forEach(leader => {
			// studyId를 키로, memNick을 값으로 저장합니다.
			leaderMap.set(leader.studyId, leader.memNick);
		});
		
		console.log("1. 변환된 리더 Map:", leaderMap); 

		$('#cardGrid').empty(); // 기존 카드 그리드를 비웁니다.

		if (Array.isArray(allStudies)) {
			allStudies.forEach(function(team) {
				// 2. 각 스터디(team)의 studyId로 leaderMap에서 닉네임을 찾습니다.
				const leaderNick = leaderMap.get(team.studyId);
				
				// 3. 찾은 닉네임을 스터디 객체(team)에 추가합니다. (team.memNick 필드를 만듦)
				team.memNick = leaderNick || '팀장 정보 없음';

				// 4. 리더 닉네임 정보가 추가된 team 객체로 카드를 생성하여 뷰에 반영합니다.
				generateStudyCard(team);
			});
		} else {
			console.error("스터디 응답 형식이 배열이 아닙니다.");
		}
	}


	// === 2. 스터디 카드를 HTML로 생성하는 함수 (HTML 문자열 오류 수정) ===
	function generateStudyCard(team) {
		
		console.log("==> generateStudyCard 호출됨. team 객체 내용:", team);
        console.log(`studyTitle: ${team.studyTitle}, studyMax: ${team.studyMax}, memNick: ${team.memNick}`);
        // 🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟
		// 템플릿 리터럴로 변경하여 HTML 문자열 오류와 가독성 문제를 해결했습니다.
		const cardHtml = `
            <article class="study-card glass-card">
                <div class="card-gradient"></div>
                <div class="badge-corner badge-gold"></div>
                <div class="card-header">
                    <div class="study-name">
                        <span class="name-text">\${team.studyTitle}</span>
                    </div>
                </div>
                <div class="study-stats">
                    <div class="stat-item">
                        <div class="stat-icon">👥</div>
                        <div class="stat-info">
                            <span class="stat-label">팀원</span>
                            <span class="stat-value">\${team.studyMax}명</span>
                        </div>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <div class="stat-icon">
                            <img src="https://i.postimg.cc/N0CsYrW9/free-icon-love-9812568.png" class="heart">
                        </div>
                        <div class="stat-info">
                            <span class="stat-label">좋아요</span>
                            <span class="stat-value">\${team.studyPick}</span>
                        </div>
                    </div>
                </div>
                <div class="badge-info">
                    <div class="badge-stat-gold">
                        <div class="badge-stat-count">\${team.studyGold}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                    <div class="badge-divider"></div>
                    <div class="badge-stat-silver">
                        <div class="badge-stat-count">\${team.studySilver}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                    <div class="badge-divider"></div>
                    <div class="badge-stat-bronze">
                        <div class="badge-stat-count">\${team.studyBlonze}</div>
                        <div class="badge-stat-icon"></div>
                    </div>
                </div>
                <div class="leader-info">
                    <span>팀장</span>
                    <span class="leader-name">\${team.memNick}</span>
                </div>
                <div class="card-actions">
                    <button class="btn-detail" data-study-id="\${team.studyId}">
                        <span>상세보기</span>
                    </button>
                </div>
            </article>
        `;

		$('#cardGrid').append(cardHtml);
	}


	// === 3. 문서 준비 및 중첩 AJAX 호출 (순서 보장) ===
	$(document).ready(function() {
		// ❌ LeaderList 변수는 이제 필요 없습니다.

		// 1. 첫 번째 Ajax: 스터디 목록을 가져옵니다.
		$.ajax({
			url : "teamselectall.do",
			type : "GET",
			dataType : "json",
			success : function(allStudiesResponse) {
				
				// 2. 스터디 목록을 가져온 후, 리더 목록을 요청합니다.
				// (두 번째 Ajax는 첫 번째 success 안에 중첩되어 순서를 보장합니다.)
				$.ajax({
					url : "teammerberleaders.do",
					type : "GET",
					dataType : "json",
					success : function(leaderResponse) {
						
						// 3. 두 데이터가 모두 확보된 시점에 데이터 결합 및 렌더링 함수를 호출합니다.
						processAndRenderCards(allStudiesResponse, leaderResponse);

					},
					error : function(xhr, status, error) {
						console.error("리더 AJAX 요청 실패:", status, error);
					}
				}); // 2차 Ajax 종료

			},
			error : function(xhr, status, error) {
				console.error("스터디 AJAX 요청 실패:", status, error);
			}
		}); // 1차 Ajax 종료

		// ❌ 오류 지점: 이 코드는 비동기 때문에 제거되어야 합니다.
		// processAndRenderCards(); 
	});
</script>


</html>

