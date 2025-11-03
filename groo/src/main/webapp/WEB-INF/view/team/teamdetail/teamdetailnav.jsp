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
		
		<div class="menu-item active" data-page="teamdetailhome.do"> <!-- 선택한 팀의 아이디를 받아와야함 -->
			<div class="menu-item-content">
				<span>팀 상세보기</span>
			</div>
		</div>
		
		<div class="menu-item" data-page="teamdetailmemlist"> <!-- 선택한 팀의 아이디를 받아와야함 -->
			<div class="menu-item-content">
				<span>팀 인원</span>
			</div>
		</div>

		<div class="menu-item" data-page="teamboard"> <!-- 선택한 팀의 아이디를 받아와야함 -->
			<div class="menu-item-content">
				<span>팀 게시판</span>
			</div>
		</div>
		
	</aside>
</body>
</html>