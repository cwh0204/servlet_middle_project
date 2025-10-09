$(document).ready(function() {
<<<<<<< HEAD
    // 이 안에 AJAX 코드를 작성
	ajax();
	roll();
	roll1();
});


ajax = () => {
	 $.ajax({
	    url: "/groo/indexs.do",
	    type: "GET",
	    dataType: "json",
	    success: function(data) {
	        console.log(data);
	         for (let i = 0; i < data.length; i++) {
	            const team = data[i];
	            console.log("팀 이름:", team.teamName);
	            console.log("팀장 이름:", team.userId);
	            console.log("팀 설명:", team.teamInfo);
	        }
	    },
	    error: function(xhr, status, error) {
	        console.error("오류 발생:", status, error);
	    }
	});
}

roll = () =>{
	const $postList = $('#popular-posts');
	    const $container = $postList.parent('.hotboard-marquee-wrap');

	    // 항목 높이 측정
	    const $firstItem = $postList.children('li').first();
	    if ($firstItem.length === 0) return; 
	    const itemHeight = $firstItem.outerHeight(true);
	    
	    // 내용 복제
	    const originalContent = $postList.html();
	    $postList.append(originalContent);
	    const originalItemCount = $postList.children('li').length / 2;

	    // 🚨 핵심 수정: 타이머 변수 선언
	    let scrollTimer; 
	    
	    let currentPosition = 0;
	    let postIndex = 0;
	    let isPaused = false;
	    
	    // 스크롤 설정값
	    const scrollSpeed = 1;      
	    const scrollInterval = 60; // 🚨 이 값을 60ms ~ 80ms로 설정해 속도를 조절하세요.
	    const pauseDuration = 2500; 
	    
	    // ==========================================================
	    // 1. 스크롤 로직 함수 (반복 실행될 내용)
	    // ==========================================================
	    function scrollTick() {
	        if (isPaused) {
	            return; // 멈춤 상태일 때는 아무것도 하지 않고 함수 종료
	        }

	        // 스크롤 (top 값을 감소시킵니다)
	        currentPosition -= scrollSpeed;
	        $postList.css('top', currentPosition + 'px');

	        // 한 항목이 이동을 완료했는지 체크
	        if (Math.abs(currentPosition) >= itemHeight * (postIndex + 1)) {
	            
	            // 🚨 일시 정지 로직 시작
	            isPaused = true;
	            postIndex++;

	            // 원본 목록 전체를 모두 스크롤했을 경우 리셋
	            if (postIndex >= originalItemCount) {
	                currentPosition = 0;
	                $postList.css('top', '0px');
	                postIndex = 0;
	            }

	            // 🚨 멈춤: 현재 interval 타이머를 멈춥니다.
	            clearInterval(scrollTimer); 
	            
	            // 정지 시간 후 다시 스크롤 시작 (setTimeout 사용)
	            setTimeout(() => {
	                isPaused = false;
	                // 🚨 재시작: 일정 시간 후 interval 타이머를 다시 시작합니다.
	                startScrolling();
	            }, pauseDuration);
	        }
	    }
	    
	    // ==========================================================
	    // 2. 스크롤 시작 및 중지 제어 함수
	    // ==========================================================
	    function startScrolling() {
	        // 🚨 기존 타이머가 있다면 확실하게 제거하고 새로 시작
	        if (scrollTimer) {
	            clearInterval(scrollTimer);
	        }
	        // 🚨 setInterval로 스크롤 함수를 반복 실행
	        scrollTimer = setInterval(scrollTick, scrollInterval);
	    }

	    function stopScrolling() {
	        clearInterval(scrollTimer);
	    }

	    // ==========================================================
	    // 3. 이벤트 핸들러 및 초기 시작
	    // ==========================================================

	    // 마우스 오버 시 멈추는 기능
	    $container.on('mouseenter', function() {
	        isPaused = true;
	        stopScrolling(); // 🚨 마우스 오버 시 즉시 정지
	    });

	    $container.on('mouseleave', function() {
	        isPaused = false;
	        startScrolling(); // 🚨 마우스 리브 시 다시 시작
	    });

	    // 🚨 초기 스크롤 시작
	    startScrolling();
}

roll1 = () => {
	const scrollSpeed = 1;      
	    const scrollInterval = 60; 
	    const pauseDuration = 2500; 

	    // ==========================================================
	    // 🚨 핵심 수정: 스크롤 로직을 범용 함수로 만듭니다.
	    // ==========================================================
	    function setupMarquee(listSelector, containerSelector) {
	        const $postList = $(listSelector);
	        const $container = $(containerSelector); 
	        
	        if ($postList.length === 0) return;

	        const $firstItem = $postList.children('li').first();
	        if ($firstItem.length === 0) return; 

	        const itemHeight = $firstItem.outerHeight(true);
	        const originalContent = $postList.html();
	        $postList.append(originalContent);
	        const originalItemCount = $postList.children('li').length / 2;

	        let scrollTimer; 
	        let currentPosition = 0;
	        let postIndex = 0;
	        let isPaused = false;
	        
	        // ... (scrollTick, startScrolling, stopScrolling 함수는 기존 내용 그대로 복사/붙여넣기) ...
	        
	        // --- (기존 setInterval 로직 함수 시작) ---
	        function scrollTick() {
	            if (isPaused) return; 

	            currentPosition -= scrollSpeed;
	            $postList.css('top', currentPosition + 'px');
=======
    
    // ==========================================================
    // 슬라이더 설정값 (전역 설정)
    // ==========================================================
    const SLIDE_DURATION = 5000; // 5초마다 자동 이동
    
    // ==========================================================
    // 1. 순수 JS 슬라이더 로직 함수 정의 (자동 재생 전용)
    // 🚨 이 부분이 이전 코드에서 빠져 있었습니다. 🚨
    // ==========================================================
    function initCustomSlider(listSelector) {
        let currentSlide = 0;
        let slideCount;
        let sliderTimer;
        
        const $sliderList = $(listSelector);
        const $sliderContainer = $sliderList.closest('.hotstudy');
        
        // 슬라이드 개수 확인
        slideCount = $sliderList.children('.slide-item').length;
        if (slideCount <= 1) return; // 슬라이드가 1개 이하면 작동 불필요

        // <ul> 요소의 총 너비를 설정 (핵심)
        $sliderList.css('width', (slideCount * 100) + '%');

        // --- 슬라이드 이동 함수 ---
        function moveSlide(direction) {
            stopAutoSlide();
            
            currentSlide += direction; 
            
            // 무한 루프 처리
            if (currentSlide >= slideCount) {
                currentSlide = 0;
            } else if (currentSlide < 0) {
                 currentSlide = slideCount - 1; 
            }
            
            // CSS transform을 사용하여 슬라이드를 이동
            $sliderList.css('transform', `translateX(${currentSlide * -100}%)`); 
            
            startAutoSlide();
        }
        
        // --- 자동 재생 및 정지 함수 ---
        function startAutoSlide() {
            if (sliderTimer) clearInterval(sliderTimer);
            sliderTimer = setInterval(() => {
                moveSlide(1); // 다음 슬라이드로 자동 이동
            }, SLIDE_DURATION);
        }

        function stopAutoSlide() {
            clearInterval(sliderTimer);
        }

        // --- 이벤트 핸들러 (마우스 오버 정지/재개) ---
        $sliderContainer.on('mouseenter', stopAutoSlide);
        $sliderContainer.on('mouseleave', startAutoSlide);
        
        // 초기 자동 슬라이드 시작
        startAutoSlide();
    }
    
    // ==========================================================
    // 2. AJAX 통신 및 슬라이드 생성 로직
    // ==========================================================
    
    function createHotStudySlides(data) {
	    const $list = $('#hot-study-list');
	    $list.empty(); 
	    
	    let html = '';
	    data.forEach((team, index) => {
	        const title = team.teamName || '새로운 스터디';
	        const info = team.teamInfo ? team.teamInfo.substring(0, 150) + '...' : '스터디 설명이 없습니다.';
	        const imageUrl = `https://via.placeholder.com/600x400?text=${encodeURIComponent(title)}`; 
	        
	        html += `
	            <li class="slide-item">
	                <img src="${imageUrl}" alt="${title}">
	                <div class="slide-content">
	                    <h3>${title} (팀장: ${team.userId})</h3>
	                    <p>${info}</p>
	                    <a href="/groo/teamDetail.do?teamId=${team.teamId}" class="btn-detail">자세히 보기</a>
	                </div>
	            </li>
	        `;
	    });
	    
	    $list.append(html);
	}

    // AJAX 호출
    $.ajax({
        url: "/groo/indexs.do",
        type: "GET",
        dataType: "json",
        success: function(data) {
            console.log("AJAX 데이터 수신 완료:", data);
            
            if (data && data.length > 0) {
                createHotStudySlides(data);
            } else {
                // 데이터가 비어 있을 경우, 미리 작성된 HTML(2개 예시)로 마퀴를 구동합니다.
                console.log("AJAX 데이터가 비어 있어 미리 작성된 슬라이드로 초기화합니다.");
            }
            
            // 🚨 AJAX 성공 후 슬라이더 초기화
            initCustomSlider('#hot-study-list');
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류 발생:", status, error);
            
            // 🚨 AJAX 오류 시 미리 작성된 HTML 콘텐츠로 슬라이더를 초기화합니다.
            initCustomSlider('#hot-study-list');
        }
    });

    // ==========================================================
    // 3. 마퀴 스크롤 기능 (핫 보드 및 파인드)
    // ==========================================================
    
    const SCROLL_SPEED = 1;      
    const SCROLL_INTERVAL = 60; 
    const PAUSE_DURATION = 2500; 

    function setupMarquee(listSelector, containerSelector) {
        const $postList = $(listSelector);
        const $container = $(containerSelector); 
        
        if ($postList.length === 0 || $postList.children('li').length === 0) return;

        const $firstItem = $postList.children('li').first();
        const itemHeight = $firstItem.outerHeight(true);
        
        const originalContent = $postList.html();
        $postList.append(originalContent);
        const originalItemCount = $postList.children('li').length / 2;

        let scrollTimer; 
        let currentPosition = 0;
        let postIndex = 0;
        let isPaused = false;
        
        // --- 핵심 로직 함수 정의 ---
        
        function scrollTick() {
            if (isPaused) return; 

            currentPosition -= SCROLL_SPEED;
            $postList.css('top', currentPosition + 'px');
>>>>>>> 7e75299bb0d7eea5bb704d2fd0afd29281789190

	            if (Math.abs(currentPosition) >= itemHeight * (postIndex + 1)) {
	                
	                isPaused = true;
	                postIndex++;

	                if (postIndex >= originalItemCount) {
	                    currentPosition = 0;
	                    $postList.css('top', '0px');
	                    postIndex = 0;
	                }

<<<<<<< HEAD
	                clearInterval(scrollTimer); 
	                
	                setTimeout(() => {
	                    isPaused = false;
	                    startScrolling();
	                }, pauseDuration);
	            }
	        }
	        
	        function startScrolling() {
	            if (scrollTimer) {
	                clearInterval(scrollTimer);
	            }
	            scrollTimer = setInterval(scrollTick, scrollInterval);
	        }

	        function stopScrolling() {
	            clearInterval(scrollTimer);
	        }
	        // --- (기존 setInterval 로직 함수 끝) ---
=======
                clearInterval(scrollTimer); 
                
                setTimeout(() => {
                    isPaused = false;
                    startScrolling();
                }, PAUSE_DURATION);
            }
        }
        
        function startScrolling() {
            if (scrollTimer) clearInterval(scrollTimer);
            scrollTimer = setInterval(scrollTick, SCROLL_INTERVAL);
        }

        function stopScrolling() {
            clearInterval(scrollTimer);
        }
>>>>>>> 7e75299bb0d7eea5bb704d2fd0afd29281789190

        // --- 이벤트 핸들러 ---
        
        $container.on('mouseenter', stopScrolling);
        $container.on('mouseleave', startScrolling);

<<<<<<< HEAD
	        // 이벤트 핸들러
	        $container.on('mouseenter', function() {
	            isPaused = true;
	            stopScrolling(); 
	        });

	        $container.on('mouseleave', function() {
	            isPaused = false;
	            startScrolling(); 
	        });

	        // 초기 시작
	        startScrolling();
	    }

	    // ==========================================================
	    // 🚨 두 영역에 스크롤 기능 적용
	    // ==========================================================
	    setupMarquee('#popular-posts', '.hotboard-marquee-wrap');
	    setupMarquee('#find-posts', '.find-marquee-wrap'); // 🚨 find 영역에도 적용!
}
=======
        // 초기 스크롤 시작
        startScrolling();
    } 

    // 마퀴 기능 적용 (핫 보드 및 파인드)
    setupMarquee('#popular-posts', '.hotboard-marquee-wrap');
    setupMarquee('#find-posts', '.find-marquee-wrap');
});
>>>>>>> 7e75299bb0d7eea5bb704d2fd0afd29281789190
