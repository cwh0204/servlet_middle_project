<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="css/base.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style>

/* 메인 콘텐츠 */
.content-header {
	margin-bottom: 24px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.content-header-left h1 {
	font-size: 28px;
	color: #1f2937;
	font-weight: 700;
	margin-bottom: 8px;
}

.content-header-left p {
	color: #6b7280;
	font-size: 14px;
}

.content-header-right {
	display: flex;
	gap: 12px;
}

/* 버튼 */
.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s ease;
	display: flex;
	align-items: center;
	gap: 8px;
}

.btn-primary {
	background: linear-gradient(135deg, #2d6a4f 0%, #40916c 100%);
	color: white;
}

.btn-primary:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(45, 106, 79, 0.3);
}

.btn-secondary {
	background: white;
	color: #2d6a4f;
	border: 2px solid #2d6a4f;
}

.btn-secondary:hover {
	color: #2d6a4f;
	background: #f0fdf4;
}

/* 카드 */
.card {
	background: white;
	border-radius: 12px 12px 0px 0px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	border: 1px solid #e5e7eb;
	border-bottom: none;
	overflow: hidden;
}

.card-content {
	background: white;
	border-radius: 0px 0px 12px 12px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	border-top: none;
	border: 1px solid #e5e7eb;
	overflow: hidden;
}
/* 필터 및 검색 영역 */
.filter-section {
	padding: 20px 24px;
	background: #f9fafb;
	border-bottom: 1px solid #e5e7eb;
	display: flex;
	gap: 12px;
	align-items: center;
	flex-wrap: wrap;
}

.search-box {
	flex: 1;
	min-width: 250px;
	position: relative;
}

.search-box input {
	width: 100%;
	padding: 10px 16px 10px 40px;
	border: 2px solid #e5e7eb;
	border-radius: 8px;
	font-size: 14px;
	transition: all 0.2s ease;
}

.search-box input:focus {
	outline: none;
	border-color: #2d6a4f;
	box-shadow: 0 0 0 3px rgba(45, 106, 79, 0.1);
}

.search-icon {
	position: absolute;
	left: 12px;
	top: 50%;
	transform: translateY(-50%);
	color: #6b7280;
}

.filter-group {
	display: flex;
	gap: 8px;
	align-items: center;
}

.filter-select {
	padding: 10px 16px;
	border: 2px solid #e5e7eb;
	border-radius: 8px;
	font-size: 14px;
	background: white;
	cursor: pointer;
	transition: all 0.2s ease;
}

.filter-select:focus {
	outline: none;
	border-color: #2d6a4f;
}

/* 통계 카드 */
.stats-row {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	margin-bottom: 24px;
}

.stat-card {
	background: white;
	padding: 20px;
	border-radius: 12px;
	border: 1px solid #e5e7eb;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.stat-card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12px;
}

.stat-label {
	color: #6b7280;
	font-size: 13px;
	font-weight: 600;
}

.stat-icon {
	width: 36px;
	height: 36px;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
}

.stat-icon.green {
	background: #d1fae5;
	color: #2d6a4f;
}

.stat-icon.blue {
	background: #dbeafe;
	color: #1e40af;
}

.stat-icon.yellow {
	background: #fef3c7;
	color: #92400e;
}

.stat-icon.red {
	background: #fee2e2;
	color: #991b1b;
}

.stat-value {
	font-size: 28px;
	font-weight: 700;
	color: #1f2937;
}

.stat-change {
	font-size: 12px;
	margin-top: 8px;
}

.stat-change.up {
	color: #059669;
}

.stat-change.down {
	color: #dc2626;
}

/* 커스텀 랜더러 */
.btn-renderer-container {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 15px;
}

.user-randarer-button {
	padding: 6px 15px;
	border: 2px solid #2d6a4f;
	border-radius: 6px;
	font-size: 12px;
	font-weight: 600;
	color: #2d6a4f;
	cursor: pointer;
	transition: all 0.2s ease;
	display: flex;
	align-items: center;
	gap: 8px;
	background: white;
}
.btn.btn-primary.none{
	display: none;
}
/*그리드 설정*/
.modified-row {
	background-color: #fffacd !important; /* 밝은 노란색 */
}

.tui-grid-border-line.tui-grid-border-line-top {
	display: none;
}

.modified-cell {
	/* 기존 행의 배경색보다 진한 노란색/주황색 계열 적용 */
	background-color: #fce899 !important;
	font-weight: bold; /* 선택적으로 폰트도 강조 */
}

/* .btn.btn-primary{
	display: none;
} */
/* 반응형 */
@media ( max-width : 1200px) {
	.stats-row {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 768px) {
	.main-layout {
		flex-direction: column;
	}
	.stats-row {
		grid-template-columns: 1fr;
	}
	.content-header {
		flex-direction: column;
		align-items: flex-start;
		gap: 16px;
	}
	.filter-section {
		flex-direction: column;
	}
	.search-box {
		width: 100%;
	}
}
</style>
</head>
<body>
	<div class="content-header">
		<div class="content-header-left">
			<h1>사용자 관리</h1>
			<p>전체 사용자 목록을 조회하고 관리합니다</p>
		</div>
		<div class="content-header-right">
			<button class="btn btn-secondary" onclick="exportData()">
				<span></span> 내보내기
			</button>
			<button class="btn btn-primary" onclick="addUser()">
				<span>+</span> 사용자 추가
			</button>
			<button class="btn btn-primary" onclick="userCeckInsert()">
				<span>*</span> 저장
			</button>
			<button class="btn btn-primary" onclick="rollbackRowData()">
				<span>-</span> 삭제
			</button>
				<button type="button" class="btn btn-primary none" data-bs-toggle="modal"
		data-bs-target="#exampleModal">Launch demo modal</button>
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
					검색
				</button>
			</div>
		</div>
	</div>
		<!-- Modal -->
	<div class="card-content">
		<div id="grid"></div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">중복된 데이터를 사용하는 유저가 있습니다</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body check-date">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
var addUser = () => {
    // 사용자 추가 로직
    if (!grid) {
        alert('그리드가 초기화되지 않았습니다.');
        return;
    }

    const newRowData = {
    };
    
    // 가장 위에 새 행을 추가하고 포커스를 줍니다.
    grid.appendRow(newRowData, {
        at: 0,
        focus: true 
    });
};

var resetGridData = () => {
	$.ajax({
        // 데이터를 전송할 서버 URL
        url: 'adminuserselectall.do',
        // 전송 방식 (로그인/회원가입은 보통 POST 사용)
        type: 'POST', 
        // 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
        data: {
        },        
        // 데이터 전송 성공 시 실행
        success: function(response){
            // response는 서버에서 돌려준 데이터입니다.
            console.log("서버 응답:", response);
            console.log("서버 응답 아작스:", response.activeMembers);
            grid.resetData(response);
        },
        
        // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        error: function(xhr, status, error){
            console.error("AJAX 통신 실패!");
            console.log("상태:", status);
            console.log("에러:", error);
            alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
        }
    });
}

var searchUser = () => {
	const serchInput = $('#searchInput').val();
	console.log(serchInput);
	$.ajax({
        // 데이터를 전송할 서버 URL
        url: 'adminselectsearchuser.do',
        // 전송 방식 (로그인/회원가입은 보통 POST 사용)
        type: 'POST', 
        // 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
        data: {
        	serchName : serchInput
        },        
        // 데이터 전송 성공 시 실행
        success: function(response){
            // response는 서버에서 돌려준 데이터입니다.
            console.log("서버 응답:", response);
            console.log("서버 응답:", response.activeMembers);
            grid.resetData(response);
        },
        
        // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        error: function(xhr, status, error){
            console.error("AJAX 통신 실패!");
            console.log("상태:", status);
            console.log("에러:", error);
            alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
        }
    });
}
var rollbackRowData = () => {
	const targetRowKey = 0;
	const originalRowData = originalFullData.find(row => row.id === targetRowKey+1);
	console.log(originalRowData);
    grid.setRow(targetRowKey, originalRowData, {
        extended: true 
    });
    grid.removeRowClassName(targetRowKey, 'modified-row');
    const columns = grid.getColumns(); // 그리드의 모든 컬럼 정보를 가져옵니다.

    columns.forEach(column => {
        const columnName = column.name;
        
        // removeCellClassName을 사용하여 해당 행(targetRowKey)과 컬럼(columnName)의 셀에서
        // 'modified-cell' 클래스를 제거합니다.
        grid.removeCellClassName(targetRowKey, columnName, 'modified-cell');
    });
}

var exportData = () => {
    if (!grid) {
        alert('그리드가 초기화되지 않았습니다.');
        return;
    }

    // TOAST UI Grid의 export('csv') 기능을 사용하여 CSV 파일로 내보냅니다.
    grid.export('csv', { 
        fileName: '사용자_관리_목록', // 다운로드될 파일명 설정
        includeHiddenColumns: true,      // 숨겨진 컬럼도 포함할지 여부
        onlySelected: false              // 선택된 행만 내보낼지 여부 (false면 전체)
    });
};

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
        success: function(response){
            // response는 서버에서 돌려준 데이터입니다.
            console.log("서버 응답:", response);
            console.log("서버 응답:", response.activeMembers);
            // 예: 성공 메시지 표시 또는 페이지 이동
            $('.total-member').text(response.totalMembers);
            $('.inactive-member').text(response.inactiveMembers);
            $('.weekly-signups').text(response.weeklySignups);
            $('.active-member').text(response.activeMembers);
        },
        
        // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        error: function(xhr, status, error){
            console.error("AJAX 통신 실패!");
            console.log("상태:", status);
            console.log("에러:", error);
            alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
        }
    }); // $.ajax 끝
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
        	memLoginId : row.memLoginId,
        	memNick : row.memNick,
        	memEmail : row.memEmail,
        	memPhone : row.memPhone
        },
        // 데이터 전송 성공 시 실행
        success: function(response){
            // response는 서버에서 돌려준 데이터입니다.
            console.log("유저체크 응답:", response);
            if(response.length === 0){
             	console.log("로우확인"+row.memLoginId);
             	userInsert(row);	
            }else if(response.length === 1){
             	userUpdate(row);
            }else{
            	response.forEach(function(rowck) {
            		
            		if(rowck.memLoginId !== row.memLoginId){
                		if(rowck.memNick === row.memNick){
                			userCheckList.push(
                			        row.memLoginId + "님과 같은 아이디를 사용중인 회원이 있습니다." 
                			);
                		}
                		if(rowck.memEmail === row.memEmail){
                			userCheckList.push(
                			        row.memLoginId + "님과 같은 이메일를 사용중인 회원이 있습니다." 
                			);
                		}
                		if(rowck.memPhone === row.memPhone){
                			userCheckList.push(
                			        row.memLoginId + "님과 같은 휴대전화번호를 사용중인 회원이 있습니다." 
                			);
                		}
            		}
            	});
            }
            if(userCheckList.length !== 0){
            	$('.none').click();
            	$('.check-date').empty();
            	userCheckList.forEach(function(row) {
            		$('.check-date').append(row + '<br>');
            	});
            }
        },
        // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        error: function(xhr, status, error){
            console.error("AJAX 통신 실패!");
            console.log("상태:", status);
            console.log("에러:", error);
            alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
        }
    });
}
var userInsert = (row) => {
	console.log("로우확인2"+row);
	$.ajax({
        // 데이터를 전송할 서버 URL
        url: 'adminuserinsert.do',
        // 전송 방식 (로그인/회원가입은 보통 POST 사용)
        type: 'POST', 
        // 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
        data: {
        	memLoginId : row.memLoginId,
        	memName : row.memName,
        	memPass : row.memPass,
        	memNick : row.memNick,
        	memEmail : row.memEmail,
        	memPhone : row.memPhone,
        	memAddr : row.memAddr
        },        
        // 데이터 전송 성공 시 실행
        success: function(response){
            // response는 서버에서 돌려준 데이터입니다.
            console.log("서버 응답:", response);
            console.log("서버 응답:", response.activeMembers);
			resetGridData();

        },
        
        // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        error: function(xhr, status, error){
            console.error("AJAX 통신 실패!");
            console.log("상태:", status);
            console.log("에러:", error);
            alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
        }
    });
}

var userUpdate = (row) => {
	console.log("로우확인2"+row);
	$.ajax({
        // 데이터를 전송할 서버 URL
        url: 'adminupdateuser.do',
        // 전송 방식 (로그인/회원가입은 보통 POST 사용)
        type: 'POST', 
        // 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
        data: {
        	memLoginId : row.memLoginId,
        	memName : row.memName,
        	memPass : row.memPass,
        	memNick : row.memNick,
        	memEmail : row.memEmail,
        	memPhone : row.memPhone,
        	memAddr : row.memAddr,
        	memStatus : row.memStatus
        },        
        // 데이터 전송 성공 시 실행
        success: function(response){
            // response는 서버에서 돌려준 데이터입니다.
            console.log("서버 응답:", response);
            console.log("서버 응답:", response.activeMembers);
			resetGridData();

        },
        
        // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        error: function(xhr, status, error){
            console.error("AJAX 통신 실패!");
            console.log("상태:", status);
            console.log("에러:", error);
            alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
        }
    });
}

var userCeckInsert = () => {
	
	const createdRows = grid.getModifiedRows().createdRows;
	const updatedRows = grid.getModifiedRows().updatedRows;
	
	createdRows.forEach(function(row) {
		
		if(row.memLoginId !== null){
			console.log(row.memLoginId);
			userCheck(row);
		}
	});
	
	updatedRows.forEach(function(row) {
		
		if(row.memLoginId !== null){
			console.log("업데이트"+row.memLoginId);
			userCheck(row);
		}
	});
}

$(document).ready(function() {
	userStats();
    grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : {
			api : {
				readData : {
					url : 'http://localhost:8080/groo/adminuserselectall.do',
					method : 'POST',
					data: {
/* 	                    searchKeyword: '홍길동',
	                    searchType: 'name',
	                    onlyActive: true */
	                }
				}
			},
		},
		rowKey: 'id',
		scrollX : true,
		scrollY : true,
		rowHeaders: ['checkbox'],
		columns : [ {
			header : '아이디',
			name : 'memLoginId',
			editor : 'text'
		}, {
			header : '이름',
			name : 'memName',
			editor : 'text'
		}, {
			header : '비밀번호',
			name : 'memPass',
			editor : 'text'
		}, {
			header : '닉네임',
			name : 'memNick',
			editor : 'text'
		}, {
			header : '이메일',
			name : 'memEmail',
			editor : 'text'
		},{
			header : '전화번호',
			name : 'memPhone',
			editor : 'text'
		},{
			header : '주소',
			name : 'memAddr',
			editor : 'text'
		},{
			header :'탈퇴여부',
			name : 'memStatus',
			editor : 'text'
		},{
	          header: 'Grade',
	          name: 'grade',
	          renderer: {
	            type: CustomUserBtnRenderer,
	          }
	    }
		]
	});
    grid.on('response', function(ev) {
        let response = ev.xhr.responseText;
        let data = JSON.parse(response);
        
        originalFullData = data;
        
        grid.resetData(data);
    });
    
    grid.on('afterChange', ev => {
    	console.log('after change:', ev.changes[0].columnName);
        console.log('after change:', ev.changes[0].value);
        console.log(grid.getModifiedRows());
        const changeUser = grid.getModifiedRows();
        
        console.log(changeUser.updatedRows);
    });
    grid.setBodyHeight(450);
    
    grid.on('beforeChange', ev => {
  	  // `ev.changes`는 배열 형태로 여러 변경 사항을 포함할 수 있습니다.
  	  // 여기서는 첫 번째 변경 사항에 접근합니다.
  	  const { rowKey } = ev.changes[0];
  	  const columnName = ev.changes[0].columnName;
  	  // 수정이 발생한 행에 'modified-row' 클래스 추가
  	  grid.addRowClassName(rowKey, 'modified-row');
  	  grid.addCellClassName(rowKey, columnName, 'modified-cell');
  });
});

</script>
</html>