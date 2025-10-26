/**
 * 
 */

var userUpdate = (row) => {
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
			resetGridData();

		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

var userInsert = (row) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminuserinsert.do',
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
			memAddr: row.memAddr
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			resetGridData();

		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

var userCheck = (row) => {
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
			if (response.length === 0) {
				userInsert(row);
			} else if (response.length === 1) {
				userUpdate(row);
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

var userStats = () => {

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

var resetGridData = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminuserselectall.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memStatus: 'N'
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			grid.resetData(response);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
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
			memStatus: 'N'
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			grid.resetData(response);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}