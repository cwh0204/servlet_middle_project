
var menuItemContent = (lastPage, SESSION_KEY) => {

	const $menuItem = $('.menu-item-content').closest('.menu-item[data-page]');

	// 이전 active 상태 초기화
	$('.menu-item').removeClass('active');

	// 현재 메뉴 활성화
	$menuItem.addClass('active');

	const pageToLoad = $menuItem.data('page');

	if (pageToLoad) {
		// ⭐ 3. 페이지 클릭 시 sessionStorage에 현재 페이지 저장 ⭐
		sessionStorage.setItem(SESSION_KEY, pageToLoad);
		
		$('.teamcontent').load(pageToLoad, function(response, status, xhr) {
			if (status === "error") {
				console.error("페이지 로드 실패. HTTP 상태:", status);
			}
		});
	}
}



$(document).ready(function() {

	const SESSION_KEY = 'team_detail_last_view';
	const DEFAULT_PAGE = 'teamdetailhome.do';
	
	const test = sessionStorage.getItem(SESSION_KEY);
	
	function loadContentAndActivateMenu(pageToLoad, key) {
		// 로딩 시작 전에 콘솔에 기록하고 세션에 저장 (메뉴 클릭 시)
		if (key === SESSION_KEY) {
			sessionStorage.setItem(key, pageToLoad);
			
		}

		$('.teamcontent').load(pageToLoad, function(response, status, xhr) {
			if (status === "error") {
				console.error("페이지 로드 실패:", pageToLoad);
				if (key === SESSION_KEY) {
					sessionStorage.removeItem(key); // 초기 로드 실패 시 세션 제거
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
	            // 만약 현재 URL이 메뉴 아이템에 등록된 페이지라면 활성화 상태만 설정합니다.
	            if ($('.menu-item[data-page="' + currentPageName + '"]').length) {
	                $('.menu-item').removeClass('active');
	                $('.menu-item[data-page="' + currentPageName + '"]').addClass('active');
	            }
	            return;

	        } 

	        if (lastPage) {
	            loadContentAndActivateMenu(lastPage, SESSION_KEY);
	        } else {
	            // 세션에 저장된 값이 없으면 myteamhome.do를 로드합니다.
	            loadContentAndActivateMenu(DEFAULT_PAGE, null); // 세션 저장 안함
	        }
	    }

	// --- 함수 3: 메뉴 클릭 이벤트 핸들러 ---
	function handleMenuClick(e) {
		
	 	const memLoginId = sessionStorage.getItem('userId');
		
		if(memLoginId === null){
			alert('로그인 후 이용 가능한 메뉴입니다.');
			sessionStorage.setItem('team_detail_last_view', 'teamdetailhome.do');
			window.location.href = 'main.do';
			
			return;
		}
		
		const $clickedItem = $(this);
		const $menuItem = $clickedItem.closest('.menu-item[data-page]');

		const pageToLoad = $menuItem.data('page');

		if (pageToLoad) {
			sessionStorage.setItem('main_last_view', 'teamdetail.do');
			// UI 변경 로직 (active 상태)
			$('.menu-item').removeClass('active');
			$menuItem.addClass('active');

			// 콘텐츠 로드 및 세션 저장
			loadContentAndActivateMenu(pageToLoad, SESSION_KEY);
		}
	}
	$('.menu-item-content').on('click', handleMenuClick);
	initializeContent();
});