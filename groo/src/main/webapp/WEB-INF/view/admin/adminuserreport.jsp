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
<script src="js/adminJs/adminReport.js"></script>
<script src="js/adminAjax/adminReportAjax.js"></script>

</head>
<body>
	<div class="content-header">
		<div class="content-header-left">
			<h1>신고 유저 관리</h1>
			<p>전체 사용자 목록을 조회하고 관리합니다</p>
		</div>
		<div class="content-header-right">
			<button class="btn btn-secondary" onclick="exportData()">
				<span></span> 내보내기
			</button>
		</div>
	</div>
	<div class="stats-row">
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">전체 신고</span>
				<div class="stat-icon green"></div>
			</div>
			<div class="stat-value total-member">0</div>
			<div class="stat-change up">↑ 전월 대비 +12%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">처리된 신고</span>
				<div class="stat-icon blue"></div>
			</div>
			<div class="stat-value inactive-member">0</div>
			<div class="stat-change up">↑ 전월 대비 +8%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">신규 신고</span>
				<div class="stat-icon yellow"></div>
			</div>
			<div class="stat-value weekly-signups">0</div>
			<div class="stat-change up">↑ 이번 주</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">미처리 신고</span>
				<div class="stat-icon red"></div>
			</div>
			<div class="stat-value active-member">0</div>
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
				<button class="btn btn-secondary" onclick="searchReport()">
					검색</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="card-content">
		<div id="reportUsergrid"></div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	
	initializeDisableUserGrid();
	
	avgReport();
	
	resetReportGridData();
	
});
</script>
</html>