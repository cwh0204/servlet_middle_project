
var userStudyRoll;

var memberCheck = () => {
	const memLoginId = sessionStorage.getItem('userId');
	const studyId = sessionStorage.getItem('teamId');
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teamleaderteampage.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		dataType: 'json',
		data: {
			studyId: studyId,
			memLoginId: memLoginId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {

			// **응답으로부터 studyRoll을 추출하여 전역 변수에 저장
			if (response && response.studyRoll) {
				userStudyRoll = response.studyRoll;
			}

		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
			console.error("멤버 확인 중 오류 발생:", status, error);
			// 오류 발생 시에도 접근 제어 로직 실행 (비회원, 미가입자처럼 처리)
			/*    	  setupMenuAccessControl(); */
		}

	});
}

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

	memberCheck();

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
			console.log("세션에 저장된 마지막 팀 페이지 로드 시도:", lastPage);
			loadContentAndActivateMenu(lastPage, SESSION_KEY);
		} else {
			// 세션에 저장된 값이 없으면 myteamhome.do를 로드합니다.
			loadContentAndActivateMenu(DEFAULT_PAGE, null); // 세션 저장 안함
		}
	}

	// --- 함수 3: 메뉴 클릭 이벤트 핸들러 ---
	function handleMenuClick(e) {

		const $clickedItem = $(this);
		const $menuItem = $clickedItem.closest('.menu-item[data-page]');

		const pageToLoad = $menuItem.data('page');

		const memLoginId = sessionStorage.getItem('userId');

		if (memLoginId === null) {
			alert('로그인 후 이용 가능한 메뉴입니다.');
			sessionStorage.setItem('team_detail_last_view', 'teamdetailhome.do');
			sessionStorage.setItem('main_last_view', 'teamdetail.do');
			window.location.href = 'main.do';
			return;
		} else if (userStudyRoll === null) {
			alert('가입 후 이용 가능한 메뉴입니다.');
			sessionStorage.setItem('team_detail_last_view', 'teamdetailhome.do');
			sessionStorage.setItem('main_last_view', 'teamdetail.do');
			window.location.href = 'main.do';
			return;
		}

		if (pageToLoad) {
			console.log("메뉴 클릭, 로드할 페이지:", pageToLoad);
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