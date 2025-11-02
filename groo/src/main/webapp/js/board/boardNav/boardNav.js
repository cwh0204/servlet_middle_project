$(document).ready(function() {
	const lastPage = sessionStorage.getItem('board_last_view');

	if (lastPage) {
		const activateMenu = (pageUrl) => {
			const $targetItem = $('.menu-item[data-page="' + pageUrl + '"]');

			if ($targetItem.length) {
				$('.menu-item').removeClass('active');
				$targetItem.addClass('active');
				console.log("메뉴 항목 활성화 완료:", pageUrl);
			} else {
				console.warn("활성화할 메뉴 항목을 찾을 수 없습니다:", pageUrl);
			}
		};

		$('.boardcontent').load(lastPage, function(response, status, xhr) {
			if (status === "error") {
				console.error("저장된 페이지 로드 실패. HTTP 상태:", xhr.status, xhr.statusText);
				sessionStorage.removeItem('board_last_view');
			} else {
				console.log("페이지 로드 성공:", lastPage);
				activateMenu(lastPage);
			}
		});
	} else {
		console.log("세션에 저장된 마지막 페이지 정보가 없습니다.");
	}

	$('.menu-item-content').on('click', function(e) {
		const $menuItem = $(this).closest('.menu-item[data-page]');
		$('.menu-item').removeClass('active');
		$menuItem.addClass('active');
		const pageToLoad = $menuItem.data('page');
		console.log("메뉴 클릭, 로드할 페이지:", pageToLoad);
		
		if (pageToLoad) {
			sessionStorage.setItem('board_last_view', pageToLoad);

			$('.boardcontent').load(pageToLoad, function(response, status, xhr) {
				if (status === "error") {
					console.error("페이지 로드 실패. HTTP 상태:", status);
				}
			});
		}
	});
});