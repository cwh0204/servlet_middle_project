teamselectall = () => {
	$.ajax({
		url: "teamselects.do",
		type: "GET",
		dataType: "json",

		success: function(response) {
			const studyList = response;
			const container = $('.new-study-list');

			container.empty();

			if (!studyList || studyList.length === 0) {
				console.log("서버로부터 받은 스터디 데이터가 없습니다.");
				return;
			}

			// 스터디 목록을 반복하며 HTML 카드 생성
			$.each(studyList, function(index, study) {

				// 데이터 추출
				const studyId = study.studyId;
				const studyTitle = study.studyTitle;
				const studyCategory = study.studyCategory;
				const studyMax = study.studyMax;

				// 1. 최상위 카드 요소 (.hot-study-card) 생성
				const $card = $('<div>')
					.addClass('hot-study-card')
					.attr('data-hot-study-id', studyId)
					.attr('data-link-url', `detail.jsp?id=${studyId}`);

				// 2. 이미지 요소 (<img>) 생성
				const $img = $('<img>')
					.attr('src', `images/hotstudy${(index % 3) + 1}.png`) // 이미지 순환 예시
					.attr('alt', `${studyTitle} 스터디 이미지`)
					.addClass('hot-study-image');

				// 3. 태그 컨테이너 (.hot-study-tags) 생성 및 태그 추가
				const $tags = $('<div>').addClass('hot-study-tags');

				const titleSubstring = studyTitle.length > 5 ? studyTitle.substring(0, 5) : studyTitle;

				$tags.append($('<span>').addClass('hot-study-tag').text(`#${studyCategory}`));
				$tags.append($('<span>').addClass('hot-study-tag').text(`#${titleSubstring}`));
				$tags.append($('<span>').addClass('hot-study-tag').text('#신규'));

				// 4. 제목 요소 (<h3>) 생성
				const $title = $('<h3>').addClass('hot-study-title').text(studyTitle);

				// 5. 인원 정보 요소 (<p>) 생성 (이전에 논의된 추가 정보)
				const $info = $('<p>').addClass('study-info').text(`최대 인원: ${studyMax}명`);

				// 6. 모든 요소를 카드에 조립 후 컨테이너에 삽입
				$card.append($img)
					.append($tags)
					.append($title)
					.append($info);

				container.append($card);
			});

			console.log(`총 ${studyList.length}개의 스터디 카드가 동적으로 추가되었습니다.`);
		},
		error: function(xhr, status, error) {
			console.error("AJAX 요청 오류:", status, error);
		}
	});
}

$(document).ready(function() {
	
	teamselectall();
	
	// --- 2. 슬라이드 기능 (기존 코드 유지) ---

	const slideContainer = $('.slide-container');
	const slideItems = $('.slide-item');

	const slideWidth = 1200; // 1200px 유지

	const totalSlides = slideItems.length;
	let currentSlide = 0;
	let slideInterval;

	slideContainer.width(slideWidth * totalSlides);

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
		slideInterval = setInterval(moveToNextSlide, 4000);
	}

	function stopAutoSlide() {
		clearInterval(slideInterval);
	}

	startAutoSlide();

	// 마우스를 올렸을 때 정지, 뺐을 때 다시 시작
	$('.hot-study-slider-area').hover(stopAutoSlide, startAutoSlide);

	// --- 3. 카드 클릭 이벤트 (이벤트 위임으로 수정) ---

	// '.new-study-list'는 AJAX로 추가된 카드의 부모 요소입니다.
	// 동적으로 추가된 '.hot-study-card'에도 이벤트가 적용되도록 이벤트 위임을 사용합니다.
	$('.new-study-list').on('click', '.hot-study-card', function() {
		const url = $(this).data('link-url'); // data-link-url 속성 값 가져오기

		if (url) {
			window.location.href = url; // 해당 URL로 페이지 이동
		}

		return false; // 기본 클릭 동작 방지
	});
});