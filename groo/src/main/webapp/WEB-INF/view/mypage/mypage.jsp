<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="css/base.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="js/adminComponent.js"></script>
<style>

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
	<%@ include file="../frontComponents/mainheader.jsp"%>
	<div class="flex_container full_w_h mypage_container">
 		<%@ include file="../frontComponents/mypagenav.jsp"%>
		<div class="a_r_container">
  			<%@ include file="mypagedashboard.jsp"%>
		</div>
	</div>
</body>
</html>