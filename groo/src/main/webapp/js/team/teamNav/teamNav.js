var menuItemContent = (lastPage, SESSION_KEY) => {

	const $menuItem = $('.menu-item-content').closest('.menu-item[data-page]');

	// 이전 active 상태 초기화
	$('.menu-item').removeClass('active');

	// 현재 메뉴 활성화
	$menuItem.addClass('active');

	const pageToLoad = $menuItem.data('page');

	if (pageToLoad) {
		// 🚨 이 함수는 handleMenuClick이 대신하므로 사용하지 않는 것이 좋습니다.
		// 만약 사용한다면, 아래 loadContentAndActivateMenu 로직을 따라 수정해야 합니다.
		
		sessionStorage.setItem(SESSION_KEY, pageToLoad); 
		
		$('.teamcontent').load(pageToLoad, function(response, status, xhr) {
			if (status === "error") {
				console.error("페이지 로드 실패. HTTP 상태:", status);
			}
		});
	}
}

$(document).ready(function() {

	const SESSION_KEY = 'team_last_view';
	const DEFAULT_PAGE = 'teamcreatehome.do';
	
	const test = sessionStorage.getItem(SESSION_KEY);
	
	function loadContentAndActivateMenu(pageToLoad, key) {
		// 로딩 시작 전에 콘솔에 기록하고 세션에 저장 (메뉴 클릭 시)
		
		sessionStorage.setItem(key, pageToLoad);
		// 🚨 핵심 수정: 'myteamhome.do' 또는 'teamcreatehome.do'일 경우 세션 저장을 건너뜁니다.
/*		if (key === SESSION_KEY && pageToLoad !== 'myteamhome.do' && pageToLoad !== DEFAULT_PAGE) {
			sessionStorage.setItem(key, pageToLoad);
			console.log("확인중!!!!!!!!!!!!!!!!!");
		}*/

		$('.teamcontent').load(pageToLoad, function(response, status, xhr) {
			if (status === "error") {
				console.error("페이지 로드 실패:", pageToLoad);
				
				// 로드 실패 시 세션 제거 로직도 마찬가지로 목록 페이지는 건너뜁니다.
				if (key === SESSION_KEY && pageToLoad !== 'myteamhome.do' && pageToLoad !== DEFAULT_PAGE) {
					sessionStorage.removeItem(key); 
				}
			} else {

				// 메뉴 활성화 로직
				$('.menu-item').removeClass('active');
				$('.menu-item[data-page="' + pageToLoad + '"]').addClass('active');
			}
		});
	}

	// --- 함수 2: 초기 페이지 로드 로직 (새로고침 시) ---
	function initializeContent() {
	        const lastPage = sessionStorage.getItem(SESSION_KEY);
	        const currentPath = window.location.pathname; 
	        
	        // 현재 URL에서 파일명만 추출 (예: /groo/main.do -> main.do)
	        const currentPageName = currentPath.substring(currentPath.lastIndexOf('/') + 1);
	        
	        if (currentPageName === 'myteamhome.do' || currentPageName === 'teamcreatehome.do') {
	            // 💡 현재 브라우저 URL이 기본 페이지일 때, 콘텐츠를 로드하지 않고 메뉴 활성화만 합니다.
	            
	            if ($('.menu-item[data-page="' + currentPageName + '"]').length) {
	                $('.menu-item').removeClass('active');
	                $('.menu-item[data-page="' + currentPageName + '"]').addClass('active');
	            }
	            return;
	        } 

	        if (lastPage) {
	            // 마지막 페이지를 로드합니다. (이 값은 이제 'myteamhome.do'가 아닐 것입니다.)
	            loadContentAndActivateMenu(lastPage, SESSION_KEY);
	        } else {
	            // 세션에 저장된 값이 없으면 기본 페이지를 로드합니다.
	            loadContentAndActivateMenu(DEFAULT_PAGE, null); // 세션 저장 안함
	        }
	    }

	// --- 함수 3: 메뉴 클릭 이벤트 핸들러 ---
	function handleMenuClick(e) {

		const $clickedItem = $(this);
		const $menuItem = $clickedItem.closest('.menu-item[data-page]');

		const pageToLoad = $menuItem.data('page');

		if (pageToLoad) {

			// UI 변경 로직 (active 상태)
			$('.menu-item').removeClass('active');
			$menuItem.addClass('active');

			// 콘텐츠 로드 및 세션 저장 (목록 페이지는 저장되지 않음)
			loadContentAndActivateMenu(pageToLoad, SESSION_KEY);
		}
	}
	$('.menu-item-content').on('click', handleMenuClick);
	initializeContent();
});