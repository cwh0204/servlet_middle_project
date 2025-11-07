
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

	const SESSION_KEY = 'team_last_view';
	const DEFAULT_PAGE = 'teamcreatehome.do';

	const test = sessionStorage.getItem(SESSION_KEY);

	console.log("테스트" + test);

	function loadContentAndActivateMenu(pageToLoad, key) {
		const DEFAULT_PAGE = 'teamcreatehome.do';
		// 로딩 시작 전에 콘솔에 기록하고 세션에 저장 (메뉴 클릭 시)
		
		const BLOCKED_PAGES = ['myteamhome.do', DEFAULT_PAGE, 'main.do'];
		
		if (key === SESSION_KEY && !BLOCKED_PAGES.includes(pageToLoad)) {
		        sessionStorage.setItem(key, pageToLoad);
		}
		
		if (BLOCKED_PAGES.includes(pageToLoad)) {
		        // 'main.do'와 같은 전체 페이지는 .teamcontent에 로드하지 않고 로그만 남깁니다.
		        console.warn(`🛑 경고: 전체 페이지(${pageToLoad})는 콘텐츠 영역에 로드할 수 없습니다.`);
		        
		        // 하지만 메뉴 활성화는 진행해야 합니다.
		        $('.menu-item').removeClass('active');
		        $('.menu-item[data-page="' + pageToLoad + '"]').addClass('active');
		        return; // 🚨 콘텐츠 로드 (.load) 실행을 막습니다.
		}

		$('.teamcontent').load(pageToLoad, function(response, status, xhr) {
		        if (status === "error") {
		            console.error("페이지 로드 실패:", pageToLoad);

		            // 로드 실패 시, 차단된 페이지가 아니면 세션 제거
		            if (key === SESSION_KEY && !BLOCKED_PAGES.includes(pageToLoad)) {
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
			console.log(`현재 페이지(${currentPageName})는 기본 페이지이므로 콘텐츠 로드를 건너뜁니다.`);
			// 만약 현재 URL이 메뉴 아이템에 등록된 페이지라면 활성화 상태만 설정합니다.
			if ($('.menu-item[data-page="' + currentPageName + '"]').length) {
				$('.menu-item').removeClass('active');
				$('.menu-item[data-page="' + currentPageName + '"]').addClass('active');
			}
			return;

		}

		if (lastPage) {
			console.log("세션에 저장된 마지막 팀 페이지 로드 시도:", lastPage);
			loadContentAndActivateMenu(lastPage, SESSION_KEY);
		} else {
			// 세션에 저장된 값이 없으면 myteamhome.do를 로드합니다.
			console.log("세션 값이 없어 기본 페이지 로드:", DEFAULT_PAGE);
			loadContentAndActivateMenu(DEFAULT_PAGE, null); // 세션 저장 안함
		}
	}

	// --- 함수 3: 메뉴 클릭 이벤트 핸들러 ---
	function handleMenuClick(e) {

		const $clickedItem = $(this);
		const $menuItem = $clickedItem.closest('.menu-item[data-page]');

		const pageToLoad = $menuItem.data('page');

		if (pageToLoad) {
			console.log("메뉴 클릭, 로드할 페이지:", pageToLoad);

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