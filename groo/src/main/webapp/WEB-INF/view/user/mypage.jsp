<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
				<img class = "profileImage" src="./images/열공남.png">
				</div> <!-- 유저가 사진을 선택해서 넣을 수 있는 부분입니다. -->
				<div class="profile_nic">
					<p>nickname</p>
					<p>이메일</p>
				</div>
				<div class="category">
					<ul>
						<li class ="big_cate">내프로필</li>
						<li class ="big_cate">schedule
							<ul>
								<li>스터디 일정</li>
								<li>모임취소 요청하기</li>
							</ul>
						</li>
						<li class ="big_cate">나의 스터디
							<ul>
								<li>스터디상세보기</li>
								<li>스터디진행상황</li>
								<li>스터디 탈퇴</li>
							</ul>
						</li>
						<li class ="big_cate">나의 활동
							<ul>
								<li>나의 참석률현황판</li>
								<li>작성한리뷰목록(수정/조회/삭제)</li>
								<li>작성한게시글목록(수정/조회/삭제)</li>
							</ul>
						</li>
						<li class ="big_cate">팀찾기
						<ul>
						<li>신규 생성 스터디목록</li>
						<li>나의 관심 스터디 목록</li>
						</ul>
						</li>
						<li class ="big_cate">팀생성</li>
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
				<div class = "calander">그루캘린더</div>
				<div class ="short_board">나의 활동현황판</div>
				<div class = "study_alram">참여중인 스터디의 신규활동알림</div>
			</div>
			<div class="right_empty"></div>
		</div>
	</main>
</body>
</html>