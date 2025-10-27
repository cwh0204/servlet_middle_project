<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="css/base.css" rel="stylesheet">
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
<body>
	<div class="flex_container full_w_h mypage_container">
  		<%@ include file="../frontComponents/mypagenav.jsp"%>
		<div class="a_r_container">
  			<%@ include file="mypagedashboard.jsp"%>
		</div>
	</div>
</body>
</html>