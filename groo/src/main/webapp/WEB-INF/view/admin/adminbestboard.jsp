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
<style type="text/css">
.badge-stat-gold, .badge-stat-silver, .badge-stat-bronze {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0.4rem;
	flex-direction: row; /* 숫자 → 아이콘 순서 */
	text-align: center;
}

.badge-stat-icon::before {
	content: "";
	display: inline-block;
	width: 30px;
	height: 30px;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	vertical-align: middle;
}

.badge-stat-gold .badge-stat-icon::before {
	background-image:
		url('https://i.postimg.cc/FHmN8Bg7/icons8-first-place-ribbon-50.png');
}

.badge-stat-silver .badge-stat-icon::before {
	background-image:
		url('https://i.postimg.cc/BnVNXXZj/icons8-second-place-ribbon-50.png');
}

.badge-stat-bronze .badge-stat-icon::before {
	background-image:
		url('https://i.postimg.cc/HnYbSgWN/icons8-third-place-ribbon-50.png');
}

.badge-state-container {
	display: flex;
	justify-content: center;
	gap: 45px;
	margin-bottom: 30px;
}
</style>
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
				<span class="stat-label">전체 글</span>
				<div class="stat-icon green"></div>
			</div>
			<div class="stat-value total-teams">0</div>
			<div class="stat-change up">↑ 전월 대비 +12%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">활성 글</span>
				<div class="stat-icon blue"></div>
			</div>
			<div class="stat-value active-teams">0</div>
			<div class="stat-change up">↑ 전월 대비 +8%</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">신규 글</span>
				<div class="stat-icon yellow"></div>
			</div>
			<div class="stat-value weekly-teams">0</div>
			<div class="stat-change up">↑ 이번 주</div>
		</div>
		<div class="stat-card">
			<div class="stat-card-header">
				<span class="stat-label">삭제 글</span>
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
				<button class="btn btn-secondary" onclick="searchBoard()">
					검색</button>
			</div>
		</div>
	</div>
	<div>
		<div id="gridRank"></div>
	</div>
	<div class="container mt-5 text-center">
		<button type="button" class="btn btn-info btn-lg"
			data-bs-toggle="modal" data-bs-target="#medalSelectModal">
			메달</button>
	</div>

	<%-- 3. 메달 선택 모달 구조 --%>
	<div class="modal fade" id="medalSelectModal" tabindex="-1"
		aria-labelledby="medalSelectModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="medalSelectModalLabel">🏅 메달 선택 및
						할당</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body text-center">
					<p class="fs-5 mb-4">할당할 메달 종류를 선택하세요.</p>
					<div class="mb-4 text-start p-3 bg-light rounded">
						<p>
							<span>글 제목 : </span> <span id="modal_title"></span>
						</p>
						<p>
							<span>글번호 : </span> <span id="modal_postId"></span>
						</p>
						<p>
							<span>작성자 : </span> <span id="modal_writer"></span>
						</p>
					</div>
					<div class="badge-state-container">
						<%-- 메달 선택 버튼들 --%>
						<button type="button" id="rankGold"
							class="btn btn-warning btn-lg medal-btn" data-medal="gold">
							<div class="badge-stat-gold">
								<div class="badge-stat-icon"></div>
							</div>
						</button>
						<button type="button" id="rankSilver"
							class="btn btn-secondary btn-lg medal-btn" data-medal="silver">
							<div class="badge-stat-silver">
								<div class="badge-stat-icon"></div>
							</div>
						</button>
						<button type="button" id="rankBronze"
							class="btn btn-danger btn-lg medal-btn" data-medal="bronze">
							<div class="badge-stat-bronze">
								<div class="badge-stat-icon"></div>
							</div>
						</button>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" id="goToPostBtn" class="btn btn-secondary">글
							이동</button>

						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

var boardStats = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminavgboard.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
			$('.total-teams').text(response.totalMembers);
			$('.inactive-teams').text(response.inactiveMembers);
			$('.weekly-teams').text(response.weeklySignups);
			$('.active-teams').text(response.activeMembers);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {

		}
	}); // $.ajax 끝
}
var searchBoard = () => {
    const search = $('#searchInput').val();
    $.ajax({
        // 데이터를 전송할 서버 URL
        url: 'adminselectrank.do',
        // ... (생략)
        data: {
            findName : search
        },
        // 데이터 전송 성공 시 실행
        success: function(response) {
            console.log(response);
            
            // 1. response가 배열인지 확인하고, 아니면 빈 배열로 안전하게 설정
            const dataForGrid = Array.isArray(response) ? response : [];
            
            // 2. 🚨 수정: 안전하게 검사된 'dataForGrid'를 사용하도록 변경
            gridRank.resetData(dataForGrid);
            
            boardStats();
        },
        
        // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        error: function(xhr, status, error) {
            gridRank.resetData([]);
        }
    });
}
var studyRank = (findName, studyId) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
			url: 'adminupdatestudyrank.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
			type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
			data: {
				findName : findName,
				studyId : studyId
			},
		// 데이터 전송 성공 시 실행
			success: function(response) {
				console.log(response);
		// response는 서버에서 돌려준 데이터입니다.
				gridRank.resetData(response);
			    boardStats();
			},
		
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
			error: function(xhr, status, error) {
			}
		});
}
$(document).ready(function() {
	
	$('.medal-btn').on('click', function() {
		const selectedMedal = $(this).attr('data-medal');
        // 2. 선택된 메달에 따라 메시지 설정
         if (selectedMedal === 'gold') {
        	const studyId = $('#rankGold').val();
        	const findName = "G";
        	studyRank(findName,studyId);
        } else if (selectedMedal === 'silver') {
        	const studyId = $('#rankSilver').val();
        	const findName = "S";
        	studyRank(findName,studyId);
        } else if (selectedMedal === 'bronze') {
        	const studyId = $('#rankBronze').val();
        	const findName = "B";
        	studyRank(findName,studyId);
        }
        
        // 3. 모달 닫기
        $('#medalSelectModal').modal('hide');

    });
	
	
	gridRank = new tui.Grid({
		el : document.getElementById('gridRank'),
		data : {
			api : {
				readData : {
					url : 'adminselectrank.do',
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
			header : '작성자',
			name : 'memNick'
		},{
			header : '카테고리',
			name : 'studyCategory',
			filter: {
	            type: 'select'
	        }
		},{
			header : '글 제목',
			name : 'postTitle'
		}, {
			header : '작성일',
			name : 'postingDate',
			sortable: true
		},{
			header : '좋아요',
			name : 'likeCount',
			sortable: true
		},{
			header : '조회수',
			name : 'postViews',
			sortable: true
		},{
			header: '기타',
			name: 'grade',
			width: 150,
			renderer: {
				type: CustomRankBtnRenderer,
			}
		}
		]
	});
	gridRank.setBodyHeight(450);
    searchBoard();
});
</script>
</html>