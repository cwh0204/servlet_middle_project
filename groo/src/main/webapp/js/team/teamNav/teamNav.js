$(document).ready(function() {
    
    const SESSION_KEY = 'team_last_view'; // 사용할 세션 키

    // ⭐ 1. 초기 페이지 로드 로직 (새로고침 시 실행) ⭐
    const lastPage = sessionStorage.getItem(SESSION_KEY);
    
    if (lastPage) {
        console.log("세션에 저장된 마지막 팀 페이지 로드 시도:", lastPage);

        // 저장된 페이지를 .teamcontent에 로드합니다.
        $('.teamcontent').load(lastPage, function(response, status, xhr) {
            if (status === "error") {
                console.error("초기 페이지 로드 실패:", lastPage);
                sessionStorage.removeItem(SESSION_KEY); // 실패 시 세션 값 제거
            } else {
                console.log("초기 페이지 로드 성공:", lastPage);
                
                // 메뉴 활성화
                $('.menu-item').removeClass('active');
                // data-page 속성 값이 lastPage와 일치하는 .menu-item을 찾아 활성화
                $('.menu-item[data-page="' + lastPage + '"]').addClass('active');
            }
        });
    }


    // 2. 이벤트 대상을 menu-item-content로 변경 (클릭 시 실행)
	$('.menu-item-content').on('click', function(e) { 
        
        // 실제 data-page를 가진 부모 요소 (.menu-item) 찾기
        const $menuItem = $(this).closest('.menu-item[data-page]'); 
        
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
	});
});