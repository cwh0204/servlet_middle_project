<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/main.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
</head>

<script>
/* HotStudy carousel 라이브러리 */
$(document).ready(function() {		
	
	$.ajax({
        url:"MemberSelectImplAPI.do", 
        type: "GET",
        dataType: "json",
        success: function(response) {
            console.log("로그인 정보 : ", response);
            
            // 💡 response.userName도 세션에 저장했다면 추가하여 사용하세요.
            if (response.userId != null) {
                const currentUserName = response.userName || response.userId;
                $('.member-info p').text(currentUserName + '님 환영합니다.');
            } else {
                $('.member-info p').text('로그인 해주세요.');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // alert("Ajax 실패!"); // 디버깅 완료 후 제거
            console.error("ID 로드 실패:", textStatus, errorThrown);
            $('.member-info p').text('정보 로딩에 실패했습니다.');
        }
    });
	
    // Slick Carousel 초기화
    $('#hot-studies-carousel').slick({
        arrows: false,
        draggable: true,
        swipe: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: false, // 번호 제거
        infinite: false,
        speed: 500,
    });
    
    // Masonry 초기화 (활동중인 스터디)
    /* 💡 수정된: 활동중인 스터디 (Masonry) 초기화 코드 */
    var activeGrid = document.querySelector('#active-studies-grid'); // ID 변경
    
    if (activeGrid) {
        setTimeout(function() {
            var msnry = new Masonry(activeGrid, {
                itemSelector: '.active-grid-item',  // 아이템 클래스 변경
                columnWidth: '.active-grid-sizer', // 크기 요소 클래스 변경
                percentPosition: true,
                gutter: 0                        
            });
        }, 500);
    }
});
</script>

<style>
/* header_container */
/* .header_container {
	display: flex; /* 자식 요소들을 가로로 배치 */
	justify-content: space-between; /* 요소들 사이에 최대 공간을 배분 */
	align-items: center; /* 요소들을 수직 중앙에 정렬 (선택 사항) */
	padding: 10px 20px; /* 헤더 좌우 여백 설정 */
}

/* 로고 */
.logo {
	width: 150px;
	margin: 5px;
} */

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

/* 핫스터디 h2 */
.hot-studies-section h2 {
	text-align: left;
	margin-bottom: 20px;
}

/*slick 라이브러리*/
/*--------------------------------------------------------------------------------*/
/* Slick Carousel의 기본 여백/위치 조정 */

/* 핫 스터디 섹션 */
.hot-studies-section {
	width: 90%;
	margin: 40px auto;
}

/* Slick이 생성하는 ul.slick-dots의 위치 조정 */
/* 페이지네이션 점이 카드 아래 중앙에 오도록 조정 */
.slick-dots {
	list-style: none;
	display: flex !important;
	justify-content: center;
	margin-top: 20px; /* 카드와 점 사이 간격 */
}

/* 검색창 컨테이너 하단 마진 제거 (캐러셀과 너무 떨어지는 것을 방지) */
.search-container {
	margin-top: 30px;
}

/*--------------------------------------------------------------------------------*/
/* 💡 활동중인 스터디 섹션 스타일 (수정) */
.active-studies-section {
	width: 90%;
	margin: 40px auto;
}

.active-studies-section h2 {
	text-align: left;
	margin-bottom: 20px;
	color: #333;
}

/* 💡 Masonry 그리드 컨테이너 */
.active-grid {
	/* Masonry는 float 기반으로 작동합니다. */
	
}

/* 💡 그리드 아이템의 너비 설정 (한 줄에 4개 표시) */
.active-grid-sizer, .active-grid-item {
	width: 25%; /* 한 줄에 4개 */
}

/* 💡 그리드 아이템 내부 여백 및 박스 모델 설정 */
.active-grid-item {
	box-sizing: border-box;
	padding: 10px; /* 아이템 주변 여백 */
	/* Masonry가 위치를 조정할 때 부드러운 애니메이션 효과를 위해 추가 */
	transition: opacity 0.4s, transform 0.4s;
}
</style>
<body>
	<%@ include file="../frontComponents/mainheader.jsp"%>
	<div class="flex_container">
		<div class="search-container">
			<input type="text" class="search-input" placeholder="스터디를 검색하세요..."> <a href="http://www.naver.com"> <i class="bi bi-search"></i></a>
		</div>
		<div class="member-info">
		<p></p>
		</div>
	</div>
	<div class="flex_container">
		<section class="hot-studies-section">
			<h2>🔥 지금 뜨는 인기 스터디</h2>
			<div id="hot-studies-carousel">

				<div class="carousel-item">
					<div class="study-card">
						<img class="study-image" src="images/hotstudy1.png" alt="자바 스터디 이미지">
						<h3>[모집] 자바 심화 프로젝트</h3>
						<p class="study-meta">💻 자바/스프링</p>
						<p>인원: 4/8명</p>
						<p class="like-count">❤️ 95</p>
					</div>
				</div>

				<div class="carousel-item">
					<div class="study-card">
						<img class="study-image" src="images/hotstudy2.png" alt="자바 스터디 이미지">
						<h3>1일 1문제! 알고리즘 정복</h3>
						<p class="study-meta">🧠 알고리즘/코딩 테스트</p>
						<p>인원: 7/10명</p>
						<p class="like-count">❤️ 88</p>
					</div>
				</div>

				<div class="carousel-item">
					<div class="study-card">
						<img class="study-image" src="images/hotstudy3.png" alt="자바 스터디 이미지">
						<h3>토익 스피킹 2주 완성</h3>
						<p class="study-meta">📚 외국어/영어</p>
						<p>인원: 3/5명</p>
						<p class="like-count">❤️ 71</p>
					</div>
				</div>

				<div class="carousel-item">
					<div class="study-card">
						<img class="study-image" src="images/hotstudy4.png" alt="자바 스터디 이미지">
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
						<img class="study-image" src="images/hotstudy5.png" alt="자바 스터디 이미지">
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
						<img class="study-image" src="images/hotstudy1.png" alt="신규 스터디 이미지"> <span class="study-title">[신규] Vue.js & Nuxt 기초</span> <span class="study-meta">🖥️ 프론트엔드</span> <span class="study-members">인원: 1/5명</span>
						<p style="font-size: 0.8em; margin-top: 5px;">*스터디 개설 1시간 전*</p>
						<span class="like-count">❤️ 3</span>
					</div>
				</div>

				<div class="active-grid-item">
					<div class="study-card">
						<img class="study-image" src="images/hotstudy1.png" alt="신규 스터디 이미지"> <span class="study-title">비전공자를 위한 Python</span> <span class="study-meta">🐍 백엔드/데이터</span> <span class="study-members">인원: 2/6명</span> <span class="like-count">❤️ 7</span>
					</div>
				</div>

				<div class="active-grid-item" style="height: 350px;">
					<div class="study-card">
						<img class="study-image" src="images/hotstudy1.png" alt="신규 스터디 이미지"> <span class="study-title">CS 지식 면접 대비반 (네트워크, OS)</span> <span class="study-meta">📚 CS/면접</span>
						<p>매주 토요일 오후 3시 온라인 진행. 기술 면접에서 자주 나오는 핵심 질문을 중심으로 2개월간 운영됩니다.</p>
						<span class="study-members">인원: 5/10명</span> <span class="like-count">❤️ 12</span>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>