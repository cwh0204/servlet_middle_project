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
				<button class="btn btn-secondary" onclick="searchBoard()">
					검색</button>
			</div>
		</div>
	</div>
	<div>
		<div id="gridBoard"></div>
	</div>
</body>
<script type="text/javascript">

searchBoard = () => {
	const search = $('#searchInput').val();
	$.ajax({
	// 데이터를 전송할 서버 URL
		url: 'adminselectboard.do',
	// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
	// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			findName : search
		},
	// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
	// response는 서버에서 돌려준 데이터입니다.
			gridBoard.resetData(response);
		},
	
	// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
		});
	}

$(document).ready(function() {
	gridBoard = new tui.Grid({
		el : document.getElementById('gridBoard'),
		data : {
			api : {
				readData : {
					url : 'adminselectboard.do',
					method : 'POST',
				}
			},
		},
		rowKey: 'id',
		scrollX : true,
		scrollY : true,
		columnOptions: {
	        sortable: true 
	    },
		columns : [ {
			header : '게시글ID',
			name : 'boardId'
		}, {
			header : '게시글Type',
			name : 'boardTypeId'
		}, {
			header : '작성자',
			name : 'memNick'
		}, {
			header : '글 제목',
			name : 'postTitle'
		}, {
			header : '작성일',
			name : 'postingDate',
			sortable: true
		},{
			header : '좋아요',
			name : 'boardLikeCount',
			sortable: true
		},{
			header : '삭제여부',
			name : 'postingDelCheck',
			filter: {
	            type: 'select', 
	            options: {
	                // listItems: 사용자에게 보여줄 항목과 실제 필터링에 사용할 값(value) 정의
	                listItems: [
	                    { text: '활성화됨', value: '' }, // 값이 비어있을 때 ('')
	                    { text: '비활성화됨', value: 'Y' }  // 값이 'Y'일 때
	                ]
	            }
	        }
		},{
			header: '기타',
			name: 'grade',
			width: 150,
			renderer: {
				type: CustomBoardBtnRenderer,
			}
		}
		]
	});
	gridBoard.setBodyHeight(450);
    searchBoard();
});
</script>
</html>