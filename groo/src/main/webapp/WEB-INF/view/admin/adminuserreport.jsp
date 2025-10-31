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

<style>
.report-modal-content{
    display: flex
;
    justify-content: space-between;
}

</style>

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
		<button type="button" id="reportCheckBtn" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop" style="display: none;">Launch static backdrop
			modal</button>
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
	<div class="card-content">
		<div id="reportUsergrid"></div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">신고내용</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div class="report-modal-content"><span>신고자</span><span>신고일</span></div>
						<div><span>신고사유</span></div>
						<div><span>벤</span><span>신고유저</span></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">게시글 확인</button>
				</div>
			</div>
		</div>
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