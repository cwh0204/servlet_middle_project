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
			<button class="btn btn-primary" onclick="userCheckInsert()">
				<span>*</span> 저장
			</button>
			<button type="button" class="btn btn-primary none"
				data-bs-toggle="modal" data-bs-target="#exampleModal">Launch
				demo modal</button>
		</div>
	</div>
	<div class="stats-row">
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">전체 사용자</span>
				<div class="stat-icon green"></div>
			</div>
			<div class="stat-value total-member">1,284</div>
			<div class="stat-change up">↑ 전월 대비 +12%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">활성 사용자</span>
				<div class="stat-icon blue"></div>
			</div>
			<div class="stat-value inactive-member">1,156</div>
			<div class="stat-change up">↑ 전월 대비 +8%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">신규 가입</span>
				<div class="stat-icon yellow"></div>
			</div>
			<div class="stat-value weekly-signups">48</div>
			<div class="stat-change up">↑ 이번 주</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">비활성</span>
				<div class="stat-icon red"></div>
			</div>
			<div class="stat-value active-member">128</div>
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
				<button class="btn btn-secondary" onclick="searchUser()">
					검색</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="card-content">
		<div id="reportUsergrid"></div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">중복된 데이터를
						사용하는 유저가 있습니다</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body check-date">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
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
	
	var resetReportGridData = () => {
		$.ajax({
			// 데이터를 전송할 서버 URL
			url: '',
			// 전송 방식 (로그인/회원가입은 보통 POST 사용)
			type: 'POST',
			// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
			data: {
				memStatus: 'Y'
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
	    columns: [{
	        header: '아이디',
	        name: 'memLoginId',
	        editor: 'text'
	    }, {
	        header: '이름',
	        name: 'memName',
	        editor: 'text'
	    }, {
	        header: '비밀번호',
	        name: 'memPass',
	        editor: 'text'
	    }, {
	        header: '닉네임',
	        name: 'memNick',
	        editor: 'text'
	    }, {
	        header: '이메일',
	        name: 'memEmail',
	        editor: 'text'
	    }, {
	        header: '전화번호',
	        name: 'memPhone',
	        editor: 'text'
	    }, {
	        header: '주소',
	        name: 'memAddr',
	        editor: 'text'
	    }, {
	        header: '탈퇴여부',
	        name: 'memStatus',
	        editor: 'text'
	    },{
        header: 'Grade',
        name: 'grade',
        renderer: {
          type: CustomUserBtnRenderer,
        }
	    }    
	    ]
	});
});
</script>
</html>