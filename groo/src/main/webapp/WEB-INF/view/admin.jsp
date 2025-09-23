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
	background-color: red;
	width: calc(100% - 300px);
	height: 100%;
}

.a_l_logo_box {
	height: 100px;
	background-color: bisque;
}

.a_l_btn_box {
	height: calc(100% - 100px);
	background-color: blue;
}

.a_r_t_box {
	height: 100px;
	background-color: cadetblue;
}

.a_r_m_box {
	height: calc(60% - 50px);
	background-color: aquamarine;
}
.a_r_b_box {
	height: calc(40% - 50px);
	background-color: aquamarine;
}
.a_r_l_item{
	width: 70%;
    height: 100%;
    background-color: black;
}
.a_r_r_item{
	width: 30%;
    height: 100%;
    background-color: pink;
}
</style>

<body>
	<div class="flex-container full-w-h">
		<div class="a_l_container">
			<div class="a_l_logo_box"></div>
			<div class="a_l_btn_box"></div>
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