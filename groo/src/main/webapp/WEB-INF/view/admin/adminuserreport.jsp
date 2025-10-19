<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">
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
</style>
</head>
<body>
	<div class="content-header">
		<div class="content-header-left">
			<h1>신고 사용자 관리</h1>
			<p>신고된 사용자 목록을 조회하고 관리합니다</p>
		</div>
		<div class="content-header-right">
			<button class="btn btn-secondary" onclick="exportData()">
				<span></span> 제지하기
			</button>
			<button class="btn btn-primary" onclick="addUser()">
				<span></span> 제지취소
			</button>
		</div>
	</div>

	<div class="card">
		<div class="filter-section">
			<div class="search-box">
				<span class="search-icon"></span> <input type="text"
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
	<div class="card-content">
		<div class="list-group">
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					 <span class="badge bg-primary rounded-pill">14</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					A second list item <span class="badge bg-primary rounded-pill">2</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					A third list item <span class="badge bg-primary rounded-pill">1</span>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>