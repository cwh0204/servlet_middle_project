$(document).ready(function() {
    
    // ==========================================================
    // 1. 설정값 (상수)
    // ==========================================================
    const SLIDE_DURATION = 5000; // 자동 슬라이드 이동 간격 (5초)
    const SCROLL_SPEED = 1;      // 마퀴 스크롤 속도
    const SCROLL_INTERVAL = 60;  // 마퀴 스크롤 틱 간격 (ms)
    const PAUSE_DURATION = 2500; // 마퀴 항목 이동 후 정지 시간 (ms)

    // ==========================================================
    // 2. 스터디 슬라이더 기능
    // ==========================================================
	

    // ==========================================================
    // 3. 마퀴 스크롤 기능 (Hot Board & Find)
    // ==========================================================
    
    /**
     * 세로 마퀴 스크롤 기능을 설정합니다.
     * @param {string} listSelector - <ul> 요소의 jQuery 선택자 (#popular-posts, #find-posts)
     * @param {string} containerSelector - 래퍼 요소의 jQuery 선택자 (.hotboard-marquee-wrap, .find-marquee-wrap)
     */
    function setupMarquee(listSelector, containerSelector) {
        const $postList = $(listSelector);
        const $container = $(containerSelector); 
        
        if ($postList.length === 0 || $postList.children('li').length === 0) return;

        const $firstItem = $postList.children('li').first();
        const itemHeight = $firstItem.outerHeight(true);
        
        // 무한 스크롤을 위해 목록 내용을 복제
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

            // 목록을 위로 스크롤
            currentPosition -= SCROLL_SPEED;
            $postList.css('top', currentPosition + 'px');

            // 한 항목이 이동을 완료했을 경우
            if (Math.abs(currentPosition) >= itemHeight * (postIndex + 1)) {
                
                isPaused = true;
                postIndex++;

                // 원본 목록 전체 스크롤 완료 시 리셋
                if (postIndex >= originalItemCount) {
                    currentPosition = 0;
                    $postList.css('top', '0px');
                    postIndex = 0;
                }
                
                // 현재 스크롤 타이머를 멈춤
                clearInterval(scrollTimer); 
                
                // 정지 시간 후 다시 스크롤 시작
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

        // 초기 시작
        startScrolling();
    }

    // 마퀴 기능 적용 (핫 보드 및 파인드)
    setupMarquee('#popular-posts', '.hotboard-marquee-wrap');
    setupMarquee('#find-posts', '.find-marquee-wrap');
});