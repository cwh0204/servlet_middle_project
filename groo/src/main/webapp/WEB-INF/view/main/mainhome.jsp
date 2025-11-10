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

var pageLoad = (studyId) => {
	const pageToLoad = 'teamdetail.do?studyId=' + studyId;
    sessionStorage.removeItem('team_last_view');
    sessionStorage.removeItem('team_detail_last_view');
    
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
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}
	$(document).ready(function() {
		var memLoginId = sessionStorage.getItem('userId');
		grooteam();
		$('#cardGrid').on('click', '.btn-detail', function() {
	        // 이 'this'는 실제로 클릭된 '.btn-detail' 요소를 가리킵니다.
	        const studyId = $(this).data('studyId');
	        if (studyId) {
	        	teamPassAjax(studyId);
	        } else {
	            console.error("❌ 오류: studyId를 가져올 수 없습니다.");
	        }
	    });
	});
</script>
</html>

