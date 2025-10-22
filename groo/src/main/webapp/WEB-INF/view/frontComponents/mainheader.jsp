<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/mainHeader.js"></script>
<script src="jquery/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
header {
	background-color: white;
	padding: 0;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	font-family: 'normal';
}

.flex_container.heder_container {
	justify-content: space-between;
	height: 70px;
	padding: 0 35px;
}

.logo {
	width: 180px;
}

.main_kategorie_box {
	height: 100%;
	gap: 30px;
	font-size: 18px;
	font-weight: bold;
	gap: 30px;
}

.main_user_box {
	gap: 30px;
	font-size: 15px;
}

.main_kategorie_box div {
	padding: 20px;
	height: calc(100% - 4px);
	position: relative;
	overflow: hidden;
}

.main_kategorie_box div::after {
	content: '';
	position: absolute;
	bottom: 8px;
	left: 0;
	height: 3px;
	background-color: green;
	width: 100%;
	transform: scaleX(0);
	transform-origin: center;
	transition: transform 0.1s ease-out;
}

.main_kategorie_box div:hover::after {
	transform: scaleX(1);
}

.main_kategorie_box div.active::after {
	transform: scaleX(1);
}

.fs-3 {
	color: #28a745;
}

#profile-icon-span {
	cursor: pointer;
}

#profile-dropdown-menu {
	display: none;
}
</style>
</head>
<body>
	<header>
		<div class="flex_container heder_container">
			<img class="logo" src="./images/로고.png">
			<div class="flex_container main_kategorie_box">
				<div class="menu-item-content active" data-page="mainhome.do">HOME</div>
				<div class="menu-item-content">공지사항</div>
				<div class="menu-item-content" data-page="login.do">팀</div>
				<div class="menu-item-content" data-page="signup.do">게시판</div>
				<div class="menu-item-content" data-page="teamfind.do">자유게시판</div>
				<div class="menu-item-content" data-page="teamcreate.do">Groo 소개글</div>
			</div>
			<div id=profile-icon-container>
				<i class="bi bi-person-circle fs-3"></i>
			</div>
		</div>
	</header>
</body>
</html>