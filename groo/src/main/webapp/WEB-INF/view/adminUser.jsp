<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="css/base.css" rel="stylesheet">
<link href="css/adminnav.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<style>
</style>
</head>
<body>
	<div class="flex_container full_w_h">
		<div class="a_l_container">
			<div class="a_l_logo_box flex_container">
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
			<div id="grid"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : {
			api : {
				readData : {
					url : 'https://koreanjson.com/users',
					method : 'GET',
				}
			},
		},
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : 'ID',
			name : 'id'
		}, {
			header : '이름',
			name : 'name'
		}, {
			header : '유저',
			name : 'username'
		}, {
			header : '이메일',
			name : 'email'
		}, {
			header : '전화번호',
			name : 'phone'
		} ]
	});

	grid.on('response', function(ev) {
		let response = ev.xhr.responseText;
		let data = JSON.parse(response);
		grid.resetData(data);
	});
</script>
</html>