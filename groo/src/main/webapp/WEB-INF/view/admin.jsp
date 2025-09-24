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
	width: 300px;
	height: 100%;
}

.a_r_container {
	width: calc(100% - 300px);
	height: 100%;
}

.a_l_logo_box {
	height: 100px;
	padding: 20px;
}

.a_l_btn_box {
	height: calc(100% - 100px);
	padding: 20px;
}

.a_r_t_box {
	height: 100px;
	padding: 20px;
}

.a_r_m_box {
	height: calc(60% - 50px);
	padding: 20px;
}

.a_r_b_box {
	height: calc(40% - 50px);
	padding: 20px;
}

.a_r_l_item {
	width: 70%;
	height: 100%;
	border: solid 1px #ebebeb;
	border-radius: 20px;
}

.a_r_r_item {
	width: 30%;
	height: 100%;
	border: solid 1px #ebebeb;
	border-radius: 20px;
	margin-left: 20px;
}

.logo {
	width: 250px;
}

.u_nav_ul {
	padding-top: 50px;
	display: flex;
	flex-direction: column;
}

.u_nav_ul li {
	/* 	background-color: #03c75a; */
	border-radius: 8px;
	height: 70px;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	padding: 0 30px 0px 30px;
	margin: 0 10px 30px 10px;
	font-size: 20px;
}

.u_nav_ul li a {
	width: 100%;
	padding-left: 20px;
	color: white;
}

a {
	text-decoration-line: none;
}
.n_b_c{
	background-color: darkseagreen;
}
.border_box {
	width: 100%;
	height: 100%;
	border: solid 1px #ebebeb;
	border-radius: 20px;
}
</style>

<body>
	<div class="flex-container full-w-h">
		<div class="a_l_container">
			<div class="a_l_logo_box flex-container">
				<img class="logo" src="./images/로고.png">
			</div>
			<div class="a_l_btn_box">
				<div class="border_box n_b_c">
					<ul class="u_nav_ul">
						<li><a href="#" data-page="home.html">사이트 관리</a></li>

						<li><i class="bi bi-bar-chart color"></i><a href="#"
							data-page="home.html">통계</a></li>
						<li><i class="bi bi-person"></i><a href="#"
							data-page="about.html">사용자 관리</a></li>
						<li><i class="bi bi-people"></i><a href="#"
							data-page="contact.html">팀 관리</a></li>
						<li><i class="bi bi-clipboard2-check"></i><a href="#"
							data-page="contact.html">게시판 관리</a></li>
						<li><i class="bi bi-bell"></i><a href="#"
							data-page="contact.html">공지사항 관리</a></li>
					</ul>
				</div>
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