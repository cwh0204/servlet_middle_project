$(document).ready(() => {
	
	const refreshPage = () => {
		// 2. 파라미터가 있다면 해당 페이지를 로드합니다.
		const lastPage = sessionStorage.getItem('main_last_view');
		if (lastPage) {
			// 2. 해당 페이지를 로드합니다.
			$('#contentArea').load(lastPage,function(response, status, xhr) {
					if (status === "success") {
						// 기존 active 클래스 제거 (필수)
						$('.menu-item-content').removeClass('active');
						// 3. ⭐ 템플릿 리터럴을 사용하여 메뉴 항목을 활성화합니다.
						// data-page 값이 일치하는 모든 요소에 active 클래스를 추가합니다.

						$('[data-page="' + lastPage + '"]').addClass('active');
					} else {
						console.error("새로고침 시 페이지 로드 실패");
					}
				}
			);
		}
	}

	const mainHeder = () => {
		$('.menu-item-content').on('click', function() {// 모든 active 클래스 제거
			$('.menu-item-content').removeClass('active');
			$(this).addClass('active');
			const pageToLoad = $(this).data('page');
			if (pageToLoad) {
				// 페이지 정보를 Session Storage에 저장함
				sessionStorage.setItem('main_last_view', pageToLoad);
				sessionStorage.removeItem('team_last_view');
				sessionStorage.removeItem('mypage_last_view');
				sessionStorage.removeItem('board_last_view');
				$('#contentArea').load(pageToLoad, function(response, status, xhr) {
					if (status == "success") { // ⭐ 성공 시에만 호출해야 합니다!
					} else {
						console.error("페이지 로드 실패");
					}
				});
			}
		});

		$('.dropdown-item').on('click', function() {// 모든 active 클래스 제거
			$('.dropdown-item').removeClass('active');
			$(this).addClass('active');
			const pageToLoad = $(this).data('page');
			if (pageToLoad) {
				// 페이지 정보를 Session Storage에 저장함
				sessionStorage.setItem('main_last_view', pageToLoad);
				$('#contentArea').load(pageToLoad, function(response, status, xhr) {
					if (status == "success") { // ⭐ 성공 시에만 호출해야 합니다!
					} else {
						console.error("페이지 로드 실패");
					}
				});
			}
		});
	}

	// --- 함수 호출 ---
	// 페이지 로드 후 마지막 페이지를 로드하고 이벤트를 설정합니다.
	refreshPage();
	mainHeder();
});