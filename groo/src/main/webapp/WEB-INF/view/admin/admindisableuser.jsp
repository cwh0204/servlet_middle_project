<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/adminCss/adminUser/adminUser.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>
	<div class="content-header">
		<div class="content-header-left">
			<h1>비활성 사용자 관리</h1>
			<p>전체 사용자 목록을 조회하고 관리합니다</p>
		</div>
		<div class="content-header-right">
			<button class="btn btn-secondary" onclick="exportDisableUserData()">
				<span></span> 내보내기
			</button>
			<button class="btn btn-primary" onclick="disableUserCheckInsert()">
				<span>*</span> 저장
			</button>
			<button type="button" class="btn btn-primary none"
				data-bs-toggle="modal" data-bs-target="#exampleModal">Launch
				demo modal</button>
		</div>
	</div>
	<div class="stats-row">
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">전체 사용자</span>
				<div class="stat-icon green"></div>
			</div>
			<div class="stat-value total-member">1,284</div>
			<div class="stat-change up">↑ 전월 대비 +12%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">활성 사용자</span>
				<div class="stat-icon blue"></div>
			</div>
			<div class="stat-value inactive-member">1,156</div>
			<div class="stat-change up">↑ 전월 대비 +8%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">신규 가입</span>
				<div class="stat-icon yellow"></div>
			</div>
			<div class="stat-value weekly-signups">48</div>
			<div class="stat-change up">↑ 이번 주</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">비활성</span>
				<div class="stat-icon red"></div>
			</div>
			<div class="stat-value active-member">128</div>
			<div class="stat-change down">↓ 전월 대비 -5%</div>
		</div>
	</div>
	<div class="card">
		<div class="filter-section">
			<div class="search-box">
				<span class="search-icon"></span> <input type="text"
					id="searchInput" placeholder="검색...">
			</div>
			<div class="filter-group">
				<button class="btn btn-secondary" onclick="searchUser()">
					검색</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="card-content">
		<div id="disableusergrid"></div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">중복된 데이터를
						사용하는 유저가 있습니다</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body check-date">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

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

$(document).ready(function() {
	disableUserStats();
	resetDisableGridData();
	disableusergrid = new tui.Grid({
        el: document.getElementById('disableusergrid'),
        data: [], // 초기 데이터는 빈 배열로 설정
        rowKey: 'id',
        scrollX: true,
        scrollY: true,
        columns: [{
            header: '아이디',
            name: 'memLoginId',
            editor: 'text'
        }, {
            header: '이름',
            name: 'memName',
            editor: 'text'
        }, {
            header: '비밀번호',
            name: 'memPass',
            editor: 'text'
        }, {
            header: '닉네임',
            name: 'memNick',
            editor: 'text'
        }, {
            header: '이메일',
            name: 'memEmail',
            editor: 'text'
        }, {
            header: '전화번호',
            name: 'memPhone',
            editor: 'text'
        }, {
            header: '주소',
            name: 'memAddr',
            editor: 'text'
        }, {
            header: '탈퇴여부',
            name: 'memStatus',
            editor: 'text'
        }]
    });
	
// 2. 이벤트 바인딩
    
    // (이전에 사용하려고 했던) 'response' 이벤트 설정
    // 🚨 참고: data:[] 설정으로 인해 이 이벤트는 Grid의 API 통신 방식(data.api)을 사용하지 않으면 실행되지 않습니다.
    // 수동 AJAX 방식에서는 이 로직을 resetGridData 함수 내부에서 처리해야 합니다.
    disableusergrid.on('response', function(ev) {
        let response = ev.xhr.responseText;
        let data = JSON.parse(response);

        originalFullData = data; // originalFullData 변수가 외부 스코프에 있어야 접근 가능합니다.

        disableusergrid.resetData(data);
    });

    // 데이터 변경 후 이벤트 설정
    disableusergrid.on('afterChange', ev => {
        const changeUser = disableusergrid.getModifiedRows();
    });
    
    // 데이터 변경 전 이벤트 설정 (수정 셀/행 강조)
    disableusergrid.on('beforeChange', ev => {
        const { rowKey } = ev.changes[0];
        const columnName = ev.changes[0].columnName;
        
        // 수정이 발생한 행/셀에 클래스 추가
        disableusergrid.addRowClassName(rowKey, 'modified-row');
        disableusergrid.addCellClassName(rowKey, columnName, 'modified-cell');
    });

    // 3. 기타 설정 및 반환
    disableusergrid.setBodyHeight(450);
});
</script>
</html>