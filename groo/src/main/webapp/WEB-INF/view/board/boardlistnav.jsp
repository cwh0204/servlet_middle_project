<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/board/boardNav/boardNav.js"></script>
<link href="css/board/boardnav.css" rel="stylesheet">
<title>게시판</title>
</head>
<body>
	<aside class="sidebar">
		<div class="sidebar-header">게시판 목록</div>
		<div class="menu-item active" data-page="boardnoticehome.do">
			<div class="menu-item-content">
				<span>공지사항</span>
			</div>
		</div>

		<div class="menu-item" data-page="boardfreehome.do">
			<div class="menu-item-content">
				<span>자유 게시판</span>
			</div>
		</div>

		<div class="menu-item" data-page="boardgoalhome.do">
			<div class="menu-item-content">
				<span>베스트 게시판</span>
			</div>
		</div>
	</aside>
</body>
</html>