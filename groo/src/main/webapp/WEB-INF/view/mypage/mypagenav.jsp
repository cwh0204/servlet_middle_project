<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/adminCss/adminnav.css" rel="stylesheet">
<script src="js/mypage/mypagenav.js"></script>
<title>마이페이지</title>
</head>
<body>
	<aside class="sidebar">
		<div class="sidebar-header">마이페이지</div>
		
		<div class="menu-item active" data-page="mypagedashboardhome.do">
			<div class="menu-item-content">
				<span>일정 달력표</span>
			</div>
		</div>
		
		<div class="menu-item has-submenu">
			<div class="menu-item-content">
				<span>나의 활동</span>
			</div> 
            <div class="submenu">
				<div class="submenu-item" data-page="myboard.do">
					<span>나의 게시글</span>
				</div>
				<div class="submenu-item" data-page="myreview.do">
					<span>나의 리뷰</span>
				</div>
			</div>
		</div>
	</aside>
    </body>
</html>