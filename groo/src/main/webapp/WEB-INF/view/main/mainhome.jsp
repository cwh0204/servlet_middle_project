<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="js/slick.min.js"></script>
<script
	src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="js/main/main.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="flex_container">
		<div class="search-container">
			<input type="text" class="search-input" placeholder="스터디를 검색하세요...">
			<a href="http://www.naver.com"> <i class="bi bi-search"></i></a>
		</div>
		<div class="member-info"></div>
	</div>
	<div class="main">
		<div class="flex_container">
			<section class="hot-studies-section">
				<h2>🔥 지금 뜨는 인기 스터디</h2>
				<div id="hot-studies-carousel">

					<div class="carousel-item">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy1.png"
								alt="자바 스터디 이미지">
							<h3>[모집] 자바 심화 프로젝트</h3>
							<p class="study-meta">💻 자바/스프링</p>
							<p>인원: 4/8명</p>
							<p class="like-count">❤️ 95</p>
						</div>
					</div>

					<div class="carousel-item">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy2.png"
								alt="자바 스터디 이미지">
							<h3>1일 1문제! 알고리즘 정복</h3>
							<p class="study-meta">🧠 알고리즘/코딩 테스트</p>
							<p>인원: 7/10명</p>
							<p class="like-count">❤️ 88</p>
						</div>
					</div>

					<div class="carousel-item">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy3.png"
								alt="자바 스터디 이미지">
							<h3>토익 스피킹 2주 완성</h3>
							<p class="study-meta">📚 외국어/영어</p>
							<p>인원: 3/5명</p>
							<p class="like-count">❤️ 71</p>
						</div>
					</div>

					<div class="carousel-item">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy4.png"
								alt="자바 스터디 이미지">
							<h3>React & TypeScript 실습</h3>
							<p class="study-meta">🖥️ 프론트엔드</p>
							<p>
								인원: 6/6명 <span style="color: red; font-weight: bold;">(마감)</span>
							</p>
							<p class="like-count">❤️ 65</p>
						</div>
					</div>

					<div class="carousel-item">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy5.png"
								alt="자바 스터디 이미지">
							<h3>SQLD 자격증 준비</h3>
							<p class="study-meta">📊 데이터베이스</p>
							<p>인원: 5/7명</p>
							<p class="like-count">❤️ 52</p>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="flex_container">
			<section class="active-studies-section">
				<h2>🏃 활동중인 스터디</h2>

				<div id="active-studies-grid" class="active-grid">

					<div class="active-grid-sizer"></div>

					<div class="active-grid-item">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy1.png"
								alt="신규 스터디 이미지"> <span class="study-title">[신규]
								Vue.js & Nuxt 기초</span> <span class="study-meta">🖥️ 프론트엔드</span> <span
								class="study-members">인원: 1/5명</span>
							<p style="font-size: 0.8em; margin-top: 5px;">*스터디 개설 1시간 전*</p>
							<span class="like-count">❤️ 3</span>
						</div>
					</div>

					<div class="active-grid-item">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy1.png"
								alt="신규 스터디 이미지"> <span class="study-title">비전공자를
								위한 Python</span> <span class="study-meta">🐍 백엔드/데이터</span> <span
								class="study-members">인원: 2/6명</span> <span class="like-count">❤️
								7</span>
						</div>
					</div>

					<div class="active-grid-item" style="height: 350px;">
						<div class="study-card">
							<img class="study-image" src="images/hotstudy1.png"
								alt="신규 스터디 이미지"> <span class="study-title">CS 지식
								면접 대비반 (네트워크, OS)</span> <span class="study-meta">📚 CS/면접</span>
							<p>매주 토요일 오후 3시 온라인 진행. 기술 면접에서 자주 나오는 핵심 질문을 중심으로 2개월간
								운영됩니다.</p>
							<span class="study-members">인원: 5/10명</span> <span
								class="like-count">❤️ 12</span>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>