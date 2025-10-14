<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.19/main.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.19/index.global.min.js"></script>
<link href="css/mypage.css" rel="stylesheet">
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
	<main>
		<div class="t_container">
			<div class="left_empty"></div>
			<div class="profile_category_line">
				<div class="logo">
					<img src="./images/로고.png">
				</div>
				<div class="profile_photo">
					<img class="profileImage" src="./images/열공남.png">
				</div>
				<!-- 유저가 사진을 선택해서 넣을 수 있는 부분입니다. -->
				<div class="profile_nic">
					<p>nickname</p>
					<p>이메일</p>
				</div>
				<div class="category">
					<ul>
						<li class="big_cate">내 프로필
						<ul>
						<li>회원상세이지</li>
						</ul>
						</li>
						<li class="big_cate">스터디캘린더
							<ul>
								<li>스터디 일정</li>
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
						<li class="big_cate">게시글
							<ul>
								<li>나의 리뷰</li>
								<li>나의 게시글</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="icon_line">
					<ul>
						<li>home</li>
						<li>notice</li>
						<li>groo talk</li>
						<li>logout</li>
					</ul>
				</div>
				<div class="calander">
					<div class="top">groo calander</div>
					<div id="calendar"></div>
				</div>
				<div class="short_board basicInfoBtn">
					<div class="top basicInfoBtn">기본정보</div>
				</div>
				<div class="study_alram">
					<div class="top">새로운알림</div>
				</div>
			</div>
			<div class="right_empty"></div>
		</div>
	</main>
	
	<script>
	document.addEventListener("DOMContentLoaded", () => {
		  // 모든 .basicInfoBtn 요소 가져오기
		  document.querySelectorAll(".basicInfoBtn").forEach(btn => {
		    btn.addEventListener("click", () => {
		      window.location.href = "${pageContext.request.contextPath}/userdetail.do";
		    });
		  });

		  // 캘린더 초기화
		  const calendarEl = document.getElementById('calendar');
		  const calendar = new FullCalendar.Calendar(calendarEl, {
		    initialView: 'dayGridMonth',
		    height: 400,
		    locale: 'ko',
		    events: [
		      { title: '스터디 모임', start: '2025-10-15' },
		      { title: '프로젝트 회의', start: '2025-10-18' },
		      { title: '팀 이벤트', start: '2025-10-21' }
		    ]
		  });
		  calendar.render();
		});
</script>
</body>
</html>