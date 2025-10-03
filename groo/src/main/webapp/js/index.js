$(document).ready(function() {
    
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

            if (Math.abs(currentPosition) >= itemHeight * (postIndex + 1)) {
                
                isPaused = true;
                postIndex++;

                if (postIndex >= originalItemCount) {
                    currentPosition = 0;
                    $postList.css('top', '0px');
                    postIndex = 0;
                }

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

        // --- 이벤트 핸들러 ---
        
        $container.on('mouseenter', stopScrolling);
        $container.on('mouseleave', startScrolling);

        // 초기 스크롤 시작
        startScrolling();
    } 

    // 마퀴 기능 적용 (핫 보드 및 파인드)
    setupMarquee('#popular-posts', '.hotboard-marquee-wrap');
    setupMarquee('#find-posts', '.find-marquee-wrap');
});