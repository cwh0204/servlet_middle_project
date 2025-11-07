<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="css/adminCss/adminUser/adminUser.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>
	<body>
	<div class="content-header">
		<div class="content-header-left">
			<h1>팀 관리</h1>
			<p>전체 팀 목록을 조회하고 관리합니다</p>
		</div>
		<div class="content-header-right">
			<button class="btn btn-secondary" onclick="exportData()">
				<span>📥</span> 내보내기
			</button>
		</div>
	</div>
	<div class="stats-row">
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">전체 팀</span>
				<div class="stat-icon green"></div>
			</div>
			<div class="stat-value total-teams">0</div>
			<div class="stat-change up">↑ 전월 대비 +12%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">활성 팀</span>
				<div class="stat-icon blue"></div>
			</div>
			<div class="stat-value active-teams">0</div>
			<div class="stat-change up">↑ 전월 대비 +8%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">신규 팀</span>
				<div class="stat-icon yellow"></div>
			</div>
			<div class="stat-value inactive-teams">0</div>
			<div class="stat-change up">↑ 이번 주</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">비활성</span>
				<div class="stat-icon red"></div>
			</div>
			<div class="stat-value weekly-teams">0</div>
			<div class="stat-change down">↓ 전월 대비 -5%</div>
		</div>
	</div>
	<div class="card">
		<div class="filter-section">
			<div class="search-box">
				<span class="search-icon"></span> <input type="text"
					id="searchInput" placeholder="이름, 이메일로 검색...">
			</div>
			<div class="filter-group">
				<button class="btn btn-secondary" onclick="searchTeam()">
					검색</button>
			</div>
		</div>
	</div>
	<div>
		<div id="gridTeamMember"></div>
	</div>
</body>
<script type="text/javascript">

var teamStats = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teamstats.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			$('.total-teams').text(response.totalTeams);
			$('.inactive-teams').text(response.inactiveTeams);
			$('.weekly-teams').text(response.weeklyTeams);
			$('.active-teams').text(response.activeTeams);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {

		}
	}); // $.ajax 끝
}

searchTeam = () => {
	const search = $('#searchInput').val();
	$.ajax({
	// 데이터를 전송할 서버 URL
		url: 'adminselectstudymember.do',
	// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
	// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			search : search
		},
	// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
	// response는 서버에서 돌려준 데이터입니다.
			gridTeamMember.resetData(response);
		},
	
	// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
		});
	}
$(document).ready(function() {
	teamStats();
	gridTeamMember = new tui.Grid({
		el : document.getElementById('gridTeamMember'),
		data : {
			api : {
				readData : {
					url : 'adminselectstudymember.do',
					method : 'POST',
				}
			},
		},
		rowKey: 'id',
		scrollX : true,
		scrollY : true,
		columns : [ {
			header : '회원명',
			name : 'memName'
		}, {
			header : '스터디명',
			name : 'studyTitle'
		}, {
			header : '역활',
			name : 'studyRoll'
		}, {
			header : '스터디참여일',
			name : 'studyJoinedDate'
		},{
			header: '팀 탈퇴',
			name: 'grade',
			width: 150,
			renderer: {
				type: CustomTeamMemberBtnRenderer,
			}
		}
		]
	});
	gridTeamMember.setBodyHeight(450);
	searchTeam();
});
</script>
</html>