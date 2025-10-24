<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="css/base.css" rel="stylesheet">
<link href="css/adminCss/adminUser/adminUser.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="js/adminUser.js"></script>
<script src="js/adminAjax/adminUserAjax.js"></script>
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
		<div id="grid"></div>
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
$(document).ready(function() {
	const grid = initializeUserGrid();
	userStats();
	resetGridData();
});
</script>
</html>