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
	
	class CustomUserBtnRenderer {
	    constructor(props) {
	      const container = document.createElement('div');
	      container.className = 'btn-renderer-container';
	      
	      const deleteBtn = document.createElement('button');
	     
	      
	      deleteBtn.className = 'user-randarer-button';
	      deleteBtn.textContent = '내용 확인';
	      deleteBtn.dataset.type = 'delete';
	      
	      deleteBtn.addEventListener('click', (event) => {
	          this.onClick(props, event);
	      });
	      
	      container.appendChild(deleteBtn);
	      
	      this.container = container;
	      
	      this.render(props);
	    }

	    getElement() {
	      return this.container;
	    }

	    render(props) {
	       this.container.value = String(props.value);
	    }
	    
	    onClick(props, event) {
	    	
	        const { grid, rowKey } = props;
	        const targetBtn = event.target.closest('button'); //클릭된 버튼 식별

	        if (!targetBtn) return;
	        
	        const actionType = targetBtn.dataset.type;
	        
	        if (actionType === 'delete') {
	            console.log("안녕");
	        }
	        event.stopPropagation();
	    }
	}
	
	var avgReport = () => {
		$.ajax({
			// 데이터를 전송할 서버 URL
			url: 'adminavgreport.do',
			// 전송 방식 (로그인/회원가입은 보통 POST 사용)
			type: 'POST',
			// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
			data: {
			},
			// 데이터 전송 성공 시 실행
			success: function(response) {
				// response는 서버에서 돌려준 데이터입니다.
				console.log(response);
				$('.total-member').text(response.totalReport);
				$('.inactive-member').text(response.resolverReport);
				$('.weekly-signups').text(response.newReport);
				$('.active-member').text(response.pendingReport);
			},

			// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
			error: function(xhr, status, error) {
			}
		});
	}
	avgReport();
	var resetReportGridData = () => {
		
		$.ajax({
			// 데이터를 전송할 서버 URL
			url: 'adminreportserch.do',
			// 전송 방식 (로그인/회원가입은 보통 POST 사용)
			type: 'POST',
			// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
			data: {
			},
			// 데이터 전송 성공 시 실행
			success: function(response) {
				// response는 서버에서 돌려준 데이터입니다.
				reportUsergrid.resetData(response);
			},

			// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
			error: function(xhr, status, error) {
			}
		});
	}
	
	var serchReportGridData = (serchName) => {
		
		$.ajax({
			// 데이터를 전송할 서버 URL
			url: 'adminreportserch.do',
			// 전송 방식 (로그인/회원가입은 보통 POST 사용)
			type: 'POST',
			// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
			data: {
				serchName : serchName
			},
			// 데이터 전송 성공 시 실행
			success: function(response) {
				// response는 서버에서 돌려준 데이터입니다.
				reportUsergrid.resetData(response);
			},

			// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
			error: function(xhr, status, error) {
			}
		});
	}
	
	resetReportGridData();
	
	searchReport = () => {
		
		const serchName = $('#searchInput').val();
		
		$.ajax({
			// 데이터를 전송할 서버 URL
			url: 'adminreportserch.do',
			// 전송 방식 (로그인/회원가입은 보통 POST 사용)
			type: 'POST',
			// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
			data: {
				serchName : serchName
			},
			// 데이터 전송 성공 시 실행
			success: function(response) {
				// response는 서버에서 돌려준 데이터입니다.
				reportUsergrid.resetData(response);
			},

			// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
			error: function(xhr, status, error) {
			}
		});
	}
	
	reportUsergrid = new tui.Grid({
	    el: document.getElementById('reportUsergrid'),
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
	        width: 100
	    }, {
	        header: '신고자',
	        name: 'memReporter',
	        width: 100
	    }, {
	        header: '신고아이디',
	        name: 'memSuspect',
	        width: 100
	    }, {
	        header: '글번호',
	        name: 'reportBoard',
	        width: 100
	    },{
	        header: '신고사유',
	        name: 'reportContent'
	    },{
        header: 'Grade',
        name: 'grade',
        width: 150,
        renderer: {
          type: CustomUserBtnRenderer,
        }
	    }    
	    ]
	});
});
</script>
</html>