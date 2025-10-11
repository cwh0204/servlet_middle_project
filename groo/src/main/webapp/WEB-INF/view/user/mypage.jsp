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
						<li>schedule
							<ul>
								<li>스터디 일정보기</li>
								<li>출석기록보기</li>
								<li>스터디탈퇴</li>
							</ul>
						</li>
						<li>내가속한스터디목록보기
							<ul>
								<li>스터디상세보기</li>
								<li></li>
							</ul>
						</li>
						<li>팀찾기</li>
						<li>팀생성</li>
						<li>나의 활동
							<ul>
								<li>작성한게시글목록</li>
								<li>작성한리뷰목록</li>
								<li>스터디참석율현황</li>
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
			</div>
			<div class="right_empty"></div>
		</div>
	</main>
</body>
</html>