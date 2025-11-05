<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팀 일정 게시판</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

<style>
.header-card {
	background: white;
	border-radius: 1rem;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 2rem;
	margin-bottom: 1.5rem;
}

.schedule-card {
	background: white;
	border-radius: 1rem;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 1.5rem;
	margin-bottom: 1rem;
	transition: box-shadow 0.3s;
}

.schedule-card:hover {
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
}

.stats-card {
	background: white;
	border-radius: 1rem;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 1.5rem;
	margin-top: 1.5rem;
}

.badge-vote {
	background-color: #d4edda;
	color: #155724;
	font-weight: bold;
	padding: 0.35rem 0.75rem;
	border-radius: 50rem;
	font-size: 0.75rem;
}

.badge-votes-count {
	background-color: #e7e3fc;
	color: #4c1d95;
	font-weight: bold;
	padding: 0.35rem 0.75rem;
	border-radius: 50rem;
	font-size: 0.75rem;
}

.badge-date {
	background-color: #cfe2ff;
	color: #084298;
	font-weight: bold;
	padding: 0.35rem 0.75rem;
	border-radius: 50rem;
	font-size: 0.75rem;
}

.stat-number {
	font-size: 2rem;
	font-weight: bold;
}

.loading-spinner {
	animation: spin 1s linear infinite;
}

@
keyframes spin {from { transform:rotate(0deg);
	
}

to {
	transform: rotate(360deg);
}

}
.empty-state {
	text-align: center;
	padding: 4rem 2rem;
}

.empty-state i {
	font-size: 4rem;
	color: #dee2e6;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 헤더 -->
		<div class="header-card">
			<div class="d-flex justify-content-between align-items-center">
				<div>
					<h1 class="mb-2">
						<i class="bi bi-calendar-event text-primary"></i> 팀 일정 게시판
					</h1>
					<p class="text-muted mb-0">투표로 결정된 팀 일정</p>
				</div>
				<button id="refreshBtn" class="btn btn-primary">
					<i class="bi bi-arrow-clockwise" id="refreshIcon"></i> 새로고침
				</button>
			</div>
		</div>

		<!-- 로딩 상태 -->
		<div id="loadingState" class="schedule-card text-center"
			style="display: none;">
			<i class="bi bi-arrow-clockwise loading-spinner"
				style="font-size: 3rem; color: #0d6efd;"></i>
			<p class="text-muted mt-3 mb-0">일정을 불러오는 중...</p>
		</div>

		<!-- 에러 상태 -->
		<div id="errorState" class="alert alert-danger" style="display: none;">
			<div class="text-center">
				<p class="fw-bold mb-3" id="errorMessage"></p>
				<button id="retryBtn" class="btn btn-danger">다시 시도</button>
			</div>
		</div>

		<!-- 빈 상태 -->
		<div id="emptyState" class="schedule-card empty-state"
			style="display: none;">
			<i class="bi bi-calendar-x"></i>
			<h3 class="text-muted mt-3">등록된 일정이 없습니다</h3>
			<p class="text-muted">투표가 종료되면 일정이 등록됩니다</p>
		</div>

		<!-- 일정 목록 -->
		<div id="scheduleList"></div>

		<!-- 통계 -->
		<div id="statsCard" class="stats-card" style="display: none;">
			<div class="row text-center">
				<div class="col-4">
					<p class="text-muted small fw-semibold mb-1">전체 일정</p>
					<p class="stat-number text-primary mb-0" id="totalCount">0</p>
				</div>
				<div class="col-4">
					<p class="text-muted small fw-semibold mb-1">투표 당선 일정</p>
					<p class="stat-number text-success mb-0" id="voteCount">0</p>
				</div>
				<div class="col-4">
					<p class="text-muted small fw-semibold mb-1">총 득표수</p>
					<p class="stat-number text-info mb-0" id="totalVotes">0</p>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		$(document)
				.ready(
						function() {
							// 날짜 포맷 함수
							function formatDate(dateString) {
								const date = new Date(dateString);
								const year = date.getFullYear();
								const month = date.getMonth() + 1;
								const day = date.getDate();
								return year + '년 ' + month + '월 ' + day + '일';
							}

							// 날짜 시간 포맷 함수
							function formatDateTime(dateString) {
								const date = new Date(dateString);
								const year = date.getFullYear();
								const month = String(date.getMonth() + 1)
										.padStart(2, '0');
								const day = String(date.getDate()).padStart(2,
										'0');
								const hours = String(date.getHours()).padStart(
										2, '0');
								const minutes = String(date.getMinutes())
										.padStart(2, '0');
								const seconds = String(date.getSeconds())
										.padStart(2, '0');
								return year + '. ' + month + '. ' + day + '. '
										+ hours + ':' + minutes + ':' + seconds;
							}

							// 일정 카드 생성 함수
							function createScheduleCard(schedule) {
								var badges = '';

								if (schedule.fromVote) {
									badges += '<span class="badge-vote me-2">투표 당선</span>';
								}

								if (schedule.votes > 0) {
									badges += '<span class="badge-votes-count me-2">'
											+ schedule.votes + '표 획득</span>';
								}

								badges += '<span class="badge-date">'
										+ formatDate(schedule.date) + '</span>';

								var descriptionHtml = schedule.description ? '<p class="text-muted mb-2">'
										+ schedule.description + '</p>'
										: '';

								var createdAtHtml = schedule.createdAt ? '<p class="small text-muted mb-0">등록일: '
										+ formatDateTime(schedule.createdAt)
										+ '</p>'
										: '';

								return '<div class="schedule-card">'
										+ '<div class="mb-3">' + badges
										+ '</div>' + '<h3 class="mb-2">'
										+ schedule.title + '</h3>'
										+ descriptionHtml + createdAtHtml
										+ '</div>';
							}

							// 데이터 로드 함수
							function loadSchedules() {
								// UI 상태 초기화
								$('#loadingState').show();
								$('#errorState').hide();
								$('#emptyState').hide();
								$('#scheduleList').empty();
								$('#statsCard').hide();
								$('#refreshIcon').addClass('loading-spinner');

								// 실제로는 서버에서 데이터를 가져옴
								// $.ajax({
								//     url: '/api/schedules',
								//     method: 'GET',
								//     success: function(data) { ... },
								//     error: function(xhr, status, error) { ... }
								// });

								// 임시 데이터 (시뮬레이션)
								setTimeout(
										function() {
											try {
												var schedules = [
														{
															id : 1,
															title : "팀 워크숍",
															description : "2분기 팀 빌딩 워크숍 - 강원도 평창에서 1박 2일",
															date : "2025-11-15",
															votes : 23,
															fromVote : true,
															createdAt : "2025-11-05T09:30:00"
														},
														{
															id : 2,
															title : "신규 프로젝트 킥오프 미팅",
															description : "AI 챗봇 개발 프로젝트 시작 - 전체 팀원 참석 필수",
															date : "2025-11-20",
															votes : 18,
															fromVote : true,
															createdAt : "2025-11-04T14:20:00"
														},
														{
															id : 3,
															title : "11월 월례 회의",
															description : "월간 성과 공유 및 다음 달 계획 수립",
															date : "2025-11-25",
															votes : 15,
															fromVote : true,
															createdAt : "2025-11-03T11:00:00"
														},
														{
															id : 4,
															title : "연말 회식",
															description : "2025년 마무리 회식 - 장소는 추후 공지",
															date : "2025-12-20",
															votes : 31,
															fromVote : true,
															createdAt : "2025-11-02T16:45:00"
														},
														{
															id : 5,
															title : "코드 리뷰 세션",
															description : "주간 코드 리뷰 및 베스트 프랙티스 공유",
															date : "2025-11-12",
															votes : 12,
															fromVote : true,
															createdAt : "2025-11-01T10:15:00"
														} ];

												$('#loadingState').hide();
												$('#refreshIcon').removeClass(
														'loading-spinner');

												if (schedules.length === 0) {
													$('#emptyState').show();
												} else {
													// 일정 목록 렌더링
													$
															.each(
																	schedules,
																	function(
																			index,
																			schedule) {
																		$(
																				'#scheduleList')
																				.append(
																						createScheduleCard(schedule));
																	});

													// 통계 업데이트
													var voteCount = schedules
															.filter(function(s) {
																return s.fromVote;
															}).length;

													var totalVotes = schedules
															.reduce(
																	function(
																			sum,
																			s) {
																		return sum
																				+ (s.votes || 0);
																	}, 0);

													$('#totalCount').text(
															schedules.length);
													$('#voteCount').text(
															voteCount);
													$('#totalVotes').text(
															totalVotes);
													$('#statsCard').show();
												}
											} catch (error) {
												$('#loadingState').hide();
												$('#refreshIcon').removeClass(
														'loading-spinner');
												$('#errorMessage')
														.text(
																'데이터를 불러오는데 실패했습니다: '
																		+ error.message);
												$('#errorState').show();
											}
										}, 800);
							}

							// 새로고침 버튼 클릭
							$('#refreshBtn').click(function() {
								loadSchedules();
							});

							// 재시도 버튼 클릭
							$('#retryBtn').click(function() {
								loadSchedules();
							});

							// 페이지 로드 시 데이터 불러오기
							loadSchedules();
						});
	</script>
</body>
</html>