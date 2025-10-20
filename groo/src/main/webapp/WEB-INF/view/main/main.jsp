<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/main.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="js/mainComponent.js"></script>
<script src="js/main.js"></script>
<script src="jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	mainHome();
	mainHeder();
	refreshPage();
});
</script>
</head>
<body>
	<%@ include file="../frontComponents/mainheader.jsp"%>
	<main>
		<%@ include file="./mainhome.jsp"%>
	</main>
</body>
</html>