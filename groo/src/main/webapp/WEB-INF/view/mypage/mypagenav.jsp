<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/adminCss/adminnav.css" rel="stylesheet">
<title>마이페이지</title>
</head>
<body>
	<aside class="sidebar">
		<div class="sidebar-header">마이페이지</div>
		<div class="menu-item active" data-page="mypagedashboard.do">
			<div class="menu-item-content">
				<span>전체보기</span>
			</div>
		</div>
		<div class="menu-item has-submenu">
			<div class="menu-item">
				<div class="menu-item-content">
					<span>나의 활동</span>
				</div>
				<div>
					<div class="submenu">
						<div class="submenu-item " data-page="">
							<span>나의 목표</span>
						</div>
						<div class="submenu-item" data-page="">
							<span>나의 게시글</span>
						</div>
						<div class="submenu-item" data-page="">
							<span>나의 리뷰</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</aside>
</body>
<script type="text/javascript">
	$('.menu-item').on(
			'click',
			function() {// 모든 active 클래스 제거
				$('.menu-item').removeClass('active');
				$('.submenu-item').removeClass('active');// 현재 클릭된 요소에 active 클래스 추가
				$(this).addClass('active');
				const pageToLoad = $(this).data('page');
				if (pageToLoad) {
					// 페이지 정보를 Session Storage에 저장함
					sessionStorage.setItem('admin_last_view', pageToLoad);
					$('.a_r_container').load(pageToLoad,
							function(response, status, xhr) {
								if (typeof window.chartColl === 'function') {
									window.chartColl();
								}
								if (status == "error") {
									console.error("페이지 로드 실패");
								}
							});
				}
			});

	// 서브메뉴가 있는 메뉴 클릭 이벤트 (토글만)
	$('.menu-item.has-submenu').on('click', function(e) {
		// 서브메뉴 토글
		$(this).toggleClass('open');
		$(this).find('.submenu').toggleClass('active');
	});

	// 서브메뉴 아이템 클릭 이벤트
	$('.submenu-item').on(
			'click',
			function(e) {
				e.stopPropagation();
				// 모든 active 클래스 제거
				$('.submenu-item').removeClass('active');
				$('.menu-item').removeClass('active');
				$(this).closest('.menu-item').addClass('active');
				// 현재 서브메뉴 아이템만 active 추가
				$(this).addClass('active');

				const pageToLoad = $(this).data('page');
				// 페이지 정보를 Session Storage에 저장함
				sessionStorage.setItem('admin_last_view', pageToLoad);
				if (pageToLoad) {
					$('.a_r_container').load(pageToLoad,
							function(response, status, xhr) {
								if (status == "error") {
									console.error("페이지 로드 실패");
								}
							});
				}
			});
</script>
</html>