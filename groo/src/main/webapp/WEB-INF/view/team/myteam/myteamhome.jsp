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
			<h1 class="title">내 스터디</h1>
			<p class="subtitle">참여 중인 스터디를 확인해보세요</p>
		</div>

		<div class="card-grid" id="cardGrid">

		</div>
	</div>
</body>
<script type="text/javascript">
function generateStudyCard(team) {
    // 템플릿 리터럴(Template Literal)을 사용하여 HTML 문자열을 생성합니다.
    const cardHtml =
        '<article class="study-card glass-card">' +
            '<div class="card-gradient"></div>' +
            '<div class="badge-corner badge-gold"></div>' +
            '<div class="card-header">' +
                '<div class="study-name">' +
                    // studyData.name 변수 결합
                    '<span class="name-text">' + team.studyTitle + '</span>' +
                '</div>' +
                '' +
            '</div>' +
            '<div class="study-stats">' +
                '<div class="stat-item">' +
                    '<div class="stat-icon">👥</div>' +
                    '<div class="stat-info">' +
                        '<span class="stat-label">팀원</span>' +
                        // studyData.userCount 변수 결합
                        '<span class="stat-value">' + team.studyMax + '명</span>' +
                    '</div>' +
                '</div>' +
                '<div class="stat-divider"></div>' +
                '<div class="stat-item">' +
                    '<div class="stat-icon">' +
                        '<img src="https://i.postimg.cc/N0CsYrW9/free-icon-love-9812568.png" class="heart"></div>' +
                        '<div class="stat-info">' +
                            '<span class="stat-label">좋아요</span>' +
                            // studyData.likes 변수 결합
                            '<span class="stat-value">' + team.studyPick + '</span>' +
                        '</div>' +
                '</div>' +
            '</div>' +
            '<div class="badge-info">' +
                '<div class="badge-stat-gold">' +
                    // studyData.badgeGold 변수 결합
                    '<div class="badge-stat-count">' + team.studyGold + '</div>' +
                    '<div class="badge-stat-icon"></div>' +
                '</div>' +
                '<div class="badge-divider"></div>' +
                '<div class="badge-stat-silver">' +
                    // studyData.badgeSilver 변수 결합
                    '<div class="badge-stat-count">' + team.studySilver + '</div>' +
                    '<div class="badge-stat-icon"></div>' +
                '</div>' +
                '<div class="badge-divider"></div>' +
                '<div class="badge-stat-bronze">' +
                    // studyData.badgeBronze 변수 결합
                    '<div class="badge-stat-count">' + team.studyBlonze + '</div>' +
                    '<div class="badge-stat-icon"></div>' +
                '</div>' +
            '</div>' +
            '<div class="leader-info">' +
                '<span>팀장</span>' +
                // studyData.leaderName 변수 결합
                '<span class="leader-name">' + team.memNick + '</span>' +
            '</div>' +
            '<div class="card-actions">' +
                '<button class="btn-detail">' +
                    '<span>상세보기</span>' +
                '</button>' +
                '<button class="btn-leave">' +
                    '<span>탈퇴</span>' +
                '</button>' +
            '</div>' +
        '</article>';

    // 2. 생성된 HTML을 #cardGrid에 추가합니다.
    $('#cardGrid').append(cardHtml);
}
var myTeamList = () => {
	const memLoginId = sessionStorage.getItem('userId');
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teamselectmyteam.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memLoginId : memLoginId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			response.forEach((team) => {
				generateStudyCard(team);
			});
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {

		}
	}); // $.ajax 끝
}
$(document).ready(function() {
	myTeamList();
});
</script>
</html>

