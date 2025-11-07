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

		<div class="card-grid" id="cardGrid"></div>
	</div>

	<div class="modal fade" id="passwordCheckModal" tabindex="-1"
		aria-labelledby="passwordCheckModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordCheckModalLabel">🔐 스터디
						비밀번호 확인</h5>
					<button type="button" id="modalCloseIcon" class="btn-close"
						data-bs-dismiss="modal" aria-label="닫기"></button>
				</div>

				<div class="modal-body">
					<form id="passwordCheckForm">
						<div class="mb-3">
							<label for="inputPassword" class="form-label">스터디의 비밀번호를
								입력해주세요:</label> <input type="password" class="form-control"
								id="inputPassword" required>
							<div class="invalid-feedback" id="feedbackMessage"></div>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" id="modalClose" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						id="confirmPasswordBtn">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
var teamPass;
var studyId;
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
                '<div class="stat-item study-like">' +
                    '<div class="stat-icon">' +
                        '<img src="https://i.postimg.cc/N0CsYrW9/free-icon-love-9812568.png" class="heart"></div>' +
                        '<div class="stat-info">' +
                            '<span class="stat-label">좋아요</span>' +
                            // studyData.likes 변수 결합
                            '<span class="stat-value">' + team.studyLike + '</span>' +
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
			console.log(response);
			response.forEach((team) => {
				generateStudyCard(team);
			});
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {

		}
	}); // $.ajax 끝
}

var pageLoad = (studyId) => {
	const pageToLoad = 'teamdetail.do?studyId=' + studyId;
    sessionStorage.removeItem('team_last_view');
    console.log("마지막 페이지"+pageToLoad);
    
    // 3. $('#contentArea')의 내용을 서버 응답으로 받은 HTML로 교체합니다.
    $('#contentArea').load(pageToLoad, function(response, status, xhr) {
        if (status === "success") {
        	
        	sessionStorage.setItem('teamId', studyId);
        	
            console.log("✅ '#contentArea'에 상세 정보 로드 완료.");
            
        } else {
            // 사용자에게 실패 메시지를 표시할 수 있습니다.
            $('#contentArea').html('<p>상세 정보를 불러오는 데 실패했습니다. 다시 시도해 주세요.</p>');
        }
    });
}
var studyLike = (studyId) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teamlikeupdate.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId : studyId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
		    $('#cardGrid').empty();
			myTeamList();
		},
		error: function(xhr, status, error) {

		}
	});
}

var teamPassAjax = (studyId) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teampassselect.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId: studyId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {

			if(response == null){
				pageLoad(studyId);
			}else{
				teamPass = response.studyPass;
				const myModal = new bootstrap.Modal(document.getElementById('passwordCheckModal'));
                myModal.show();
			}
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}
$(document).ready(function() {
	
	myTeamList();
 	$('#cardGrid').on('click', '.btn-detail', function() {
        // 이 'this'는 실제로 클릭된 '.btn-detail' 요소를 가리킵니다.
        const studyId = $(this).data('studyId');
        console.log(studyId);
        if (studyId) {
        	teamPassAjax(studyId);
        } else {
            console.error("❌ 오류: studyId를 가져올 수 없습니다.");
        }
    });
 	$('#cardGrid').on('click', '.study-like', function(){
 		const $currentElement = $(this);
 	    const $studyCard = $currentElement.closest('.study-card');
 	    const $detailButton = $studyCard.find('.btn-detail');
 	    studyId = $detailButton.data('studyId');
 	    
 		studyLike(studyId);
 	});
 	
 	$('#confirmPasswordBtn').on('click',function(){

 		const passCheck = $('#inputPassword').val();
 		if(teamPass == passCheck){
 			const passwordCheckModalElement = document.getElementById('passwordCheckModal');
 		    const passwordCheckModal = new bootstrap.Modal(passwordCheckModalElement);
 		    passwordCheckModal.hide();
 		    $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');
            $('body').removeAttr('style');
 			pageLoad(studyId);
 		}else{
 			alert("비밀번호가 일치하지 않습니다.");
 		}
 	});
});
</script>
</html>

