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
			<span class="menu-icon"></span><span>통계</span>
		</div>
		<div class="menu-item" data-page="adminuser.do">
			<span class="menu-icon"></span><span>사용자 관리</span>
		</div>
		<div class="menu-item" data-page="adminteam.do">
			<span class="menu-icon"></span><span>팀 관리</span>
		</div>
		<div class="menu-item">
			<span class="menu-icon"></span><span>게시판 관리</span>
		</div>
		<div class="menu-item">
			<span class="menu-icon"></span><span>공지사항 관리</span>
		</div>
	</aside>
</body>
<script type="text/javascript">
$(document).ready(function() {
    // 1. 모든 .menu-item 클릭 이벤트 리스너를 설정합니다.
    $('.menu-item').on('click', function() {
        
        $('.menu-item').removeClass('active');
        // 현재 클릭된 요소에 active 클래스 추가
        $(this).addClass('active');

        const pageToLoad = $(this).data('page'); 
        
        // 브라우저는 이제 이 URL을 서버에 요청합니다.
        $('.a_r_container').load(pageToLoad, function(response, status, xhr) {
        	window.chartColl();
            if (status == "error") {
            }
        });
    });
});
</script>
</html>