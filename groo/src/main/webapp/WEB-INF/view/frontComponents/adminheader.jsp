<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
header {
	background: linear-gradient(135deg, #2d6a4f 0%, #40916c 100%);
	padding: 0;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.flex_container.heder_container {
	justify-content: space-between;
	height: 70px;
	padding: 0 35px;
}

.logo {
	width: 180px;
}

.heder_container span {
	font-weight: bold;
	font-size: 20px;
	color: white;
}
</style>
</head>
<body>
	<header>
		<div class="flex_container heder_container">
			<img class="logo" src="./images/로고.png"> <span>관리자 대시보드</span>
		</div>
	</header>
</body>
<script type="text/javascript">

</script>
</html>