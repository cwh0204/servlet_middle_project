// js/team/teamdetail/teamdetailmemlist.js (강퇴 버튼 추가 버전)

var studyId = sessionStorage.getItem('teamId');
var memLoginId = sessionStorage.getItem('userId');
var LeaderCheck;
teamMemberList = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teammember.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId: studyId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			teamMemberListCard(response);
			
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

teamLeaderCheck = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teamleaderteampage.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId: studyId,
			memLoginId: memLoginId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			LeaderCheck = response.studyRoll;
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

teamLeaderChange = (memId) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teammemberleaderchange.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId: studyId,
			memId: memId,
			memLoginId: memLoginId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {

			teamLeaderCheck();
			teamMemberList();
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

teamMemberKick = (memId) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teammemberkick.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId: studyId,
			memId: memId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {

			teamLeaderCheck();
			teamMemberList();
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

teamMemberListCard = (dummyMembers) => {

	const $container = $('#memberCardsBody');
	$container.empty();

	if (dummyMembers.length > 0) {
		dummyMembers.forEach(function(member) {

			// 🔹 1. 메인 카드 요소 생성 및 데이터 속성 추가
			const $card = $('<div>')
				.addClass('member-card')
				.data('member-id', member.memId);
			// 🔹 2. card-header 및 card-detail-list 생성 (이전과 동일)
			const $header = $('<div>').addClass('card-header');
			const $name = $('<h4>').text(member.memNick);
			const $group = $('<span>').addClass('card-group').text(member.groupName);
			$header.append($name, $group);

			const $details = $('<ul>').addClass('card-detail-list');
			const $rollItem = $('<li>').append(
				$('<strong>').text('스터디 직책:'),
				$('<span>').text(member.studyRoll)
			);
			const $emailItem = $('<li>').append(
				$('<strong>').text('이메일:'),
				$('<span>').text(member.memEmail)
			);
			const $joinDateItem = $('<li>').append(
				$('<strong>').text('가입일:'),
				$('<span>').text(member.studyJoinedDate)
			);
			$details.append($rollItem, $emailItem, $joinDateItem);

			// 🔹 4. 버튼 컨테이너 생성 (직책 부여 / 반장 넘기기)
			const $buttonGroup = $('<div>').addClass('button-group').css({
				'display': 'flex',
				'gap': '10px',
				'margin-top': '15px'
			});

			/*			// 4-1. 직책 부여 버튼
						const $assignRollButton = $('<button>')
							.addClass('btn assign-roll-btn')
							.css({
								'flex-grow': 1,
								'padding': '8px',
								'background-color': '#007bff',
								'color': '#fff',
								'border': 'none',
								'border-radius': '4px',
								'cursor': 'pointer',
								'font-size': '1em'
							})
							.text('직책 부여');*/
			let $kickButton = $('<div>');
			if (member.studyRoll != '팀장') {

				// 4-2. 반장 넘기기 버튼
				let $transferRollButton = $('<button>')
					.addClass('btn transfer-roll-btn')
					.css({
						'flex-grow': 1,
						'padding': '8px',
						'background-color': '#28a745',
						'color': '#fff',
						'border': 'none',
						'border-radius': '4px',
						'cursor': 'pointer',
						'font-size': '1em'
					})
					.text('팀장 넘기기');

				$buttonGroup.append($transferRollButton);

				// 🔹 5. 강퇴 버튼 생성 (새로운 행) 🆕
				$kickButton = $('<button>')
					.addClass('btn kick-member-btn')
					.css({
						'display': 'block',
						'width': '100%',
						'padding': '8px',
						'margin-top': '10px', // 버튼 그룹과의 간격
						'background-color': '#dc3545', // 빨간색
						'color': '#fff',
						'border': 'none',
						'border-radius': '4px',
						'cursor': 'pointer',
						'font-size': '1em'
					})
					.text('강퇴');
			} else {
				let $transferRollButton = $('<div>');

				$buttonGroup.append($transferRollButton);

				// 🔹 5. 강퇴 버튼 생성 (새로운 행) 🆕
				$kickButton = $('<div>');
			}
			// 🔹 6. 카드에 모든 요소 추가 후 컨테이너에 삽입
			if (LeaderCheck == 'L') {
				$card.append($header, $details, $buttonGroup, $kickButton);
			} else {
				$card.append($header, $details);
			}
			$container.append($card);
		});

		// 4. 이벤트 핸들러 추가


		// 4-2. 팀장 넘기기 버튼 클릭 이벤트
		$container.on('click', '.transfer-roll-btn', function() {
			const $cardElement = $(this).closest('.member-card');
			const memberId = $cardElement.data('member-id');
			const memberName = $cardElement.find('.card-header h4').text();

			alert(`${memberName}님(ID: ${memberId})에게 스터디 반장 권한을 넘기는 기능을 실행합니다. (주의: 스터디 장만 실행 가능)`);
			teamLeaderChange(memberId);
			teamMemberList();
		});

		// 4-3. 강퇴 버튼 클릭 이벤트 🆕
		$container.on('click', '.kick-member-btn', function() {
			const $cardElement = $(this).closest('.member-card');
			const memberId = $cardElement.data('member-id');
			const memberName = $cardElement.find('.card-header h4').text();


			if (confirm(`경고: ${memberName}님(ID: ${memberId})을 스터디에서 강퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.`)) {

				alert(`${memberName}님(ID: ${memberId}) 강퇴 요청을 서버에 전송했습니다.`);
				teamMemberKick(memberId);
			}
		});

	} else {
		// 멤버가 없을 경우 메시지 표시
		$container.append('<p style="text-align: center; width: 100%; color: #888; margin-top: 20px;">해당 팀의 인원이 없습니다.</p>');
	}
}

(function() {
	teamLeaderCheck();
	teamMemberList();
})();