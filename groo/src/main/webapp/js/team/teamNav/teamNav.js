
var menuItemContent = (lastPage, SESSION_KEY) => {

	const $menuItem = $('.menu-item-content').closest('.menu-item[data-page]');

	// 이전 active 상태 초기화
	$('.menu-item').removeClass('active');

	// 현재 메뉴 활성화
	$menuItem.addClass('active');

	const pageToLoad = $menuItem.data('page');
	console.log("메뉴 클릭, 로드할 페이지:", pageToLoad);

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
	const DEFAULT_PAGE = 'teamselectmyteam.do';

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
				console.log("페이지 로드 성공:", pageToLoad);

				// 메뉴 활성화 로직
				$('.menu-item').removeClass('active');
				$('.menu-item[data-page="' + pageToLoad + '"]').addClass('active');
			}
		});
	}

	// --- 함수 2: 초기 페이지 로드 로직 (새로고침 시) ---
	function initializeContent() {
		const lastPage = sessionStorage.getItem(SESSION_KEY);

		if (lastPage) {
			console.log("세션에 저장된 마지막 팀 페이지 로드 시도:", lastPage);
			loadContentAndActivateMenu(lastPage, SESSION_KEY);
		} else {
			// 세션에 저장된 값이 없으면 기본 페이지를 로드합니다.
			console.log("세션 값이 없어 기본 페이지 로드:", DEFAULT_PAGE);
			loadContentAndActivateMenu(DEFAULT_PAGE, null); // 세션 저장 안함
		}
	}

	// --- 함수 3: 메뉴 클릭 이벤트 핸들러 ---
	function handleMenuClick(e) {

		// 🚨 수정된 부분: $(this)를 사용하여 클릭된 요소의 부모를 정확히 찾습니다.
		// 이전에 '.menu-item-content' 전체에서 .closest()를 찾는 것은 오류였습니다.
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
});