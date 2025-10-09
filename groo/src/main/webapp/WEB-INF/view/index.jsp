<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userId = (String) session.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/index.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/index.js"></script>
</head>
<body>
	<header>
		<img src="./images/로고.png" class="logo_img"> <a href="/logout">
			<i class="bi bi-box-arrow-right"></i>
		</a>
	</header>
	<div class="nevi">
		<ul class="nav nav-fill">
			<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
			<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="#">QNA</a></li>
			<li class="nav-item"><a class="nav-link" href="#">미정</a></li>
		</ul>
	</div>
	<div class=container>
		<div class=leftbox>
			<div class="upbox flex_container">
				<img src="./images/열공남.png"> <i
					class="bi bi-person-fill-check"><strong> 스터디를 만들어요!</strong></i>
				<button type="button" class="btn btn-outline-success">스터디
					생성</button>
				<img src="./images/열공녀.png"> <i class="bi bi-people-fill"><strong>
						스터디에 가입해봐요!</strong></i>
				<button type="button" class="btn btn-outline-warning">스터디
					찾기</button>
			</div>
			<div class="downbox flex_container">
				<strong>님의 스터디 목록</strong>
				<ul class="list-group">
					<li class="list-group-item list-group-item-primary"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-secondary"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-success"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-danger"><a href="#">팀
							목록</a></li>
					<li class="list-group-item list-group-item-warning"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-info"><a href="#">팀
							목록</a></li>
					<li class="list-group-item list-group-item-light"><a href="#">팀
							목록</a></li>
					<li class="list-group-item list-group-item-dark"><a href="#">팀
							목록</a></li>
				</ul>
			</div>
		</div>
		<div class="centerbox">
			<div class="study">
				<div class=hotstudy>
					<h3>🔥 인기 스터디</h3>
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="..." class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="..." class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="..." class="d-block w-100" alt="...">
							</div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
						</button>
					<h3 class="hotstudy-title">🔥 인기 스터디</h3>
					<div class="slider-wrapper">
						<ul id="hot-study-list">
							<li class="slide-item"><img
								src="https://via.placeholder.com/600x400?text=자바스크립트+스터디"
								alt="스터디 이미지: 자바스크립트 기본">
								<div class="slide-content">
									<h3>프론트엔드 기초 다지기 (팀장: user123)</h3>
									<p>내용 요약: 기초부터 탄탄하게 JavaScript, HTML, CSS를 학습합니다. 주 2회
										온라인으로 진행되며, 포트폴리오 프로젝트 완성이 목표입니다.</p>
									<a href="/groo/teamDetail.do?teamId=100" class="btn-detail">자세히
										보기</a>
								</div></li>
							<li class="slide-item"><img
								src="https://via.placeholder.com/600x400?text=백엔드+API+개발"
								alt="스터디 이미지: 스프링부트">
								<div class="slide-content">
									<h3>Spring Boot를 활용한 RESTful API 개발 (팀장: king_dev)</h3>
									<p>내용 요약: Spring Boot와 JPA를 활용하여 백엔드 서버를 구축합니다. 실무에서 필요한
										인증/인가 및 배포 과정을 함께 경험합니다.</p>
									<a href="/groo/teamDetail.do?teamId=101" class="btn-detail">자세히
										보기</a>
								</div></li>
						</ul>
					</div>
				</div>
				<div class=newstudy>
					<h3>✨ 최신 개설 스터디</h3>
					<div class="newstudy-card-list">
						<div class="study-card">
							<h4>[Java] 백엔드 심화반</h4>
							<p class="tag">[모집중] #Spring #JPA</p>
							<p class="date">🗓️ 2025.10.01 개설</p>
							<a href="#">바로가기</a>
						</div>
						<div class="study-card">
							<h4>[디자인] UI/UX 포폴반</h4>
							<p class="tag">[모집중] #Figma #UX</p>
							<p class="date">🗓️ 2025.09.28 개설</p>
							<a href="#">바로가기</a>
						</div>
						<div class="study-card">
							<h4>[알고리즘] 코딩 테스트 대비</h4>
							<p class="tag">[마감임박] #PS #Python</p>
							<p class="date">🗓️ 2025.10.03 개설</p>
							<a href="#">바로가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="board">
			<div class="marquee-guide-text">📢 GROO의 가장 핫한 글을 확인하세요!</div>
			<div class=hotboard>
				<div class="hotboard-marquee-wrap">
					<ul id="popular-posts">
						<li>인기글 제목 1</li>
						<li>인기글 제목 2</li>
						<li>인기글 제목 3</li>
						<li>인기글 제목 4</li>
						<li>인기글 제목 5</li>
					</ul>
				</div>
			</div>
			<div class="find-guide-text marquee-guide-text">💡 새로운 스터디원을
				찾습니다!</div>
			<div class=find>
				<div class="find-marquee-wrap">
					<ul id="find-posts">
						<li>찾는 멤버 목록 1</li>
						<li>찾는 멤버 목록 2</li>
						<li>찾는 멤버 목록 3</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>