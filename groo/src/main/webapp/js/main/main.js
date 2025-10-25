$(document).ready(function() {
    if (typeof window.initializeStudyFeatures === 'function') {
        window.initializeStudyFeatures();
    }
});

window.initializeStudyFeatures = function() {

    // 2. Slick Carousel 초기화
    const $carousel = $('#hot-studies-carousel');
    
    // 🌟 안전을 위해 unslick() 전에 초기화 상태인지 확인
    if ($carousel.hasClass('slick-initialized')) {
        $carousel.slick('unslick');
    }
    
    $carousel.slick({
        arrows: false,
        draggable: true,
        swipe: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: false, 
        infinite: false,
        speed: 500,
    });
    
    // 3. Masonry 초기화 (활동중인 스터디)
    var $grid = $('#active-studies-grid');
    
    if ($grid.length) { 
        // 🌟 1단계: 기존 Masonry 인스턴스 파괴 (항상 실행)
        // 요소가 Masonry 인스턴스를 가지고 있는지 확인 후 파괴
        if ($grid.data('masonry')) {
             $grid.masonry('destroy'); 
        }

        // 🌟 2단계: imagesLoaded 확인 후 Masonry 초기화 실행 (가장 안정적인 방식)
        if (typeof $.fn.imagesLoaded === 'function') {
            $grid.imagesLoaded().always( function() {
                // 이미지가 로드된 후, Masonry를 초기화하고 레이아웃을 다시 잡습니다.
                $grid.masonry({
                    itemSelector: '.active-grid-item',
                    columnWidth: '.active-grid-sizer', 
                    transitionDuration: '0.3s',
                    percentPosition: true,
                    gutter: 0 
                });
            });
        } else {
             // imagesLoaded가 없을 경우: 바로 초기화 (이미지 로딩으로 인한 레이아웃 깨짐 위험이 있음)
             $grid.masonry({
                 itemSelector: '.active-grid-item',
                 columnWidth: '.active-grid-sizer', 
                 transitionDuration: '0.3s',
                 percentPosition: true,
                 gutter: 0 
             });
        }
    }
};