<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="css/base.css">
</head>
<body>
	<%@ include file="mainheader.jsp"%>
	<div class="full_w_h" id="contentArea">
	<%@ include file="mainhome.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	const loginServiceResponse = '${sessionScope.loginServiceResponse}';
	if(loginServiceResponse !== '' && loginServiceResponse !== 'null'){
		const serviceResponseJsonString = '${sessionScope.loginServiceResponse}'; //소셜로그인 테스트용
		console.log(serviceResponseJsonString);
	}
});
</script>
</html>