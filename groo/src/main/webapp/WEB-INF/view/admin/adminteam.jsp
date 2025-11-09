<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/adminCss/adminUser/adminUser.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
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
			<div class="stat-value weekly-teams">0</div>
			<div class="stat-change up">↑ 이번 주</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">비활성</span>
				<div class="stat-icon red"></div>
			</div>
			<div class="stat-value inactive-teams">0</div>
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
		<div id="gridTeam"></div>
	</div>
</body>
<script>

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
			// response는 서버에서 돌려준 데이터입니다.
			// 예: 성공 메시지 표시 또는 페이지 이동
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
		url: 'teamselects.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			search : search
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			gridTeam.resetData(response);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}
$(document).ready(function() {
	teamStats();
    gridTeam = new tui.Grid({
		el : document.getElementById('gridTeam'),
		data : {
			api : {
				readData : {
					url : 'teamselects.do',
					method : 'POST',
				}
			},
		},
		rowKey: 'id',
		scrollX : true,
		scrollY : true,
		columns : [ {
			header : '스터디ID',
			name : 'studyId'
		}, {
			header : '스터디이름',
			name : 'studyTitle'
		}, {
			header : '카테고리',
			name : 'studyCategory'
		}, {
			header : '최대인원',
			name : 'studyMax'
		}, {
			header : '스터디타이틀',
			name : 'studyIntro'
		},{
			header : '스터디내용',
			name : 'studyIntroContent'
		},{
			header : '스터디 생성일',
			name : 'studyCreateDate'
		},{
			header: '비활성화',
			name: 'grade',
			width: 150,
			renderer: {
				type: CustomTeamBtnRenderer,
			}
		}
		]
	});
    CustomTeamBtnRenderer
    gridTeam.on('response', function(ev) {
        let response = ev.xhr.responseText;
        let data = JSON.parse(response);
        
        originalFullData = data;
        
        gridTeam.resetData(data);
    });
    
    gridTeam.on('afterChange', ev => {
    	console.log('after change:', ev.changes[0].columnName);
        console.log('after change:', ev.changes[0].value);
        console.log(gridTeam.getModifiedRows());
    });
    
    gridTeam.setBodyHeight(450);
    
    gridTeam.on('beforeChange', ev => {
  	  // `ev.changes`는 배열 형태로 여러 변경 사항을 포함할 수 있습니다.
  	  // 여기서는 첫 번째 변경 사항에 접근합니다.
  	  const { rowKey } = ev.changes[0];
  	  const columnName = ev.changes[0].columnName;
  	  // 수정이 발생한 행에 'modified-row' 클래스 추가
  	  gridTeam.addRowClassName(rowKey, 'modified-row');
  	  gridTeam.addCellClassName(rowKey, columnName, 'modified-cell'); 
  });
});

</script>
</html>