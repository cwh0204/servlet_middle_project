<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/adminCss/adminnav.css" rel="stylesheet">
<title></title>
</head>
<body>
	<div class="a_l_container">
		<div class="a_l_logo_box flex_container">
			<img class="logo" src="./images/로고.png">
		</div>
		<div class="a_l_btn_box">
			<div class="border_box n_b_c">
				<ul class="u_nav_ul">
					<li><a href="#" data-page="home.html">사이트 관리</a></li>
					<li><i class="bi bi-bar-chart color"></i><a href="./admin.do"
						data-page="home.html">통계</a></li>
					<li><i class="bi bi-person"></i><a href="./adminuser.do"
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
</body>
</html>