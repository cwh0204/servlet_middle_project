<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀 일정 게시판</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    
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
            padding: 0.35rem 0.75rem;
            border-radius: 50rem;
        }
        
        .badge-votes-count {
            background-color: #e7e3fc;
            color: #4c1d95;
            padding: 0.35rem 0.75rem;
            border-radius: 50rem;
        }
        
        .badge-date {
            background-color: #cfe2ff;
            color: #084298;
            padding: 0.35rem 0.75rem;
            border-radius: 50rem;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
        }
        
        .loading-spinner {
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }
        
        .empty-state i {
            font-size: 4rem;
            color: #dee2e6;
        }
        .container{
        	margin-top: 20px;
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
                        <i class="bi bi-calendar-event text-primary"></i>
                        팀 일정 게시판
                    </h1>
                    <p class="text-muted mb-0">투표로 결정된 팀 일정</p>
                </div>
                <button id="refreshBtn" class="btn btn-primary">
                    <i class="bi bi-arrow-clockwise" id="refreshIcon"></i>
                    새로고침
                </button>
            </div>
        </div>

        <!-- 로딩 상태 -->
        <div id="loadingState" class="schedule-card text-center" style="display: none;">
            <i class="bi bi-arrow-clockwise loading-spinner" style="font-size: 3rem; color: #0d6efd;"></i>
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
        <div id="emptyState" class="schedule-card empty-state" style="display: none;">
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
    <script>
    $(document).ready(function() {
        // 날짜 포맷 함수
        function formatDate(dateString) {
            // 투표 시작일 (VOTE_START)을 'YYYY년 M월 D일' 형식으로 포맷
            const date = new Date(dateString);
            const year = date.getFullYear();
            const month = date.getMonth() + 1;
            const day = date.getDate();
            return year + '년 ' + month + '월 ' + day + '일';
        }

        // 날짜 시간 포맷 함수 (투표 마감일 또는 기타 등록일 포맷에 사용)
        function formatDateTime(dateString) {
            const date = new Date(dateString);
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            const hours = String(date.getHours()).padStart(2, '0');
            const minutes = String(date.getMinutes()).padStart(2, '0');
            const seconds = String(date.getSeconds()).padStart(2, '0');
            return year + '. ' + month + '. ' + day + '. ' + hours + ':' + minutes + ':' + seconds;
        }

        /**
         * 투표 카드 생성 함수 (vote 객체 구조에 맞게 수정)
         * @param {object} vote - 서버에서 받은 투표 데이터 객체
         */
        function createScheduleCard(vote) {
            // vote.voteOk는 문자열일 수 있으므로 숫자로 변환
            const votesCount = parseInt(vote.voteOk, 10) || 0;
            
            var badges = '';
            
            // 투표 당선 (가정: 랭킹 1위로 조회된 데이터이므로 당선으로 처리)
            // 실제 fromVote 플래그 대신 랭킹 조회 결과임을 명시적으로 나타낼 수 있습니다.
            badges += '<span class="badge-vote me-2">주간 랭킹 1위</span>'; 
            
            if (votesCount > 0) {
                badges += '<span class="badge-votes-count me-2">' + votesCount + '표 획득</span>';
            }
            
            // VOTE_START 필드를 날짜로 사용
            badges += '<span class="badge-date">' + formatDate(vote.voteStart) + '</span>';
            
            // VOTE_CONTENT를 일정 설명으로 사용
            var descriptionHtml = vote.voteContent ? 
                '<p class="text-muted mb-2">' + vote.voteContent + '</p>' : '';
            
            // 작성자 정보 및 마감일을 등록일 대신 표시
            var infoHtml = 
                '<p class="small text-muted mb-0">' +
                    '작성자: **' + vote.studyRoll + '** ' + vote.memNick + 
                    ' | 마감일: ' + formatDateTime(vote.voteEnd) +
                '</p>';
            
            // VOTE_TITLE을 일정 제목으로 사용
            return '<div class="schedule-card">' +
                '<div class="mb-3">' + badges + '</div>' +
                '<h3 class="mb-2">' + vote.voteTitle + '</h3>' +
                descriptionHtml +
                infoHtml + // 작성자 및 마감일 정보 추가
                '</div>';
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
            var studyId = sessionStorage.getItem('teamId');
            
            $.ajax({
                url: 'voteselectrank.do',
                method: 'POST',
                data: {
                	studyId: studyId
                },
                success: function(response) {
            		// **성공 응답 처리: 임시 데이터 대신 실제 응답 사용**
            		const schedules = Array.isArray(response) ? response : [];
            		console.log(schedules);
                    
                    $('#loadingState').hide();
                    $('#refreshIcon').removeClass('loading-spinner');

                    if (schedules.length === 0) {
                        $('#emptyState').show();
                    } else {
                        // 일정 목록 렌더링 (response 데이터 사용)
                        $.each(schedules, function(index, vote) {
                            $('#scheduleList').append(createScheduleCard(vote));
                        });

                        // 통계 업데이트
                        // 랭킹 결과이므로 모든 항목을 카운트합니다.
                        var rankCount = schedules.length; 
                        
                        // 모든 투표 결과의 VOTE_OK 합계
                        var totalVotes = schedules.reduce(function(sum, vote) { 
                            return sum + (parseInt(vote.voteOk, 10) || 0); 
                        }, 0);

                        // 통계 카드는 적절한 값으로 업데이트
                        $('#totalCount').text(schedules.length);
                        // 랭킹 투표 건수 (각 주차별 1위 건수)
                        $('#voteCount').text(rankCount); 
                        // 랭킹 1위 투표들의 총 득표 수 합계
                        $('#totalVotes').text(totalVotes); 
                        $('#statsCard').show();
                    }
                },
                error: function(xhr, status, error) {
                	console.error("AJAX Error:", status, error);
                    
                    $('#loadingState').hide();
                    $('#refreshIcon').removeClass('loading-spinner');
                    $('#errorMessage').text('데이터를 불러오는데 실패했습니다. 서버 오류: ' + error);
                    $('#errorState').show();
                }
            });

            // **주의: 임시 데이터 블록은 삭제 또는 주석 처리했습니다.**
            // **실제 AJAX 통신이 완료될 때까지 기다려야 합니다.**
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