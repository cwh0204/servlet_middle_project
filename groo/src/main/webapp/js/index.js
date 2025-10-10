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

    /**
     * 데이터를 받아 핫 스터디 슬라이드 항목을 생성합니다.
     * @param {Array<Object>} data - 서버에서 받은 팀 데이터 배열
     */
    function createHotStudySlides(data) {
        const $list = $('#hot-study-list');
        $list.empty();
        
        let html = '';
        data.forEach((team) => {
            const title = team.teamName || '새로운 스터디';
            // teamInfo가 null일 경우 대비, 150자 미만일 경우 처리
            const info = team.teamInfo ? team.teamInfo.substring(0, 150) + (team.teamInfo.length > 150 ? '...' : '') : '스터디 설명이 없습니다.';
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

    /**
     * 슬라이더를 초기화하고 자동 재생을 설정합니다.
     * @param {string} listSelector - <ul> 요소의 jQuery 선택자
     */
    function initCustomSlider(listSelector) {
        let currentSlide = 0;
        let slideCount;
        let sliderTimer;
        
        const $sliderList = $(listSelector);
        const $sliderContainer = $sliderList.closest('.hotstudy');
        
        slideCount = $sliderList.children('.slide-item').length;
        if (slideCount <= 1) return;

        // <ul> 요소의 총 너비를 설정
        $sliderList.css('width', (slideCount * 100) + '%');

        function moveSlide(direction) {
            stopAutoSlide();
            
            currentSlide += direction; 
            
            if (currentSlide >= slideCount) {
                currentSlide = 0;
            } else if (currentSlide < 0) {
                 currentSlide = slideCount - 1; 
            }
            
            $sliderList.css('transform', `translateX(${currentSlide * -100 / slideCount}%)`); 
            
            startAutoSlide();
        }
        
        function startAutoSlide() {
            if (sliderTimer) clearInterval(sliderTimer);
            sliderTimer = setInterval(() => {
                moveSlide(1); 
            }, SLIDE_DURATION);
        }

        function stopAutoSlide() {
            clearInterval(sliderTimer);
        }

        // 이벤트 핸들러
        $sliderContainer.on('mouseenter', stopAutoSlide);
        $sliderContainer.on('mouseleave', startAutoSlide);
        
        // 초기 시작
        startAutoSlide();
    }


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

    // ==========================================================
    // 4. 초기화 실행 (메인 로직)
    // ==========================================================

    // AJAX 호출 (스터디 목록 데이터 로드)
    $.ajax({
        url: "/groo/indexs.do",
        type: "GET",
        dataType: "json",
        success: function(data) {
            console.log("AJAX 데이터 수신 완료:", data);
            
            if (data && data.length > 0) {
                createHotStudySlides(data);
            }
            
            // 데이터 수신 성공 여부와 관계없이 슬라이더 초기화
            initCustomSlider('#hot-study-list');
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류 발생:", status, error);
            // AJAX 오류 시에도 기존 HTML 콘텐츠로 슬라이더를 초기화
            initCustomSlider('#hot-study-list');
        }
    });

    // 마퀴 기능 적용 (핫 보드 및 파인드)
    setupMarquee('#popular-posts', '.hotboard-marquee-wrap');
    setupMarquee('#find-posts', '.find-marquee-wrap');
});