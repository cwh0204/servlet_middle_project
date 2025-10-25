$(document).ready(function() {
	$('.menu-item').on('click',function() {
		$('.menu-item').removeClass('active');
		$('.submenu-item').removeClass('active');
		$(this).addClass('active');
		
		const pageToLoad = $(this).data('page');
		
		if (pageToLoad) {
			sessionStorage.setItem('admin_last_view',pageToLoad);
			$('.a_r_container').load(pageToLoad,function(response,status,xhr) {
				if (typeof window.chartColl === 'function') {window.chartColl();
					}
					if (status == "error") {console.error("페이지 로드 실패");
						
					}
				});
			}
		});
		$('.menu-item.has-submenu').on('click',function(e) {
		$(this).toggleClass('open');
		$(this).find('.submenu').toggleClass('active');
	});
	$('.submenu-item').on('click',function(e) {e.stopPropagation();
		$('.submenu-item').removeClass('active');
		$('.menu-item').removeClass('active');
		$(this).closest('.menu-item').addClass('active');
		$(this).addClass('active');
		const pageToLoad = $(this).data('page');
		sessionStorage.setItem('admin_last_view',pageToLoad);
		if (pageToLoad) {$('.a_r_container').load(pageToLoad,function(response,	status, xhr) {
			if (status == "error") {console.error("페이지 로드 실패");
				
			}
		});
	}
});
});
