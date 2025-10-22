/** 
 * 
 */
const mainHome = () => {
	console.log("mainHome 함수 실행: 동적 콘텐츠 초기화 시작");

		
    // 2. Slick Carousel 초기화 (재사용을 위해 unslick() 로직 추가)
    const $carousel = $('#hot-studies-carousel');
    
    // 재실행 시 오류 방지를 위해 unslick()을 먼저 호출
    if ($carousel.hasClass('slick-initialized')) {
        $carousel.slick('unslick');
    }
    
    $carousel.slick({
        arrows: false,
        draggable: true,
        swipe: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: false, // 번호 제거
        infinite: false,
        speed: 500,
    });
    
    // 3. Masonry 초기화 (활동중인 스터디)
    var activeGrid = document.querySelector('#active-studies-grid');
    
    if (activeGrid) {
        // 기존 Masonry 인스턴스가 있다면 제거 (선택적)
        if (activeGrid.masonry) {
             activeGrid.masonry.destroy();
        }
        // DOM 렌더링 후 레이아웃 재조정을 위해 setTimeout 사용
        setTimeout(function() {
            new Masonry(activeGrid, {
                itemSelector: '.active-grid-item',
                columnWidth: '.active-grid-sizer',
                percentPosition: true,
                gutter: 0                        
            });
        }, 500);
    }
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
	                if (typeof window.chartColl === 'function') {
	                    window.chartColl();
	                }
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
			$('main').load(pageToLoad, function(response, status, xhr) {
				if (status == "success") { // ⭐ 성공 시에만 호출해야 합니다!
					mainHome();
				} else {
					console.error("페이지 로드 실패");
				}
			});
		}
	});
}