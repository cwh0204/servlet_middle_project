$(document).ready(function() {
    // 이 안에 AJAX 코드를 작성
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
});

$(document).ready(function() {
    // ... (이전 코드 생략) ...

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
});

$(document).ready(function() {
    
    // ... (기존 코드 생략) ...

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
});