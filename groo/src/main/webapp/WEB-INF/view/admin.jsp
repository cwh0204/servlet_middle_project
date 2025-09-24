<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="css/base.css" rel="stylesheet">
<style>
.a_l_container {
	background-color: aliceblue;
	width: 300px;
	height: 100%;
}

.a_r_container {
	width: calc(100% - 300px);
	height: 100%;
}

.a_l_logo_box {
	height: 100px;
}

.a_l_btn_box {
	height: calc(100% - 100px);
}

.a_r_t_box {
	height: 100px;
}

.a_r_m_box {
	height: calc(60% - 50px);
}

.a_r_b_box {
	height: calc(40% - 50px);
}

.a_r_l_item {
	width: 70%;
	height: 100%;
}

.a_r_r_item {
	width: 30%;
	height: 100%;
}

.logo{
	width:250px;
}
</style>

<body>
	<div class="flex-container full-w-h">
		<div class="a_l_container">
			<div class="a_l_logo_box flex-container">
				<img class="logo" src="./images/로고.png">
			</div>
			<div class="a_l_btn_box">
				<ul>
					<li><a href="#" data-page="home.html">홈</a></li>
					<li><a href="#" data-page="about.html">소개</a></li>
					<li><a href="#" data-page="contact.html">연락처</a></li>
				</ul>
			</div>
		</div>
		<div class="a_r_container">
			<div class="a_r_t_box"></div>
			<div class="a_r_m_box flex-container">
				<div class="a_r_l_item"></div>
				<div class="a_r_r_item"></div>
			</div>
			<div class="a_r_b_box flex-container">
				<div class="a_r_l_item"></div>
				<div class="a_r_r_item"></div>
			</div>
		</div>
	</div>
</body>
</html>