/**
 * 
 */

var resetDisableGridData = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminuserselectall.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memStatus: 'Y'
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			disableusergrid.resetData(response);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

var exportDisableUserData = () => {
	if (!disableusergrid) {
		alert('그리드가 초기화되지 않았습니다.');
		return;
	}

	// TOAST UI Grid의 export('csv') 기능을 사용하여 CSV 파일로 내보냅니다.
	disableusergrid.export('csv', {
		fileName: '비활성_사용자_관리_목록', // 다운로드될 파일명 설정
		includeHiddenColumns: true,      // 숨겨진 컬럼도 포함할지 여부
		onlySelected: false              // 선택된 행만 내보낼지 여부 (false면 전체)
	});
};

var disableUserStats = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminstatsuser.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			// 예: 성공 메시지 표시 또는 페이지 이동
			$('.total-member').text(response.totalMembers);
			$('.inactive-member').text(response.inactiveMembers);
			$('.weekly-signups').text(response.weeklySignups);
			$('.active-member').text(response.activeMembers);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {

		}
	}); // $.ajax 끝
}

var searchUser = () => {
	const serchInput = $('#searchInput').val();
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminselectsearchuser.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			serchName: serchInput,
			memStatus: 'Y'
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			disableusergrid.resetData(response);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

var disableUserUpdate = (row) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminupdateuser.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memLoginId: row.memLoginId,
			memName: row.memName,
			memPass: row.memPass,
			memNick: row.memNick,
			memEmail: row.memEmail,
			memPhone: row.memPhone,
			memAddr: row.memAddr,
			memStatus: row.memStatus
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			resetDisableUserGridData();

		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

var disableUserCheck = (row) => {
	let userCheckList = [];
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminuserselectcheck.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memLoginId: row.memLoginId,
			memNick: row.memNick,
			memEmail: row.memEmail,
			memPhone: row.memPhone
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			if (response.length === 1) {
				disableUserUpdate(row);
			} else {
				response.forEach(function(rowck) {

					if (rowck.memLoginId !== row.memLoginId) {
						if (rowck.memNick === row.memNick) {
							userCheckList.push(
								row.memLoginId + "님과 같은 닉네임를 사용중인 회원이 있습니다."
							);
						}
						if (rowck.memEmail === row.memEmail) {
							userCheckList.push(
								row.memLoginId + "님과 같은 이메일를 사용중인 회원이 있습니다."
							);
						}
						if (rowck.memPhone === row.memPhone) {
							userCheckList.push(
								row.memLoginId + "님과 같은 휴대전화번호를 사용중인 회원이 있습니다."
							);
						}
					}
				});
			}
			if (userCheckList.length !== 0) {
				$('.none').click();
				$('.check-date').empty();
				userCheckList.forEach(function(row) {
					$('.check-date').append(row + '<br>');
				});
			}
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {

		}
	});
}
var disableUserCheckInsert = () => {
	
	const updatedRows = disableusergrid.getModifiedRows().updatedRows;

	updatedRows.forEach(function(row) {

		if (row.memLoginId !== null) {
			disableUserCheck(row);
		}
	});
}

var resetDisableUserGridData = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminuserselectall.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memStatus: 'Y'
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			disableusergrid.resetData(response);
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}