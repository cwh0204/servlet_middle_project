<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="css/base.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style>

body {
	min-width: 1080px;
}
.admin_container {
	height: calc(100% - 70px);
}

.a_r_container {
	width: calc(100% - 260px);
	height: 100%;
	background: #f8faf9;
	padding: 30px 40px;
	overflow: scroll;
	overflow-x: hidden;
}

</style>
<script src="jquery/jquery-3.7.1.min.js"></script>
<body>
	<%@ include file="adminHeader.jsp"%>
	<div class="flex_container full_w_h admin_container">
		<%@ include file="adminNav.jsp"%>
		<div class="a_r_container">
 			<%@ include file="adminDashboard.jsp"%>
		</div>
	</div>
</body>
<script type="text/javascript">
window.chartColl();
</script>
</html>