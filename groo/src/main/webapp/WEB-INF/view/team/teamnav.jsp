<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/team/teamNav/teamNav.js"></script>
<link href="css/team/teamnav.css" rel="stylesheet">
<title>게시판</title>
</head>
<body>
	<aside class="sidebar">
		<div class="sidebar-header">팀 관련 목록</div>
		<div class="menu-item active" data-page="teamcreatehome.do">
			<div class="menu-item-content">
				<span>팀 생성</span>
			</div>
		</div>

		<div class="menu-item" data-page="myteamhome.do">
			<div class="menu-item-content">
				<span>팀 보기</span>
			</div>
		</div>

		<div class="menu-item" data-page="">
			<div class="menu-item-content">
				<span>팀 관리</span>
			</div>
		</div>
	</aside>
</body>
</html>