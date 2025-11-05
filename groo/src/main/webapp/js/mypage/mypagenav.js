// js/mypage/mypagenav.js 파일 내용

// 페이지 콘텐츠를 로드하는 공통 함수. 컨테이너는 '.mypagecontent'입니다.
function loadPageContent(pageToLoad) {
    if (pageToLoad) {
        // 페이지 정보를 Session Storage에 저장
        sessionStorage.setItem('admin_last_view', pageToLoad);
        
        // '.mypagecontent' 영역에 페이지 로드
        $('.mypagecontent').load(pageToLoad, function(response, status, xhr) {
            
            // 차트/캘린더 초기화 함수 호출
            if (typeof window.chartColl === 'function') {
                window.chartColl();
            }
            if (typeof initFullCalendar === 'function') { 
                initFullCalendar(); 
            }
            
            if (status == "error") {
                console.error("페이지 로드 실패: " + xhr.status + " " + xhr.statusText);
            }
        });
    }
}

// 모든 메뉴의 active/open 클래스를 초기화하는 함수
function resetMenuClasses() {
    $('.menu-item').removeClass('active open');
    $('.submenu-item').removeClass('active');
}


// DOM 로드 완료 후 이벤트 바인딩
$(document).ready(function() {
    
    // ⭐️⭐️⭐️ 추가된 로직: 메뉴 상태 복원 함수 ⭐️⭐️⭐️
    function restoreMenuState(pageUrl) {
        if (!pageUrl) return;

        // 모든 active/open 클래스 초기화
        resetMenuClasses();
        
        // 1. 해당 data-page를 가진 요소 찾기
        const targetElement = $(`.menu-item[data-page="${pageUrl}"], .submenu-item[data-page="${pageUrl}"]`);
        
        if (targetElement.length) {
            // 2. 해당 요소에 active 클래스 적용
            targetElement.addClass('active');

            // 3. 서브메뉴 아이템인 경우, 부모 메뉴의 상태 복원 (active, open 클래스 추가)
            if (targetElement.hasClass('submenu-item')) {
                targetElement.closest('.menu-item.has-submenu').addClass('active open');
            }
        }
    }
    
    // ⭐️⭐️⭐️ 추가된 로직: 페이지 로드 시 마지막 페이지 로드 및 상태 복원 ⭐️⭐️⭐️
    const lastViewedPage = sessionStorage.getItem('admin_last_view');
    
    if (lastViewedPage) {
        // 1. 마지막으로 본 페이지 상태 복원
        restoreMenuState(lastViewedPage);
        
        // 2. 페이지 콘텐츠 로드
        loadPageContent(lastViewedPage);
        
    } else {
        // 세션 스토리지에 값이 없으면, HTML에 설정된 기본 active 페이지 (mypagedashboard.do) 로드
        const defaultPage = $('.menu-item.active').data('page');
        if (defaultPage) {
            loadPageContent(defaultPage);
        }
    }
    // ⭐️⭐️⭐️ -------------------------------------------- ⭐️⭐️⭐️


    // 1. 일반 메뉴 항목 클릭 이벤트 (has-submenu가 없는 항목만 페이지 로드)
    $('.menu-item').not('.has-submenu').on('click', function() {
        // ... (기존 로직)
        resetMenuClasses();
        $(this).addClass('active');
        
        const pageToLoad = $(this).data('page');
        loadPageContent(pageToLoad);
    });

    // 2. 서브메뉴 부모 (텍스트 영역) 클릭 이벤트 (토글 기능만)
    $('.menu-item.has-submenu > .menu-item-content').on('click', function(e) {
        // ... (기존 로직)
        const parentMenu = $(this).closest('.menu-item.has-submenu');

        // 다른 메뉴 토글 닫기
        $('.menu-item.has-submenu').not(parentMenu).removeClass('open');
        $('.menu-item.has-submenu').not(parentMenu).find('.submenu').removeClass('active');
        
        // 현재 메뉴 토글
        parentMenu.toggleClass('open');
        parentMenu.find('.submenu').toggleClass('active');
    });

    // 3. 서브메뉴 아이템 클릭 이벤트 (페이지 로드)
    $('.submenu-item').on('click', function(e) {
        // ... (기존 로직)
        e.stopPropagation(); // 부모 메뉴의 클릭 이벤트 전파 방지
        
        resetMenuClasses();
        
        // 부모 메뉴와 현재 서브메뉴 아이템에 active 클래스 추가
        $(this).closest('.menu-item').addClass('active open'); 
        $(this).addClass('active');

        const pageToLoad = $(this).data('page');
        loadPageContent(pageToLoad);
    });

});