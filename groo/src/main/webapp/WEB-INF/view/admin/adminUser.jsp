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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto',
		'Helvetica', 'Arial', sans-serif;
	background: #f8faf9;
	min-height: 100vh;
}

/* 헤더 */
header {
	background: linear-gradient(135deg, #2d6a4f 0%, #40916c 100%);
	padding: 0;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.header-content {
	max-width: 1600px;
	margin: 0 auto;
	padding: 16px 40px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.logo {
	display: flex;
	align-items: center;
	gap: 12px;
}

.logo-icon {
	width: 40px;
	height: 40px;
	background: white;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	font-weight: bold;
	color: #2d6a4f;
}

.logo-text {
	font-size: 24px;
	font-weight: 700;
	color: white;
	letter-spacing: -0.5px;
}

.page-title {
	font-size: 18px;
	color: white;
	font-weight: 500;
}

/* 메인 레이아웃 */
.main-layout {
	max-width: 1600px;
	margin: 0 auto;
	display: flex;
	min-height: calc(100vh - 72px);
}

/* 사이드바 */
.sidebar {
	width: 260px;
	background: white;
	border-right: 1px solid #e5e7eb;
	padding: 24px 0;
}

.sidebar-header {
	padding: 0 24px 16px;
	color: #6b7280;
	font-size: 12px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.menu-item {
	padding: 12px 24px;
	cursor: pointer;
	transition: all 0.2s ease;
	display: flex;
	align-items: center;
	gap: 12px;
	color: #4b5563;
	font-weight: 500;
	font-size: 15px;
	border-left: 3px solid transparent;
}

.menu-item:hover {
	background: #f0fdf4;
	color: #2d6a4f;
}

.menu-item.active {
	background: #f0fdf4;
	color: #2d6a4f;
	border-left-color: #2d6a4f;
	font-weight: 600;
}

.menu-icon {
	font-size: 20px;
	width: 24px;
	text-align: center;
}

/* 메인 콘텐츠 */
.main-content {
	flex: 1;
	padding: 32px 40px;
	overflow-y: auto;
}

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
	background: #f0fdf4;
}

/* 카드 */
.card {
	background: white;
	border-radius: 12px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
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

/*그리드 설정*/
.modified-row {
	background-color: #fffacd !important; /* 밝은 노란색 */
}

.modified-cell {
	/* 기존 행의 배경색보다 진한 노란색/주황색 계열 적용 */
	background-color: #fce899 !important;
	font-weight: bold; /* 선택적으로 폰트도 강조 */
}
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
	.sidebar {
		width: 100%;
		border-right: none;
		border-bottom: 1px solid #e5e7eb;
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
				<span>📥</span> 내보내기
			</button>
			<button class="btn btn-primary" onclick="addUser()">
				<span>➕</span> 사용자 추가
			</button>
			<button class="btn btn-primary" onclick="rollbackRowData()">
				<span>➕</span> 수정 롤백
			</button>
		</div>
	</div>
	<div class="stats-row">
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">전체 사용자</span>
				<div class="stat-icon green"></div>
			</div>
			<div class="stat-value">1,284</div>
			<div class="stat-change up">↑ 전월 대비 +12%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">활성 사용자</span>
				<div class="stat-icon blue"></div>
			</div>
			<div class="stat-value">1,156</div>
			<div class="stat-change up">↑ 전월 대비 +8%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">신규 가입</span>
				<div class="stat-icon yellow"></div>
			</div>
			<div class="stat-value">48</div>
			<div class="stat-change up">↑ 이번 주</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">비활성</span>
				<div class="stat-icon red"></div>
			</div>
			<div class="stat-value">128</div>
			<div class="stat-change down">↓ 전월 대비 -5%</div>
		</div>
	</div>
	<div class="card">
		<div class="filter-section">
			<div class="search-box">
				<span class="search-icon">🔍</span> <input type="text"
					id="searchInput" placeholder="이름, 이메일로 검색...">
			</div>
			<div class="filter-group">
				<select class="filter-select" id="statusFilter">
					<option value="">전체 상태</option>
					<option value="활성">활성</option>
					<option value="비활성">비활성</option>
					<option value="대기중">대기중</option>
				</select> <select class="filter-select" id="roleFilter">
					<option value="">전체 권한</option>
					<option value="관리자">관리자</option>
					<option value="매니저">매니저</option>
					<option value="일반">일반 사용자</option>
				</select>
			</div>
		</div>
	</div>
	<div>
		<div id="grid"></div>
	</div>
</body>
<script>
const addUser = () => {
    // 사용자 추가 로직
    if (!grid) {
        alert('그리드가 초기화되지 않았습니다.');
        return;
    }

    const newRowData = {
        name: '새 사용자',
        username: 'new_user',
        email: 'new@example.com',
        phone: '000-0000-0000'
    };
    
    // 가장 위에 새 행을 추가하고 포커스를 줍니다.
    grid.appendRow(newRowData, {
        at: 0,
        focus: true 
    });
};

const rollbackRowData = () => {
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
$(document).ready(function() {
	
    grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : {
			api : {
				readData : {
					url : 'https://koreanjson.com/users',
					method : 'GET',
				}
			},
		},
		rowKey: 'id',
		scrollX : true,
		scrollY : true,
		columns : [ {
			header : 'ID',
			name : 'id'
		}, {
			header : '이름',
			name : 'name',
			editor : 'text'
		}, {
			header : '유저',
			name : 'username',
			editor : 'text'
		}, {
			header : '이메일',
			name : 'email',
			editor : 'text'
		}, {
			header : '전화번호',
			name : 'phone',
			editor : 'text'
		}]
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