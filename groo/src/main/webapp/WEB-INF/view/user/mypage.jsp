<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<!-- ✅ FullCalendar & jQuery -->
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.19/main.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.19/index.global.min.js"></script>

<!-- ✅ CSS -->
<link href="css/mypage.css" rel="stylesheet">
</head>

<body>
<main>
	<div class="t_container">

		<!-- 왼쪽 -->
		<div class="left_box">
			<div class="profile_category_line">
				<div class="logo">
					<img src="./images/로고.png" alt="로고">
				</div>
				<div class="profile_photo">
					<img class="profileImage" src="./images/열공남.png" alt="프로필사진">
				</div>

				<div class="nick_name">
					<p>닉네임 : ${userId}</p>
					<p>email : ${email}</p>
				</div>

				<!-- 카테고리 메뉴 -->
				<div class="category">
					<ul>
						<li class="big_cate">내 프로필
							<ul>
								<li class="basicInfoBtn">회원상세페이지</li>
							</ul>
						</li>
						<li class="big_cate">스터디캘린더
							<ul>
								<li class="studyScheduleBtn">스터디 일정</li>
								<li>모임취소 요청하기</li>
							</ul>
						</li>
						<li class="big_cate">나의 스터디
							<ul>
								<li>스터디상세보기</li>
								<li>스터디진행상황</li>
								<li>스터디 탈퇴</li>
							</ul>
						</li>
						<li class="big_cate">나의 활동
							<ul>
								<li>나의 관심스터디</li>
								<li>나의 리뷰(수정/조회/삭제)</li>
								<li>나의 게시글(수정/조회/삭제)</li>
							</ul>
						</li>
						<li class="big_cate">팀찾기
							<ul>
								<li>신규 생성 스터디목록</li>
								<li>나의 관심 스터디 목록</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 오른쪽 -->
		<div class="right_box">
			<div class="icon_line">
				<ul>
					<li class="homeBtn">home</li>
					<li>notice</li>
					<li class="FmyTcreateBtn">team create</li>
					<li>groo talk</li>
					<li>logout</li>
				</ul>
			</div>

			<!-- ✅ 캘린더 -->
			<div class="calander">
				<div class="top">groo calendar</div>
				<div id="calendar"></div>
			</div>

			<!-- 기본정보 -->
			<div class="short_board">
				<div class="top">기본정보</div>
				<div class="info_content">

					<div class="info_row">
						<span>닉네임 :</span>
						<span id="nicknameText">${user.nickname}</span>
						<button type="button" id="editNicknameBtn" class="editBtn">변경</button>
					</div>

					<form id="nicknameForm" action="${pageContext.request.contextPath}/updateNickname.do"
						  method="post" style="display:none; margin-top:5px;">
						<input type="text" name="nickname" value="${user.nickname}">
						<button type="submit">저장</button>
						<button type="button" id="cancelNicknameBtn">취소</button>
					</form>

					<div class="info_row">
						<span>이메일 :</span>
						<span id="emailText">${user.email}</span>
						<button type="button" id="editEmailBtn" class="editBtn">변경</button>
					</div>

					<form id="emailForm" action="${pageContext.request.contextPath}/updateEmail.do"
						  method="post" style="display:none; margin-top:5px;">
						<input type="email" name="email" value="${user.email}">
						<button type="submit">저장</button>
						<button type="button" id="cancelEmailBtn">취소</button>
					</form>

					<div class="info_row">
						<span>참여중인 스터디 :</span>
						<span id="studyText">${user.studyname}</span>
						<button type="button" id="editStudyBtn" class="editBtn">변경</button>
					</div>

					<form id="studyForm" action="${pageContext.request.contextPath}/updateStudy.do"
						  method="post" style="display:none; margin-top:5px;">
						<input type="text" name="studyname" value="${user.studyname}">
						<button type="submit">저장</button>
						<button type="button" id="cancelStudyBtn">취소</button>
					</form>
				</div>
			</div>

			<!-- 새로운 알림 -->
			<div class="study_alram">
				<div class="top">새로운알림</div>
			</div>
		</div>
	</div>
</main>

<!-- ✅ JavaScript -->
<script>

const href = (addr) => {
	const PAGE_ADDR_GROO = "${pageContext.request.contextPath}";
	window.location.href = PAGE_ADDR_GROO+addr;
}
document.addEventListener("DOMContentLoaded", () => {
	
	
  // 이동 버튼
  document.querySelector(".homeBtn").addEventListener("click", () => {
	  href("/index.do");
    /* window.location.href = PAGE_ADDR_GROO+"/index.do"; */
  });
  document.querySelectorAll(".basicInfoBtn").forEach(btn => {
    btn.addEventListener("click", () => {
    	 href("/userdetail.do");
    });
    document.querySelector(".FmyTcreateBtn").addEventListener("click", () => {
    	 href("/teamcreate.do");
      });
  });

  // ✅ FullCalendar 초기화
  const calendarEl = document.getElementById('calendar');
  const calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    height: 400,
    locale: 'ko',
    headerToolbar: {
      left: 'prev',
      center: 'title',
      right: 'next'
    },
    events: [
      { title: '스터디 모임', start: '2025-10-15', end: '2025-10-19' },
      { title: '프로젝트 회의', start: '2025-10-29' },
      { title: '팀 이벤트', start: '2025-10-21' }
    ]
  });
  calendar.render();

  // ✅ 달력 펼치기 / 접기 토글
  const studyScheduleBtn = document.querySelector('.studyScheduleBtn');
  const calendarBox = document.querySelector('.calander');
  const shortBoard = document.querySelector('.short_board');
  const studyAlarm = document.querySelector('.study_alram');
  let isExpanded = false;

  const toggleCalendarSize = () => {
    if (!isExpanded) {
      shortBoard.classList.add('hidden-section');
      studyAlarm.classList.add('hidden-section');
      calendarBox.style.transition = 'height 0.55s ease';
      calendarBox.style.height = '70vh';
      isExpanded = true;
    } else {
      calendarBox.style.transition = 'height 0.5s ease';
      calendarBox.style.height = '12vh';
      setTimeout(() => {
        shortBoard.classList.remove('hidden-section');
        studyAlarm.classList.remove('hidden-section');
      }, 250);
      isExpanded = false;
    }
  };

  studyScheduleBtn.addEventListener('click', toggleCalendarSize);
  calendarBox.addEventListener('click', toggleCalendarSize);

  // ✅ hover 애니메이션
  const boxes = [
    document.querySelector('.calander'),
    document.querySelector('.short_board'),
    document.querySelector('.study_alram'),
    document.querySelector('.profile_category_line')
  ];
  boxes.forEach(box => {
    if (!box) return;
    box.addEventListener('mouseover', e => {
      e.currentTarget.classList.remove('lift-anim-down');
      e.currentTarget.classList.add('lift-anim-up');
    });
    box.addEventListener('mouseout', e => {
      e.currentTarget.classList.remove('lift-anim-up');
      e.currentTarget.classList.add('lift-anim-down');
    });
  });
});

// ✅ jQuery로 정보 수정 토글
$(document).ready(function() {

  $("#editNicknameBtn").click(function() {
    $("#nicknameForm").slideDown(200);
    $("#nicknameText, #editNicknameBtn").hide();
  });
  $("#cancelNicknameBtn").click(function() {
    $("#nicknameForm").slideUp(200);
    $("#nicknameText, #editNicknameBtn").show();
  });

  $("#editEmailBtn").click(function() {
    $("#emailForm").slideDown(200);
    $("#emailText, #editEmailBtn").hide();
  });
  $("#cancelEmailBtn").click(function() {
    $("#emailForm").slideUp(200);
    $("#emailText, #editEmailBtn").show();
  });

  $("#editStudyBtn").click(function() {
    $("#studyForm").slideDown(200);
    $("#studyText, #editStudyBtn").hide();
  });
  $("#cancelStudyBtn").click(function() {
    $("#studyForm").slideUp(200);
    $("#studyText, #editStudyBtn").show();
  });
});
</script>

</body>
</html>
