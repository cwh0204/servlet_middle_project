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

			<!-- 왼쪽 전체 박스 -->
			<div class="left_box">
				<div class="profile_category_line">
					<div class="logo">
						<img src="./images/로고.png" alt="로고">
					</div>
					<div class="profile_photo">
						<img class="profileImage" src="./images/열공남.png" alt="프로필사진">
					</div>

					<div class="profile_nic">
						<p>nickname</p>
						<p>이메일</p>
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
							<li class="big_cate">게시글
								<ul>
									<li>나의 리뷰</li>
									<li>나의 게시글</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 오른쪽 전체 박스 -->
			<div class="right_box">
				<div class="icon_line">
					<ul>
						<li class = "homeBtn">home</li>
						<li>notice</li>
						<li>groo talk</li>
						<li>logout</li>
					</ul>
				</div>

				<!-- 캘린더 -->
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
							<span id="user_nickname">${user_nickname}</span>
							<button id="editNicknameBtn" type="button" class="editBtn">변경</button>
						</div>

						<div id="nicknameEditBox" style="display: none;">
							<input type="text" id="nicknameInput" placeholder="새로운 닉네임을 입력해주세요">
							<button id="saveNicknameBtn" type="button">저장</button>
							<button id="cancelNicknameBtn" type="button">취소</button>
						</div>

						<div class="info_row">
							<span>이메일 :</span>
							<span id="user_email">${user_email}</span>
							<button id="editEmailBtn" type="button" class="editBtn">변경</button>
						</div>

						<div id="emailEditBox" style="display: none;">
							<input type="email" id="emailInput" placeholder="새 이메일을 입력해주세요">
							<button id="saveEmailBtn" type="button">저장</button>
							<button id="cancelEmailBtn" type="button">취소</button>
						</div>
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
	document.addEventListener("DOMContentLoaded", () => {

		// -----------------------------
		// 1️⃣ 기본 이동 및 캘린더 설정
		// -----------------------------
		document.querySelectorAll(".basicInfoBtn").forEach(btn => {
			btn.addEventListener("click", () => {
				window.location.href = "${pageContext.request.contextPath}/userdetail.do";
			});
		});
		
		document.querySelector(".homeBtn").addEventListener("click",()=>{
			window.location.href = "${pageContext.request.contextPath}/index.do";
		});

		// FullCalendar 초기화
		const calendarEl = document.getElementById('calendar');
		const calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
			height: 432,
			locale: 'ko',
			headerToolbar: {
				left: 'prev',
				center: 'title',
				right: 'next'
			},
			dayHeaderContent: (args) => {
				const days = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
				return days[args.date.getDay()];
			},
			events: [
				{ title: '스터디 모임', start: '2025-10-15' },
				{ title: '프로젝트 회의', start: '2025-10-18' },
				{ title: '팀 이벤트', start: '2025-10-21' }
			]
		});
		calendar.render();

		// -----------------------------
		// 2️⃣ 캘린더 박스 확장 토글
		// -----------------------------
		const studyScheduleBtn = document.querySelector('.studyScheduleBtn');
		const calendarBox = document.querySelector('.calander');
		const shortBoard = document.querySelector('.short_board');
		const studyAlarm = document.querySelector('.study_alram');
		let isExpanded = false;

		const calendarSize = (event) => {
			if (event.target.closest('.fc-prev-button') || event.target.closest('.fc-next-button')) return;

			if (!isExpanded) {
				shortBoard.classList.add('hidden-section');
				studyAlarm.classList.add('hidden-section');
				calendarBox.style.transition = 'height 0.55s cubic-bezier(0.4, 0, 0.2, 1)';
				calendarBox.style.height = '75vh';
				isExpanded = true;
			} else {
				calendarBox.style.transition = 'height 0.50s cubic-bezier(0.4, 0, 0.2, 1)';
				calendarBox.style.height = '12vh';
				setTimeout(() => {
					shortBoard.classList.remove('hidden-section');
					studyAlarm.classList.remove('hidden-section');
				}, 200);
				isExpanded = false;
			}
		};
		studyScheduleBtn.addEventListener('click', calendarSize);
		calendarBox.addEventListener('click', calendarSize);

		// -----------------------------
		// 3️⃣ 닉네임 & 이메일 수정 기능
		// -----------------------------
		const userNickname = document.getElementById('user_nickname');
		const editNicknameBtn = document.getElementById('editNicknameBtn');
		const nicknameEditBox = document.getElementById('nicknameEditBox');
		const nicknameInput = document.getElementById('nicknameInput');
		const saveNicknameBtn = document.getElementById('saveNicknameBtn');
		const cancelNicknameBtn = document.getElementById('cancelNicknameBtn');

		editNicknameBtn.addEventListener('click', () => {
			nicknameEditBox.style.display = 'block';
			nicknameInput.value = userNickname.textContent.trim();
			editNicknameBtn.style.display = 'none';
		});
		saveNicknameBtn.addEventListener('click', () => {
			const newNickname = nicknameInput.value.trim();
			if (newNickname === "") {
				alert("닉네임을 입력해주세요.");
				return;
			}
			userNickname.textContent = newNickname;
			fetch("${pageContext.request.contextPath}/updateNickname.do", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ nickname: newNickname })
			})
			.then(res => res.ok ? alert("닉네임이 수정되었습니다!") : alert("수정 실패"))
			.catch(() => alert("서버 오류가 발생했습니다."));
			nicknameEditBox.style.display = 'none';
			editNicknameBtn.style.display = 'inline-block';
		});
		cancelNicknameBtn.addEventListener('click', () => {
			nicknameEditBox.style.display = 'none';
			editNicknameBtn.style.display = 'inline-block';
		});

		// 이메일 수정
		const userEmail = document.getElementById('user_email');
		const editEmailBtn = document.getElementById('editEmailBtn');
		const emailEditBox = document.getElementById('emailEditBox');
		const emailInput = document.getElementById('emailInput');
		const saveEmailBtn = document.getElementById('saveEmailBtn');
		const cancelEmailBtn = document.getElementById('cancelEmailBtn');

		editEmailBtn.addEventListener('click', () => {
			emailEditBox.style.display = 'block';
			emailInput.value = userEmail.textContent.trim();
			editEmailBtn.style.display = 'none';
		});
		saveEmailBtn.addEventListener('click', () => {
			const newEmail = emailInput.value.trim();
			if (newEmail === "") {
				alert("이메일을 입력해주세요.");
				return;
			}
			userEmail.textContent = newEmail;
			fetch("${pageContext.request.contextPath}/updateEmail.do", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ email: newEmail })
			})
			.then(res => res.ok ? alert("이메일이 수정되었습니다!") : alert("수정 실패"))
			.catch(() => alert("서버 오류가 발생했습니다."));
			emailEditBox.style.display = 'none';
			editEmailBtn.style.display = 'inline-block';
		});
		cancelEmailBtn.addEventListener('click', () => {
			emailEditBox.style.display = 'none';
			editEmailBtn.style.display = 'inline-block';
		});

		// -----------------------------
		// 4️⃣ hover 애니메이션 (독립 작동)
		// -----------------------------
		const boxes = [
		  document.querySelector('.calander'),
		  document.querySelector('.short_board'),
		  document.querySelector('.study_alram'),
		  document.querySelector('.profile_category_line')
		];

		boxes.forEach(box => {
		  if (!box) return;
		  box.addEventListener('mouseover', (e) => {
		    e.stopPropagation();
		    e.currentTarget.classList.remove('lift-anim-down');
		    e.currentTarget.classList.add('lift-anim-up');
		  });
		  box.addEventListener('mouseout', (e) => {
		    e.stopPropagation();
		    e.currentTarget.classList.remove('lift-anim-up');
		    e.currentTarget.classList.add('lift-anim-down');
		  });
		});
	});
	</script>
</body>
</html>
