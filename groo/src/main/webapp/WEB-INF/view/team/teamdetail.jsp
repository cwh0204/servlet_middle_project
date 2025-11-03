<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 디테일 - 프론트엔드 개발 스터디</title>
<link href="css/TeamDetail.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="css/team/myteam/teamdetail.css" rel="stylesheet">
</head>
<body>

<div class="team-detail-page">
    
    <section class="team-header">
        <img src="images/team_frontend_logo.png" alt="팀 프로필" class="team-profile-img">
        
        <div class="header-content">
            <h1 class="team-title">프론트엔드 개발 스터디: 리액트 마스터</h1>
            
            <div class="team-meta">
                <span>❤️ 2,134</span> <span>🗓️ 2024년 03월 15일 생성</span> <span># IT/개발</span> </div>
        </div>
        
        <div class="team-leader">
            <p>팀 반장</p>
            <img src="images/leader_profile.png" alt="반장 프로필" class="member-profile-img">
            <strong>김철수</strong> 
            <span>(팀장/Chief)</span>
        </div>
    </section>

    
    <section class="team-introduction">
        <h2>팀 소개</h2>
        <p class="summary">
            "실무에 바로 적용 가능한 리액트(React) 심화 학습 및 프로젝트 진행 스터디입니다. 주니어 개발자의 성장을 목표로 합니다."
        </p>
        
        <h2>상세 활동 내용</h2>
        <div class="details">
            <p>저희 팀은 매주 토요일 오전 10시부터 12시까지 정기적으로 모여 JS, React hooks, 상태 관리(Recoil) 등에 대해 심층적인 토론과 코딩 테스트를 진행합니다.</p>
            <ul>
                <li>**주요 목표:** 6개월 내에 포트폴리오용 웹 서비스 2가지 완성</li>
                <li>**운영 방식:** 매주 1명씩 발표/질문 담당, 코드 리뷰 필수</li>
                <li>**필수 참여 조건:** 기초적인 HTML/CSS/JS 지식 보유자</li>
            </ul>
        </div>
        
        <div class="remote-links">
            <h2>주요 활동 사이트</h2>
            <a href="https://www.notion.so/dummy-team" target="_blank">📚 노션 (스터디 자료)</a>
            <a href="https://zoom.us/j/1234567890" target="_blank">💻 Zoom (온라인 회의)</a>
            <a href="https://github.com/dummy-frontend-team" target="_blank">🔗 GitHub (코드 저장소)</a>
        </div>
    </section>

</div>


<script>
$(document).ready(function() {
    $('.tab-button').on('click', function() {
        // 탭 버튼 활성화/비활성화
        $('.tab-button').removeClass('active');
        $(this).addClass('active');

        // 해당 탭 내용 표시/숨김
        const tabId = $(this).data('tab');
        $('.tab-content > div').removeClass('active');
        $('#' + tabId).addClass('active');
    });
});
</script>

</body>
</html>