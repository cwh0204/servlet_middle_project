function renderStarRatings() {
    document.querySelectorAll('.stars').forEach(starContainer => {
        const rating = parseFloat(starContainer.getAttribute('data-rating'));
        
        // 평점(rating)을 5점 만점 기준으로 백분율 계산
        const percentage = (rating / 5) * 100;
        
        // 채워진 별의 너비(width)를 설정하여 별점을 시각화
        starContainer.querySelector('.star-filled').style.width = percentage + '%';
    });
}