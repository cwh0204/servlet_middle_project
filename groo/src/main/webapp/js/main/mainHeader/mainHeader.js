$(document).ready(()=> {
	mainHome();
	mainHeder();
	refreshPage();
});

const mainHome = () => {
	console.log("mainHome 함수 실행: 동적 콘텐츠 초기화 시작");
}

const refreshPage = () => {
	// 2. 파라미터가 있다면 해당 페이지를 로드합니다.
	const lastPage = sessionStorage.getItem('main_last_view');
	console.log("lastPage",lastPage);
	if (lastPage) {
	    // 2. 해당 페이지를 로드합니다.
	    $('main').load(
	    	lastPage,
	        function(response, status, xhr) {
	            if (status === "success") {
					mainHome();
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
			console.log(pageToLoad);
			$('main').load(pageToLoad, function(response, status, xhr) {
				if (status == "success") { // ⭐ 성공 시에만 호출해야 합니다!
					window.initializeStudyFeatures();
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
				console.log(pageToLoad);
				$('main').load(pageToLoad, function(response, status, xhr) {
					if (status == "success") { // ⭐ 성공 시에만 호출해야 합니다!
						window.initializeStudyFeatures();
					} else {
						console.error("페이지 로드 실패");
					}
				});
			}
		});
}