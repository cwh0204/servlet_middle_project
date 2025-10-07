<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/adminChart.js"></script>
<style>
.content-header {
	margin-bottom: 24px;
}

.content-header h1 {
	font-size: 28px;
	color: #1f2937;
	font-weight: 700;
	margin-bottom: 8px;
}

.content-header p {
	color: #6b7280;
	font-size: 14px;
}

/* 그리드 */
.dashboard-grid {
	display: grid;
	grid-template-columns: repeat(12, 1fr);
	gap: 24px;
}

/* 박스 */
.card-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px;
	padding-bottom: 16px;
	border-bottom: 2px solid #f3f4f6;
	background-color: white;
}

.card-title {
	font-size: 18px;
	font-weight: 600;
	color: #1f2937;
	display: flex;
	align-items: center;
	gap: 8px;
}

.card-title-icon {
	color: #2d6a4f;
}

.card-badge {
	background: #d1fae5;
	color: #2d6a4f;
	padding: 4px 12px;
	border-radius: 12px;
	font-size: 12px;
	font-weight: 600;
}

/* 통계 카드 */
.card {
	background: white;
	border-radius: 12px;
	padding: 24px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	border: 1px solid #e5e7eb;
	transition: all 0.3s ease;
}

.card-full {
	grid-column: span 12;
}

.card-half {
	grid-column: span 6;
}

.card-third {
	grid-column: span 4;
}

.stats-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16px;
}

.stat-card {
	background: linear-gradient(135deg, #f0fdf4 0%, #d1fae5 100%);
	padding: 20px;
	border-radius: 10px;
	border: 1px solid #a7f3d0;
}

.stat-label {
	color: #059669;
	font-size: 13px;
	font-weight: 600;
	margin-bottom: 8px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.stat-value {
	font-size: 32px;
	font-weight: 700;
	color: #2d6a4f;
	display: flex;
	align-items: baseline;
	gap: 8px;
}

.stat-unit {
	font-size: 14px;
	color: #059669;
	font-weight: 500;
}

.stat-change {
	margin-top: 8px;
	font-size: 13px;
	color: #059669;
	font-weight: 500;
}
/*차트박스*/

.c_chart_box{
	height: 350px;
}
.b_chart_box{
	height: 450px;
}
</style>
</head>
<body>
	<div class="content-header">
		<h1>대시보드</h1>
		<p>실시간 사이트 운영 현황을 확인하세요</p>
	</div>
	<div class="dashboard-grid">
		<div class="card card-full">
			<div class="card-header">
				<div class="card-title">
					<span class="card-title-icon">📈</span> 오늘의 주요 지표
				</div>
				<div class="card-badge">실시간</div>
			</div>
			<div class="stats-grid">
				<div class="stat-card">
					<div class="stat-label">방문자수</div>
					<div class="stat-value">
						4 <span class="stat-unit">명</span>
					</div>
					<div class="stat-change">↑ 전일 대비 +12%</div>
				</div>
				<div class="stat-card">
					<div class="stat-label">신규 가입자</div>
					<div class="stat-value">
						- <span class="stat-unit">명</span>
					</div>
					<div class="stat-change">데이터 없음</div>
				</div>
				<div class="stat-card">
					<div class="stat-label">탈퇴자수</div>
					<div class="stat-value">
						2 <span class="stat-unit">명</span>
					</div>
					<div class="stat-change">↓ 전일 대비 -5%</div>
				</div>
			</div>
		</div>

		<div class="card card-half">
			<div class="c_chart_box">
				<canvas id="AlineChart"></canvas>
			</div>
		</div>
		<div class="card card-half">
			<div class="c_chart_box">
				<canvas id="donutChart"></canvas>
			</div>
		</div>

		<div class="card card-full">
			<div class="b_chart_box">
				<canvas id="lineChart"></canvas>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>