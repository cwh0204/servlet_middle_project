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
.modal-content {
	border-radius: 12px;
	border: none;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
}

.modal-header {
	background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	border-radius: 12px;
	padding: 1.5rem;
}

.modal-header .modal-title {
	display: flex;
	align-items: center;
	gap: 1rem;
	font-weight: bold;
	font-size: 1.5rem;
}

.modal-icon {
	width: 48px;
	height: 48px;
	background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 1.5rem;
	box-shadow: 0 4px 6px rgba(239, 68, 68, 0.3);
}

.info-card {
	border-radius: 12px;
	padding: 1rem;
	margin-bottom: 1rem;
	position: relative;
	overflow: hidden;
}

.info-card.blue {
	background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
	color: white;
}

.info-card.purple {
	background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%);
	color: white;
}

.info-card::after {
	content: '';
	position: absolute;
	bottom: -1rem;
	right: -1rem;
	width: 6rem;
	height: 6rem;
	background: rgba(255, 255, 255, 0.1);
	border-radius: 50%;
}

.info-label {
	font-size: 0.75rem;
	opacity: 0.9;
	text-transform: uppercase;
	letter-spacing: 0.05em;
	font-weight: 600;
}

.info-value {
	font-size: 1.25rem;
	font-weight: bold;
	margin-top: 0.25rem;
}

.section-title {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	font-weight: bold;
	margin-bottom: 1rem;
}

.section-title::before {
	content: '';
	width: 4px;
	height: 1.5rem;
	background: linear-gradient(to bottom, #ef4444, #dc2626);
	border-radius: 2px;
}

.report-content {
	background: linear-gradient(135deg, #f9fafb 0%, #f3f4f6 100%);
	border-radius: 12px;
	padding: 1.5rem;
	max-height: 12rem;
	overflow-y: auto;
	border: 1px solid #e5e7eb;
}

.target-section {
	background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
	border-radius: 12px;
	padding: 1.5rem;
	border: 2px solid #fecaca;
}

.target-badge {
	background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
	color: white;
	padding: 0.5rem 1rem;
	border-radius: 12px;
	font-size: 0.75rem;
	font-weight: bold;
	text-transform: uppercase;
	display: inline-block;
	box-shadow: 0 2px 4px rgba(239, 68, 68, 0.3);
}

.ban-period-btn {
	padding: 0.75rem;
	border-radius: 12px;
	font-weight: bold;
	font-size: 0.875rem;
	border: 2px solid #e5e7eb;
	background: white;
	color: #374151;
	transition: all 0.2s;
	cursor: pointer;
}

.ban-period-btn:hover {
	background: #f3f4f6;
	transform: scale(1.05);
}

.ban-period-btn.active {
	background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
	color: white;
	border-color: #ef4444;
	box-shadow: 0 4px 6px rgba(239, 68, 68, 0.3);
}

.action-section {
	background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%);
	border-radius: 12px;
	padding: 1.5rem;
	border: 2px solid #fde68a;
}

.action-textarea {
	border: 2px solid #fde68a;
	border-radius: 12px;
	padding: 0.75rem;
	width: 100%;
	resize: none;
	transition: all 0.2s;
}

.action-textarea:focus {
	outline: none;
	border-color: #fbbf24;
	box-shadow: 0 0 0 3px rgba(251, 191, 36, 0.1);
}

.confirm-section {
	background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
	border-radius: 12px;
	padding: 1.25rem;
	border: 2px solid #93c5fd;
}

.confirm-checkbox {
	width: 1.5rem;
	height: 1.5rem;
	cursor: pointer;
}

.modal-footer {
	background: linear-gradient(135deg, #f9fafb 0%, #f3f4f6 100%);
	border-top: 1px solid rgba(0, 0, 0, 0.05);
	border-radius: 0 0 12px 12px;
	padding: 1.5rem;
}

.btn-modal-cancel {
	background: white;
	border: 2px solid #d1d5db;
	color: #374151;
	padding: 0.75rem 2rem;
	border-radius: 12px;
	font-weight: bold;
	transition: all 0.2s;
}

.btn-modal-cancel:hover {
	background: #f3f4f6;
	border-color: #9ca3af;
}

.btn-modal-confirm {
	background: linear-gradient(135deg, #10b981 0%, #059669 100%);
	border: none;
	color: white;
	padding: 0.75rem 2rem;
	border-radius: 12px;
	font-weight: bold;
	transition: all 0.3s;
	box-shadow: 0 4px 6px rgba(16, 185, 129, 0.3);
}

.btn-modal-confirm:hover:not(:disabled) {
	background: linear-gradient(135deg, #059669 0%, #047857 100%);
	transform: scale(1.05);
	box-shadow: 0 6px 12px rgba(16, 185, 129, 0.4);
}

.btn-modal-confirm:disabled {
	background: #d1d5db;
	color: #9ca3af;
	cursor: not-allowed;
	box-shadow: none;
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
		<button type="button" id="reportCheckBtn" class="btn btn-primary"
			data-bs-toggle="modal" data-bs-target="#staticBackdrop"
			style="display: none;">Launch static backdrop modal</button>
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
		aria-labelledby="staticBackdropLabel" aria-hidden="false">
		<div
			class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reportModalLabel">
						<div class="modal-icon">!</div>
						<div>
							<div>신고 내용 검토</div>
							<small class="text-muted"
								style="font-size: 0.875rem; font-weight: normal;">Report
								Review & Action</small>
						</div>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<div class="row g-3 mb-4">
						<div class="col-md-6">
							<div class="info-card blue">
								<div class="info-label">Reporter</div>
								<div id="memReporter" class="info-value">테스트</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="info-card purple">
								<div class="info-label">Report Date</div>
								<div id="reportDate" class="info-value">테스트</div>
							</div>
						</div>
					</div>

					<div class="mb-4">
						<div class="section-title">신고 사유</div>
						<div id="reportContent" class="report-content">
						</div>
					</div>

					<div class="target-section mb-4">
						<div
							class="d-flex align-items-center gap-3 mb-3 pb-3 border-bottom">
							<span class="target-badge">Target User</span>
							<div>
								<small class="text-muted">신고 대상:</small> <strong
									id="memSuspect" class="ms-2 fs-5">테스트</strong>
							</div>
						</div>

						<div>
							<div class="section-title" style="font-size: 0.875rem;">제재
								기간 설정</div>
							<div class="row g-2">
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100"
										onclick="selectBanPeriod(this, '1')">1일</button>
								</div>
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100"
										onclick="selectBanPeriod(this, '3')">3일</button>
								</div>
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100 active"
										onclick="selectBanPeriod(this, '7')">7일</button>
								</div>
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100"
										onclick="selectBanPeriod(this, '30')">30일</button>
								</div>
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100"
										onclick="selectBanPeriod(this, '90')">90일</button>
								</div>
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100"
										onclick="selectBanPeriod(this, '180')">180일</button>
								</div>
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100"
										onclick="selectBanPeriod(this, '360')">360일</button>
								</div>
								<div class="col-3">
									<button type="button" class="ban-period-btn w-100"
										onclick="selectBanPeriod(this, 'permanent')">영구</button>
								</div>
							</div>
						</div>
					</div>

					<div class="action-section mb-4">
						<div class="section-title" style="font-size: 0.875rem;">
							조치 내용 <small class="text-muted fw-normal">(선택사항)</small>
						</div>
						<textarea id="actionNote" class="action-textarea" rows="4"
							maxlength="500" placeholder="조치 내용, 특이사항 또는 관리자 메모를 입력하세요..."></textarea>
						<div class="d-flex justify-content-between mt-2">
							<small class="text-muted">관리 기록으로 저장됩니다</small> <small
								class="fw-bold text-secondary"><span id="charCount">0</span>
								/ 500</small>
						</div>
					</div>

					<div class="confirm-section">
						<label class="d-flex align-items-start gap-3 cursor-pointer">
							<input type="checkbox" id="confirmCheck" class="confirm-checkbox">
							<div>
								<div class="fw-bold mb-1">신고 처리 확인</div>
								<small class="text-muted">위 내용을 확인했으며, 해당 조치가 적절함을
									확인합니다.</small>
							</div>
						</label>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-modal-cancel"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-modal-confirm" id="confirmBtn"
						disabled onclick="submitReport()" value="">처리 완료</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var selectedBanPeriod = '1';

	function selectBanPeriod(btn, period) {
		$('.ban-period-btn').removeClass('active');
		$(btn).addClass('active');
		selectedBanPeriod = period;
	}
	$(document).ready(function() {

		initializeDisableUserGrid();

		avgReport();

		resetReportGridData();

		$('#actionNote').on('input', function() {
			$('#charCount').text($(this).val().length);
		});

		// 체크박스 상태에 따라 버튼 활성화/비활성화
		$('#confirmCheck').on('change', function() {
			$('#confirmBtn').prop('disabled', !$(this).is(':checked'));
		});

		// 모달이 닫힐 때 초기화
		$('#reportModal').on('hidden.bs.modal', function() {
			$('#actionNote').val('');
			$('#charCount').text('0');
			$('#confirmCheck').prop('checked', false);
			$('#confirmBtn').prop('disabled', true);
			selectedBanPeriod = '7';
			$('.ban-period-btn').removeClass('active');
			$('.ban-period-btn').eq(2).addClass('active');
		});
	});
</script>
</html>