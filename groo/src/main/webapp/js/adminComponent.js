/**
 *  admin 공용 컴포넌트
 */

//새로고침시 현재 있던 페이지로 새로고침
const refreshPage = () => {
	// 2. 파라미터가 있다면 해당 페이지를 로드합니다.
	const lastPage = sessionStorage.getItem('admin_last_view');
		
	if (lastPage) {
	    // 2. 해당 페이지를 로드합니다.
	    $('.a_r_container').load(
	    	lastPage,
	        function(response, status, xhr) {
	            if (status === "success") {
	                // 기존 active 클래스 제거 (필수)
	                $('.menu-item').removeClass('active');
	                $('.submenu-item').removeClass('active');

	                // 3. ⭐ 템플릿 리터럴을 사용하여 메뉴 항목을 활성화합니다.
	                // data-page 값이 일치하는 모든 요소에 active 클래스를 추가합니다.
	                
	                $('[data-page="' + lastPage + '"]').closest('.submenu').addClass('active');
	                $('[data-page="' + lastPage + '"]').addClass('active');
	                $('[data-page="' + lastPage + '"]').closest('.has-submenu').addClass('open active');
	                
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
//로고 버튼 누를시 홈으로 이동
const adminHome = () => {
	$('.heder_container').click(function() {
		sessionStorage.setItem('admin_last_view','admindashboard.do');
		window.location.href = 'admin.do';
	});
}