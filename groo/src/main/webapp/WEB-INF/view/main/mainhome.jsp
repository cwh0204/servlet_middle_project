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
            '<button class="btn-detail" ' + 
            'data-study-id="' + team.studyId + '">' + 
            '<span>상세보기</span>' +
            '</button>';
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


$(document).ready(function() {
    // #cardGrid의 내용을 비워서 새로운 카드들을 추가할 준비를 합니다. (선택 사항)
    // $('#cardGrid').empty(); 
    
	$.ajax({
		url: "teamselectall.do",
		type: "GET",
		dataType: "json",

		success: function(response) {
			console.log("서버로부터 받은 응답:", response);

        	$('#cardGrid').empty();
            // 1. 응답(response)이 배열인지 확인합니다.
            if (Array.isArray(response)) {

                // 2. 배열을 순회하며 각 스터디 객체(team)에 대해 함수를 호출합니다.
                response.forEach(function(team) {
                    // 이전에 정의한 generateStudyCard 함수를 호출하여 
                    // #cardGrid에 HTML 카드를 추가합니다.
                    generateStudyCard(team);
                });

                console.log("스터디 카드 생성이 완료되었습니다.");

            } else {
                console.error("서버 응답 형식이 배열이 아닙니다.");
            }
		},
        error: function(xhr, status, error) {
            console.error("AJAX 요청 실패:", status, error);
            // 사용자에게 오류 메시지를 표시하는 코드를 추가할 수 있습니다.
        }
	});
});

</script>


</html>

