$(document).ready(function() {
/*	
	// 네이버 소셜로그인 확인용
	const naverServiceResponse = '${sessionScope.naverServiceResponse}';
	if (naverServiceResponse !== '' && naverServiceResponse !== 'null') {
		const responseObject = JSON.parse(naverServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용	
	}

	// 깃허브 소셜로그인 확인용
	const gitHubServiceResponse = '${sessionScope.gitHubServiceResponse}';
	if (gitHubServiceResponse !== '' && gitHubServiceResponse !== 'null') {
		const responseObject = JSON.parse(gitHubServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용	
	}

	//카카오 소셜로그인 확인용
	const kakaoServiceResponse = '${sessionScope.kakaoServiceResponse}';
	if (kakaoServiceResponse !== '' && kakaoServiceResponse !== 'null') {
		const responseObject = JSON.parse(kakaoServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용
	}*/
	
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
		   
		   var $grid = $('#active-studies-grid').masonry({
		           // Masonry 아이템 선택자
		           itemSelector: '.active-grid-item',
		           // 컬럼 크기를 결정하는 요소 (선택사항, 레이아웃을 더 유연하게 만듦)
		           columnWidth: '.active-grid-sizer', 
		           // 애니메이션 효과
		           transitionDuration: '0.3s'
		       });

		       // Masonry를 이미지 로딩 후 다시 레이아웃해야 이미지가 높이를 결정하는 데 문제 없음
		       $grid.imagesLoaded().progress( function() {
		           $grid.masonry('layout');
		       });
});