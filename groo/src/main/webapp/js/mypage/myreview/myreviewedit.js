
$(document).ready(function() {
	
	$('.summernote').summernote({
			height: 400,
			placeholder: '게시글 내용을 입력해 주세요.',
			tabsize: 2,

			toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
				['color', ['forecolor', 'color']],
				['table', ['table']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['insert', ['picture', 'link', 'video']],
				['view', ['fullscreen', 'help']]
			],

			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
			fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
		});
			
    // 1. 필요한 요소들을 가져옵니다.
    const ratingContainer = document.getElementById('starRating');
    // ratingDisplay는 더 이상 화면에 점수를 표시하지 않으므로 사용하지 않습니다.
    // 하지만 HTML 구조를 해치지 않기 위해 변수는 유지하거나, 이 코드 블록에서 제거할 수 있습니다.
    // 여기서는 화면 표시를 위해 필요했던 ratingDisplay 변수 사용을 제거하고,
    // currentRating만 관리합니다.
    let currentRating = 0; // 현재 고정된 별점을 저장할 변수

    if (!ratingContainer) {
        console.error("별점 컨테이너 요소(ID: starRating)를 찾을 수 없습니다.");
        return;
    }
    
    const stars = ratingContainer.querySelectorAll('.star');

    // 2. 별 클릭 이벤트 처리 (고정 및 해제 로직)
    stars.forEach(star => {
        star.addEventListener('click', function() {
            const clickedRating = parseInt(this.getAttribute('data-value')); // 클릭된 별점 값

            // ⭐️ 핵심 로직: 이미 고정된 별점과 동일한 별을 클릭하면 고정 해제
            if (clickedRating === currentRating) {
                // 고정 해제 (별 취소)
                currentRating = 0;
                // ratingDisplay.textContent = `0점`; // 👈 이 코드를 제거합니다.
                stars.forEach(s => s.classList.remove('rated'));
                
                // ⭐️ 콘솔에 해제된 점수(0) 출력
                console.log(`별점 해제됨. 현재 점수: ${currentRating}`); 
            } else {
                // 새로운 별점 고정
                currentRating = clickedRating;
                // ratingDisplay.textContent = `${currentRating}점`; // 👈 이 코드를 제거합니다.

                // 기존 'rated' 클래스 제거
                stars.forEach(s => s.classList.remove('rated'));

                // ⭐️ 현재 클릭된 별에 'rated' 클래스를 부여하여 색상을 고정
                this.classList.add('rated');

                // ⭐️ 콘솔에 고정된 점수 출력
                console.log(`별점 고정됨. 선택된 점수: ${currentRating}`);
            }
        });
    });
});