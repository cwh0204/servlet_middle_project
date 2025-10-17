<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/adminCss/adminnav.css" rel="stylesheet">
<title>관리자 페이지</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
</head>
<body>
	<aside class="sidebar">
		<div class="sidebar-header">관리 메뉴</div>
		<div class="menu-item active" data-page="admindashboard.do">
			<div class="menu-item-content">
				 <span>통계</span>
			</div>
		</div>
		<div class="menu-item has-submenu" data-page="adminuser.do">
			<div class="menu-item-content">
				<span>사용자 관리</span>
				<span class="menu-icon arrow">▶</span>
			</div>
			<div>
				<div class="submenu">
					<div class="submenu-item " data-page="adminuser.do">
						<span>유저 관리</span>
					</div>
					<div class="submenu-item" data-page="adminuserreport.do">
						<span>신고 유저 관리</span>
					</div>
					<div class="submenu-item" data-page="adminuser.do">
						<span>유저 제제 내역</span>
					</div>
				</div>
			</div>
		</div>
		<div class="menu-item" data-page="adminteam.do">
			<div class="menu-item-content">
				 <span>팀 관리</span>
			</div>
		</div>
		<div class="menu-item">
			<div class="menu-item-content">
				 <span>게시판 관리</span>
			</div>
		</div>
		<div class="menu-item">
			<div class="menu-item-content">
				 <span>공지사항 관리</span>
			</div>
		</div>
	</aside>
</body>
<script type="text/javascript">
$(document).ready(function() {// 일반 메뉴 아이템 클릭 이벤트
	$('.menu-item').on('click',function() {// 모든 active 클래스 제거
		$('.menu-item').removeClass('active');
		$('.submenu-item').removeClass('active');// 현재 클릭된 요소에 active 클래스 추가
		$(this).addClass('active');
		const pageToLoad = $(this).data('page');
		if (pageToLoad) {
			$('.a_r_container').load(
																pageToLoad,
																function(
																		response,
																		status,
																		xhr) {
																	if (typeof window.chartColl === 'function') {
																		window
																				.chartColl();
																	}
																	if (status == "error") {
																		console
																				.error("페이지 로드 실패");
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
						$('.submenu-item')
								.on(
										'click',
										function(e) {
											e.stopPropagation();
											
											
											// 모든 active 클래스 제거
											
											$('.submenu-item').removeClass(
													'active');
											$('.menu-item').removeClass('active');
											$(this).closest('.menu-item').addClass('active');
											// 현재 서브메뉴 아이템만 active 추가
											$(this).addClass('active');

											const pageToLoad = $(this).data(
													'page');
											if (pageToLoad) {
												$('.a_r_container')
														.load(
																pageToLoad,
																function(
																		response,
																		status,
																		xhr) {
																	if (typeof window.chartColl === 'function') {
																		window
																				.chartColl();
																	}
																	if (status == "error") {
																		console
																				.error("페이지 로드 실패");
																	}
																});
											}
										});
					});
</script>
</html>