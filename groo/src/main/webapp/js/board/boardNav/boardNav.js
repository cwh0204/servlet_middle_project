$(document).ready(function() {
	const lastPage = sessionStorage.getItem('board_last_view');

	if (lastPage) {
		const activateMenu = (pageUrl) => {
			const $targetItem = $('.menu-item[data-page="' + pageUrl + '"]');

			if ($targetItem.length) {
				$('.menu-item').removeClass('active');
				$targetItem.addClass('active');
			}
		};

		$('.boardcontent').load(lastPage, function(response, status, xhr) {
			if (status === "error") {
				console.error("저장된 페이지 로드 실패. HTTP 상태:", xhr.status, xhr.statusText);
				sessionStorage.removeItem('board_last_view');
			} else {
				activateMenu(lastPage);
			}
		});
	}

	$('.menu-item-content').on('click', function(e) {
		const $menuItem = $(this).closest('.menu-item[data-page]');
		$('.menu-item').removeClass('active');
		$menuItem.addClass('active');
		const pageToLoad = $menuItem.data('page');
		
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