<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	gap : 30px;
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
</style>
</head>
<body>
	<header>
		<div class="flex_container heder_container">
			<img class="logo" src="./images/로고.png">
			<div class="flex_container main_kategorie_box">
				<div>공지사항</div>
				<div>자유게시판</div>
				<div>about us</div>
				<div>성과(전체)게시판</div>
				<div>스터디 생성</div>
			</div>
			<div class="flex_container main_user_box">
				<div>Login</div>
				<div>SignUp</div>
			</div>
		</div>
	</header>
</body>
</html>