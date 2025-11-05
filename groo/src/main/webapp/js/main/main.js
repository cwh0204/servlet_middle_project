$(document).ready(function() {

	$.ajax({
		url: "teamselectall.do",
		type: "GET",
		dataType: "json",

		success: function(response) {
			console.log(response);
		},
		error: function(xhr, status, error) {
			console.log("오류", status, error);
		}
	});

	const slideContainer = $('.slide-container');
	const slideItems = $('.slide-item');

	// slideWidth를 1200px로 변경 (1140px + 60px 간격)
	const slideWidth = 1200;

	const totalSlides = slideItems.length;
	let currentSlide = 0;
	let slideInterval;

	slideContainer.width(slideWidth * totalSlides);

	// -------------------- 자동 슬라이드 기능 구현 --------------------

	function moveToNextSlide() {
		currentSlide++;
		if (currentSlide >= totalSlides) {
			currentSlide = 0;
		}

		const newMarginLeft = -currentSlide * slideWidth;
		slideContainer.css('margin-left', newMarginLeft + 'px');
	}

	function startAutoSlide() {
		stopAutoSlide();
		// 4초 간격 유지
		slideInterval = setInterval(moveToNextSlide, 4000);
	}

	function stopAutoSlide() {
		clearInterval(slideInterval);
	}

	startAutoSlide();

	// 마우스를 올렸을 때 정지, 뺐을 때 다시 시작
	$('.hot-study-slider-area').hover(stopAutoSlide, startAutoSlide);

	// -------------------- 카드 클릭 이벤트 유지 --------------------

	$('.hot-study-card').on('click', function() {
		const url = $(this).data('link-url');

		if (url) {
			window.location.href = url;
		}

		return false;
	});
});