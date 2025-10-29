$(document).ready(function() {
    // 1. 이벤트 대상을 menu-item-content로 변경
	$('.menu-item-content').on('click', function(e) { 
        
        // 실제 data-page를 가진 부모 요소 (.menu-item) 찾기
        const $menuItem = $(this).closest('.menu-item[data-page]'); 
        
        // 이전 active 상태 초기화 (전체 메뉴 대상)
		$('.menu-item').removeClass('active');
        
        // 현재 메뉴 활성화 (data-page를 가진 부모 메뉴에 active 부여)
		$menuItem.addClass('active');
		
		const pageToLoad = $menuItem.data('page');
		console.log(pageToLoad);
		
		if (pageToLoad) {
			$('.teamcontent').load(pageToLoad, function(response, status, xhr) {
				if (status == "error") {
                    console.error("페이지 로드 실패");
				}
			});
		}
	});
});



