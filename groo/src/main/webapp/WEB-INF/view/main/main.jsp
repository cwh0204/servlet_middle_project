<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/main.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script
	src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
</head>

<script>
<<<<<<< HEAD
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
	<main>
		<%@ include file="./mainhome.jsp"%>
	</main>
</body>
</html>