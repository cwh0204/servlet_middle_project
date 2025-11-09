<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<img src="images/team_frontend_logo.png" alt="팀 프로필"
				class="team-profile-img">

			<div class="header-content">
				<h1 class="team-title">
					<input type="text" name="study_title" id="study_title"
						value="프론트엔드 개발 스터디: 리액트 마스터" readonly>
				</h1>

				<div class="team-meta">
					<span><img
						src="https://i.postimg.cc/N0CsYrW9/free-icon-love-9812568.png"
						class="heart">2,134</span> <span><img
						src="https://i.postimg.cc/qMkNbqfw/free-icon-chick-15549519.png"
						class="egg-img">2024년 03월 15일 생성</span> <span><img
						src="https://i.postimg.cc/jd5NFSZf/education-1.png"
						class="edu-img"> <input type="text" name="study_category"
						id="study_category" value="개발 & IT" readonly></span>
				</div>
			</div>

			<div class="team-leader-wrapper">
				<div class="team-leader-card">
					<span class="leader-badge">Team Leader</span> <img
						src="images/leader_profile.png" alt=" 팀장 프로필" class="leader-photo">
					<div class="leader-info">
						<h3 class="leader-name">김철수</h3>
						<p class="leader-role">팀장 / Chief</p>
					</div>
				</div>
			</div>
		</section>

		<div class="team-info">
			<section class="team-introduction">
				<h2>
					<label for="study_intro">팀 소개</label>
				</h2>
				<p class="summary" id="team-summary">
					<textarea rows="5" cols="110" name="study_intro" id="study_intro"
						readonly>
            	실무에 바로 적용 가능한 리액트(React) 심화 학습 및 프로젝트 진행 스터디입니다. 주니어 개발자의 성장을 목표로 합니다."
            	</textarea>
				</p>

				<h2>
					<label for="study_introcontent">상세 활동 내용</label>
				</h2>
				<div class="details" id="team-details">
					<textarea rows="10" cols="123" name="study_introcontent"
						id="study_introcontent" readonly>
            저희 팀은 매주 토요일 오전 10시부터 12시까지 정기적으로 모여 JS, React hooks, 상태 관리(Recoil) 등에 대해 심층적인 토론과 코딩 테스트를 진행합니다.
           
              주요 목표: 6개월 내에 포트폴리오용 웹 서비스 2가지 완성
              운영 방식: 매주 1명씩 발표/질문 담당, 코드 리뷰 필수
              필수 참여 조건: 기초적인 HTML/CSS/JS 지식 보유자
            </textarea>
				</div>

				<div class="btn-area">
					<input type="button" value="가입하기" class="join" id="joinBtn">
					<input type="button" value="수정하기" class="edit" id="editBtn">
					<input type="button" value="저장하기" class="save" id="saveBtn">
					<input type="button" value="탈퇴하기" class="leave" id="leaveBtn">
				</div>
			</section>

			<section class="team-schedule">
				<h2>
					<img
						src="https://i.postimg.cc/3R00YvL6/free-icon-schedule-5807616.png"
						class="schedule-img"> 스터디 일정표
				</h2>
				<ul class="schedule-list">
					<li>
						<div class="schedule-date">2025-11-8 (토)</div>
						<div class="schedule-content">
							<strong>프로젝트 구조 설계 회의</strong> <span>참여자 전원</span>
						</div>
					</li>
					<li>
						<div class="schedule-date">2025-11-15 (토)</div>
						<div class="schedule-content">
							<strong>리액트 Hook 정리 발표</strong> <span>발표자: 김리액트</span>
						</div>
					</li>
					<li>
						<div class="schedule-date">2025-11-22 (토)</div>
						<div class="schedule-content">
							<strong>Recoil 코딩</strong> <span>참여자 전원</span>
						</div>
					</li>
				</ul>
			</section>
		</div>
	</form>

	<script>
var studyId = sessionStorage.getItem('teamId');
var memLoginId = sessionStorage.getItem('userId');
var loginNick = '<c:out value="${sessionScope.loginNick}" default="" />';
console.log('로그인 닉:', sessionStorage.getItem('userNick'));


$('#joinBtn').hide();
$('#editBtn').hide();
$('#leaveBtn').hide();

$.ajax({
      // 데이터를 전송할 서버 URL
      url: 'teamleaderteampage.do',
      // 전송 방식 (로그인/회원가입은 보통 POST 사용)
      type: 'POST',
      // 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
      data: {
         studyId : studyId,
         memLoginId : memLoginId
      },
      // 데이터 전송 성공 시 실행
      success: function(response) {

    	 console.log("비회원"+memLoginId);
    	 if(response == null){
    		 if(memLoginId != null){
    			 $('#joinBtn').show(); 
    		 }
    	 }else if(response.studyRoll == 'L'){
        	 $('#editBtn').show();
         }else if(response.studyRoll == 'M'){
        	 $('#leaveBtn').show();
         }
      },
      // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
      error: function(xhr, status, error) {
      }
   
    });


var loadScheduleList = (response) => {
	   
	   var $scheduleList = $('.schedule-list');
	   
	   if (!response || response.length === 0) {
	       $scheduleList.html('<li>일정 정보가 없습니다.</li>');
	       return;
	   }

	   // 기존 목록을 비우고 새로 채웁니다.
	   $scheduleList.empty(); 

	   // 3. 배열을 순회하며 HTML 요소 생성
	   response.forEach(schedule => {
	       // 날짜와 요일을 조합 (예: 2025-11-8 (토))
	       const fullDate = `${schedule.scheduleDate} (${schedule.dayOfWeek})`;
	       
	       // 새로운 <li> 요소 생성
	       const $listItem = $('<li>');

	       // <div class="schedule-date"> 요소 생성 및 추가
	       const $dateDiv = $('<div>')
	           .addClass('schedule-date')
	           .text(schedule.voteStart);
	       
	       // <div class="schedule-content"> 요소 생성
	       const $contentDiv = $('<div>')
	           .addClass('schedule-content');

	       // <strong> 요소 (일정 제목) 추가
	       $contentDiv.append(
	           $('<strong>').text(schedule.voteTitle + ' ')
	       );

	       // <span> 요소 (참여자) 추가
	       $contentDiv.append(
	           $('<span>').text(schedule.participants)
	       );
	       
	       // 최종적으로 <li>에 날짜와 내용을 모두 추가
	       $listItem.append($dateDiv, $contentDiv);
	       
	       // 4. 완성된 <li>를 부모 <ul>에 삽입
	       $scheduleList.append($listItem);
	   });
	}
	loadScheduleListAjax = () => {
	   const studyId = sessionStorage.getItem('teamId');
	    // 2. AJAX 통신 시작
	    $.ajax({
	        url: 'voteselectrank.do', // 일정 데이터를 제공하는 서버 엔드포인트
	        type: 'POST',        // 데이터 조회는 보통 GET 방식 사용
	        data: {
	           studyId: studyId
	        },
	        success: function(response) {
	        	console.log(response);
	           loadScheduleList(response);
	        },

	        error: function(xhr, status, error) {
	            console.error("일정 목록을 가져오는 데 실패했습니다.", status, error);
	            $scheduleList.html('<li>일정 정보를 불러오는 중 오류가 발생했습니다.</li>');
	        }
	    });
	}
$(document).ready(function() {
	
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teammemberselectpage.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId: studyId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
			
			// 배열인 경우 첫번째 데이터 꺼내기
			const data = response[0];
			
			if(data) {
				$('#study_title').val(data.studyTitle);
				$('.leader-name').text(data.memNick);
				$('#study_category').val(data.studyCategory);
				$('#study_intro').val(data.studyIntro);
				$('#study_introcontent').val(data.studyIntrocontent);
				
				// 팀장 이름 가져오기
				const leaderNick = data.memNick;
				console.log("ASdasas", leaderNick);
/* 				if(loginNick !== leaderNick){
					$('#editBtn').hide();
					$('#saveBtn').hide();
				}else {
					$('#editBtn').show();
				} */
			}else {
				console.warn("데이터가 비어있습니다.");
			}
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
			console.log("데이터를 불러오는 AJAX 오류: ", status, error);
		}
	});
	
	loadScheduleListAjax();
	// 처음 화면에서는 저장하기 버튼 숨기기
	$('#saveBtn').hide();
	
	// 가입하기 버튼 클릭 시
	$('#joinBtn').click(function() {
		if(confirm('이 스터디에 가입하시겠습니까?')) {
			$.ajax({
				url: 'teammemberinsertpage.do',	// 가입 요청 서버 URL
				type: 'POST',
				dataType: 'json',
				data: {
					studyId: studyId,
					memLoginId: memLoginId
				},
				success: function(response){
					console.log('가입 응답:', response);
					
					if(response.status == "success"){
						alert('가입이 완료되었습니다.');
						
						$('#joinBtn').hide();
						$('#leaveBtn').show();
					}else {
						alert('가입 실패: '+response.message);
					}
				},
				error: function(xhr, status, error){
					console.error('가입 중 오류 발생:', status, error);
				}
			});
		}
	});	
		
	// 수정하기 버튼 클릭 시
	$('#editBtn').click(function() {
		$('#study_title, #study_category, #team-summary textarea, #team-details textarea').prop('readonly', false)
																						  .addClass('edit-mode');
		$('#editBtn').hide();
		$('#saveBtn').show();
		
		// 저장하기 버튼 클릭 시
		$('#saveBtn').click(function() {
			
			// 입력값 
			const studyTitle = $('#study_title').val();
			const studyCategory = $('#study_category').val();
			const studyIntro = $('#study_intro').val();
			const studyIntrocontent = $('#study_introcontent').val();
			
			$.ajax({
				// 데이터를 전송할 서버 URL
				url: 'teammemberupdatepage.do',
				// 전송 방식 (로그인/회원가입은 보통 POST 사용)
				type: 'POST',
				// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
				data: {
					studyId: studyId,		// 위에서 선언된 전역 변수 사용
					studyTitle: studyTitle,
					studyCategory: studyCategory,
					studyIntro: studyIntro,
					studyIntrocontent: studyIntrocontent
				},
				dataType: 'json',		// 서버에서 JSON으로 응답하니까 이렇게 작성
				success: function(response){
					console.log('서버응답: ',response);
					
					if(response.status === "success"){
					   alert('변경사항이 저장되었습니다.');
					   location.reload();				// 페이지 새로고침으로 최신 상태 반영
					   $('#study_title, #study_category, #team-summary textarea, #team-details textarea').prop('readonly', true)
																										  .removeClass('edit-mode');
					   $('#saveBtn').hide();
					   $('#editBtn').show();
					}else {
						alert('저장 실패:' +response.message);
					}
				},
				error: function(xhr, status, error){
				/* console.log('저장하는 중에 서버 통신 오류:', status, error); */
					console.log('오류 상태:', status, error);
				    console.log('서버 응답 원문:', xhr.responseText);
				}
			});
		});
	});
});


</script>

</body>
</html>