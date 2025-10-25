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
	<div class="card-content">
		<div id="reportProcessUserGrid"></div>
	</div>
</body>
<script type="text/javascript">

searchProcessReport = () => {
	const serchName = $('#searchInput').val();
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminreportprocessuserserch.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			serchName : serchName
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			reportProcessUserGrid.resetData(response);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}
searchProcessReport();
reportProcessUserGrid = new tui.Grid({
    el: document.getElementById('reportProcessUserGrid'),
    data: [], // 초기 데이터는 빈 배열로 설정
    rowKey: 'id',
    scrollX: true,
    scrollY: true,
    columnOptions: {
        resizable: true // 이 값이 false이면 리사이징 기능이 비활성화됩니다.
    },
    columns: [{
        header: '신고번호',
        name: 'reportId',
        width: 50
    }, {
        header: '신고자',
        name: 'memReporter',
        width: 80
    }, {
        header: '신고아이디',
        name: 'memSuspect',
        width: 80
    }, {
        header: '글번호',
        name: 'reportBoard',
        width: 50
    },{
        header: '신고사유',
        name: 'reportContent'
    },{
        header: '신고일',
        name: 'reportDate',
        width: 100
    },{
        header: '조치내용',
        name: 'actionContent'
    },{
        header: '벤시작일',
        name: 'actionDate',
        width: 100
    },{
        header: '벤종료일',
        name: 'endActionDate',
        width: 100
    },{
    header: 'Grade',
    name: 'grade',
    width: 150,
    }    
    ]
});
</script>
</html>