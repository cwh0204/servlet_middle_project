<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<link href="css/team/myteam/teamdetail.css" rel="stylesheet">
<title>team create</title>
</head>
<body>
<form action="" id="teamDetailForm" method="post">
	<section class="team-header">
        <img src="images/team_frontend_logo.png" alt="팀 프로필" class="team-profile-img">
        
        <div class="header-content">
            <h1 class="team-title">
            	<label for="study_title">프론트엔드 개발 스터디:</label>
            	<input type="text" name="study_title" id="study_title" value="리액트 마스터" readonly>
            </h1>
            
            <div class="team-meta">
                <span><img src="https://i.postimg.cc/N0CsYrW9/free-icon-love-9812568.png" class="heart">2,134</span> 
                <span><img src="https://i.postimg.cc/qMkNbqfw/free-icon-chick-15549519.png" class="egg-img">2024년 03월 15일 생성</span> 
                <span><img src="https://i.postimg.cc/jd5NFSZf/education-1.png" class="edu-img">
                	  <input type="text" name="study_category" id="study_category" value="개발 & IT" readonly></span> 
            </div>
        </div> 
        
      <div class="team-leader-wrapper"> 
        <div class="team-leader-card">
        	<span class="leader-badge">Team Leader</span>
            <img src="images/leader_profile.png" alt=" 팀장 프로필" class="leader-photo">
            <div class="leader-info">
            	<h3 class="leader-name">김철수</h3> 
            	<p class="leader-role">팀장 / Chief</p>
            </div>
        </div>
      </div> 
    </section>

  <div class="team-info">  
    <section class="team-introduction">
        <h2><label for="study_intro">팀 소개</label></h2>	
        	<p class="summary" id="team-summary">
            	<textarea rows="5" cols="110" name="study_intro" id="study_intro" readonly>
            	실무에 바로 적용 가능한 리액트(React) 심화 학습 및 프로젝트 진행 스터디입니다. 주니어 개발자의 성장을 목표로 합니다."
            	</textarea>
        	</p>
        
        <h2><label for="study_introcontent">상세 활동 내용</label></h2>
        <div class="details" id="team-details">
        	<textarea rows="10" cols="123" name="study_introcontent" id="study_introcontent" readonly>
            저희 팀은 매주 토요일 오전 10시부터 12시까지 정기적으로 모여 JS, React hooks, 상태 관리(Recoil) 등에 대해 심층적인 토론과 코딩 테스트를 진행합니다.
           
              주요 목표: 6개월 내에 포트폴리오용 웹 서비스 2가지 완성
              운영 방식: 매주 1명씩 발표/질문 담당, 코드 리뷰 필수
              필수 참여 조건: 기초적인 HTML/CSS/JS 지식 보유자
            
            </textarea>
        </div>
        
        <div class="btn-area">
        	<input type="button" value="가입하기" class="join" id="joinBtn">
        	<input type="button" value="수정하기" class="edit" id="editBtn"> 
    		<input type="submit" value="저장하기" class="save" id="saveBtn">
    	</div>	
    </section>
    
   	<section class="team-schedule">
    	<h2><img src="https://i.postimg.cc/3R00YvL6/free-icon-schedule-5807616.png" class="schedule-img">
    	스터디 일정표</h2>
    	<ul class="schedule-list">
    		<li>
    			<div class="schedule-date">2025-11-8 (토)</div>
    			<div class="schedule-content">
    				<strong>프로젝트 구조 설계 회의</strong>
    				<span>참여자 전원</span>
    			</div>
    		</li>
    		<li>
    			<div class="schedule-date">2025-11-15 (토)</div>
    			<div class="schedule-content">
    				<strong>리액트 Hook 정리 발표</strong>
    				<span>발표자: 김리액트</span>
    			</div>
    		</li>
    		<li>
    			<div class="schedule-date">2025-11-22 (토)</div>
    			<div class="schedule-content">
    				<strong>Recoil 코딩</strong>
    				<span>참여자 전원</span>
    			</div>
    		</li>
    	</ul>
    </section>
  </div>
</form>  

<script>

$(document).ready(function() {
	
	// 처음 화면에서는 저장하기 버튼 숨기기
	$('#saveBtn').hide();
	
	// 가입하기 버튼 클릭 시
	$('#joinBtn').click(function() {
		if(confirm('이 스터디에 가입하시겠습니까?')) {
			alert('가입 요청이 완료되었습니다.');
			$('#joinBtn').prop('disabled', true).val('가입 완료');
		}
	});	
		
	// 수정하기 버튼 클릭 시
	$('#editBtn').click(function() {
		$('#study_title, #study_category, #team-summary, #team-details').prop('readonly', false).addClass('edit-mode');
		
		$('#editBtn').hide();
		$('#saveBtn').show();
	});
	
	// 저장하기 버튼 클릭 시
	$('#saveBtn').click(function() {
		alert('변경사항이 저장되었습니다.');
		$('#study_title, #study_category, #team-summary, #team-details').prop('readonly', true).removeClass('edit-mode');
		
		$('#saveBtn').hide();
		$('#editBtn').show();
	});
	
	// 폼 제출
//	$('#teamDetailForm').submit();
});


</script>

</body> 
</html>