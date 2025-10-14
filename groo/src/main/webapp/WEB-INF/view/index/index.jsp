<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/index.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>

<script>
	$(document).ready(function() {
		$('#hot-studies-carousel').slick({
			arrows : false,
			slidesToShow : 4,
			slidesToScroll : 1,
			infinite : false,
			speed : 500,
		});
	});
</script>

<style>
.header_container {
	display: flex; /* 자식 요소들을 가로로 배치 */
	justify-content: space-between; /* 요소들 사이에 최대 공간을 배분 */
	align-items: center; /* 요소들을 수직 중앙에 정렬 (선택 사항) */
	padding: 10px 20px; /* 헤더 좌우 여백 설정 */
}

/* 로고 */
.logo {
	width: 150px;
	margin: 5px;
}

/* 검색창을 감싸는 컨테이너 */
.search-container {
	display: flex;
	align-items: center;
	width: 600px;
	padding: 8px 15px;
	border: 2px solid #28a745;
	border-radius: 30px;
	margin: 10px;
}

/* 검색창 */
.search-input {
	border: none;
	outline: none;
	flex-grow: 1;
	padding: 5px;
	font-size: 15px;
}

/* 검색창 아이콘 */
.bi.bi-search {
	color: black;
}

/* nav, 계정목록 */
.accountmenu ul, .nav ul {
	list-style: none;
	display: flex;
	gap: 80px;
	margin: 10px;
}

/* nav, 계정목록 li */
.accountmenu li, .nav li {
	position: relative;
	color: black;
}

/* nav, 계정목록 리스트 효과 */
.accountmenu li::after, .nav li::after {
	content: "";
	position: absolute;
	left: 50%;
	bottom: 0;
	width: 0%;
	height: 2px;
	background-color: #28a745;
	transform: translateX(-50%);
	transition: width 0.3s ease;
}
/* nav, 계정목록 효과 넓이 */
.accountmenu li:hover::after, .nav li:hover::after {
	width: 100%;
}
/* 네비 글자크기 */
.nav li {
	font-size: 25px;
}

/* 계정목록 글자크기 */
.accountmenu ul {
	gap: 30px;
}

/*--------------------------------------------------------------------------------*/
/* Slick Carousel의 기본 여백/위치 조정 */
#hot-studies-carousel {
    margin: 0; /* 불필요한 상하좌우 마진 제거 */
    padding: 0; /* 불필요한 패딩 제거 */
}

/* 핫 스터디 섹션 */
.hot-studies-section {
    width: 90%; 
    margin: 40px auto;
    /* position: relative;  <-- 필요하다면 추가 (다른 요소와 겹침 방지) */
}

/* Slick이 생성하는 ul.slick-dots의 위치 조정 */
/* 페이지네이션 점이 카드 아래 중앙에 오도록 조정 */
.slick-dots {
    list-style: none;
    display: flex !important;
    justify-content: center;
    padding: 0;
    margin-top: 20px; /* 카드와 점 사이 간격 */
}

/* 검색창 컨테이너 하단 마진 제거 (캐러셀과 너무 떨어지는 것을 방지) */
.search-container {
    /* ... 기존 스타일 유지 ... */
    margin-bottom: 0; /* 하단 마진 제거 (필요하다면) */
}
/*--------------------------------------------------------------------------------*/
</style>
<body>
	<header class="header_container">
		<img class="logo" src="./images/로고.png">
		<div class="nav">
			<ul>
				<li>🔔 공지사항</li>
				<li>💬 자유게시판</li>
				<li>ℹ️ about us</li>
				<li>🏆 성과(전체)게시판</li>
				<li>✍️ 스터디 생성</li>
			</ul>
		</div>
		<div class="accountmenu">
			<ul>
				<li>Login</li>
				<li>SignUp</li>
			</ul>
		</div>
	</header>
	<div class="flex_container">
		<div class="search-container">
			<input type="text" class="search-input" placeholder="스터디를 검색하세요..."> <a href="http://www.naver.com"> <i class="bi bi-search"></i></a>
		</div>
	</div>
	<div class="flex_container">
		<section class="hot-studies-section">
			<h2>🔥 지금 뜨는 인기 스터디</h2>
			<div id="hot-studies-carousel">

				<div class="carousel-item">
					<div class="study-card">
						<h3>[모집] 자바 심화 프로젝트</h3>
						<p class="study-meta">💻 자바/스프링</p>
						<p>인원: 4/8명</p>
						<p class="like-count">❤️ 95</p>
					</div>
				</div>

				<div class="carousel-item">
					<div class="study-card">
						<h3>1일 1문제! 알고리즘 정복</h3>
						<p class="study-meta">🧠 알고리즘/코딩 테스트</p>
						<p>인원: 7/10명</p>
						<p class="like-count">❤️ 88</p>
					</div>
				</div>

				<div class="carousel-item">
					<div class="study-card">
						<h3>토익 스피킹 2주 완성</h3>
						<p class="study-meta">📚 외국어/영어</p>
						<p>인원: 3/5명</p>
						<p class="like-count">❤️ 71</p>
					</div>
				</div>

				<div class="carousel-item">
					<div class="study-card">
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
						<h3>SQLD 자격증 준비</h3>
						<p class="study-meta">📊 데이터베이스</p>
						<p>인원: 5/7명</p>
						<p class="like-count">❤️ 52</p>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>