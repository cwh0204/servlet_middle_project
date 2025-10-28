<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team create</title>

<!-- Bootstrap & jQuery -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<!-- Custom CSS -->
<link href="css/base.css" rel="stylesheet">
<link href="css/teamcreate.css" rel="stylesheet">
<link href="css/datepicker-custom.css" rel="stylesheet">
</head>
<body>
<main>
	<form action="teamcreate" method="post">
		<div class="form-container">
			<div class="form-box">
				<div class="form-header">
					<h2 class="form-title">스터디 팀 생성</h2>
				</div>
				
				<div class="category_container">
					<div class="studyTitle_box section-card">
						<div class="label-wrapper">
							<span class="label-icon">📚</span>
							<label>스터디명</label>
						</div>
						<input type="text" name="teamName" class="teamName" placeholder="스터디명을 입력해주세요">
					</div>

					<div class="teamCategory_box section-card">
						<div class="label-wrapper">
							<span class="label-icon">🎯</span>
							<label>개설 스터디 분야</label>
						</div>
						<div class="category-section">
							<div class="category-box">
								<div class="category-title">
									
									<span>지식 & 비즈니스</span>
								</div>
								<div class="subcategory-group">
									<input type="radio" id="finance" name="studyField" value="경영"><label for="finance">경영</label>
									<input type="radio" id="marketing" name="studyField" value="마케팅"><label for="marketing">마케팅</label>
									<input type="radio" id="psychology" name="studyField" value="심리"><label for="psychology">심리</label>
									<input type="radio" id="language" name="studyField" value="외국어"><label for="language">외국어</label>
									<input type="radio" id="management" name="studyField" value="재테크"><label for="management">재테크</label>
								</div>
							</div>

							<div class="category-box">
								<div class="category-title">
									
									<span>예술 & 창작</span>
								</div>
								<div class="subcategory-group">
									<input type="radio" id="architecture" name="studyField" value="건축"><label for="architecture">건축</label>
									<input type="radio" id="design" name="studyField" value="디자인"><label for="design">디자인</label>
									<input type="radio" id="art" name="studyField" value="미술"><label for="art">미술</label>
									<input type="radio" id="photo" name="studyField" value="사진"><label for="photo">사진</label>
									<input type="radio" id="music" name="studyField" value="음악"><label for="music">음악</label>
								</div>
							</div>

							<div class="category-box">
								<div class="category-title">
								
									<span>개발 & IT</span>
								</div>
								<div class="subcategory-group">
									<input type="radio" id="game" name="studyField" value="게임 개발"><label for="game">게임 개발</label>
									<input type="radio" id="app" name="studyField" value="앱 개발"><label for="app">앱 개발</label>
									<input type="radio" id="web" name="studyField" value="웹 개발"><label for="web">웹 개발</label>
									<input type="radio" id="security" name="studyField" value="정보보안"><label for="security">정보보안</label>
									<input type="radio" id="ai" name="studyField" value="AI"><label for="ai">AI</label>
								</div>
							</div>

							<div class="category-box">
								<div class="category-title">
									
									<span>보건 & 의료</span>
								</div>
								<div class="subcategory-group">
									<input type="radio" id="nursing" name="studyField" value="간호"><label for="nursing">간호</label>
									<input type="radio" id="healthAdmin" name="studyField" value="보건행정"><label for="healthAdmin">보건행정</label>
									<input type="radio" id="bio" name="studyField" value="생명과학"><label for="bio">생명과학</label>
									<input type="radio" id="pharmacy" name="studyField" value="약학"><label for="pharmacy">약학</label>
									<input type="radio" id="rehab" name="studyField" value="재활"><label for="rehab">재활</label>
								</div>
							</div>
						</div>
					</div>

					<div class="bottom-section">
						<div class="left-column">
							<div class="date_box section-card">
								<div class="label-wrapper">
									<span class="label-icon">📅</span>
									<label>스터디 기간</label>
								</div>
								<div class="input-group input-daterange" id="teamDateRange">
									<input type="text" class="form-control datepicker-input" name="startDate" placeholder="시작일" readonly>
									<span class="date-separator">→</span>
									<input type="text" class="form-control datepicker-input" name="endDate" placeholder="종료일" readonly>
								</div>
							</div>

							<div class="membercount_box section-card">
								<div class="label-wrapper">
									<span class="label-icon">👥</span>
									<label for="teamMember">모집인원</label>
								</div>
								<select name="teamMember" id="teamMember" class="form-select">
									<option value="" disabled selected>모집인원을 선택하세요</option>
									<option value="2명">2명</option>
									<option value="3명">3명</option>
									<option value="4명">4명</option>
									<option value="5명">5명</option>
									<option value="6명">6명</option>
									<option value="7명 이상">7명 이상</option>
								</select>
							</div>

							<div class="pw_box section-card">
								<div class="pw_label_wrapper">
									<div class="label-wrapper">
										<span class="label-icon">🔒</span>
										<label>비밀번호</label>
									</div>
									<div class="checkbox_wrapper">
										<input type="checkbox" id="pwCheckbox" class="pw_checkbox">
										<label for="pwCheckbox" class="checkbox_label"></label>
									</div>
								</div>
								<input type="text" name="teampw" id="teampw" class="teampw" placeholder="선택사항입니다">
							</div>
						</div>

						<div class="right-column">
							<div class="studycontent_box section-card">
								<div class="label-wrapper">
									<span class="label-icon">📝</span>
									<label>스터디 소개</label>
								</div>
								<textarea name="teamInfo" class="teamInfo" placeholder="스터디를 소개해주세요!&#10;&#10;예시)&#10;• 목표&#10;• 방식&#10;"></textarea>
							</div>
						</div>
					</div>

					<div class="button-group">
						<button type="submit" class="btn btn-primary submit-btn">
							<span class="btn-text">팀 생성하기</span>
							<span class="btn-arrow">→</span>
						</button>
						<button type="reset" class="btn btn-secondary reset-btn">
							<span class="btn-text">돌아가기</span>
							<i class="bi bi-arrow-counterclockwise"></i>
						</button>	
					</div>
				</div>
			</div>
		</div>
	</form>
</main>

<script src="js/teamCreate.js"></script>
</body>
</html>