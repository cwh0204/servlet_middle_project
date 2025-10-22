<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/main.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">

<script src="jquery/jquery-3.7.1.min.js"></script>

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/mainComponent.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	mainHome();
	mainHeder();
	refreshPage();
	
	// 네이버 소셜로그인 확인용
	const naverServiceResponse = '${sessionScope.naverServiceResponse}';
	if(naverServiceResponse !== '' && naverServiceResponse !== 'null'){
		const responseObject = JSON.parse(naverServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용	
	}
	
	// 깃허브 소셜로그인 확인용
 	const gitHubServiceResponse = '${sessionScope.gitHubServiceResponse}';
	if(gitHubServiceResponse !== '' && gitHubServiceResponse !== 'null'){
		const responseObject = JSON.parse(gitHubServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용	
	}
	
	//카카오 소셜로그인 확인용
 	const kakaoServiceResponse = '${sessionScope.kakaoServiceResponse}';
	if(kakaoServiceResponse !== '' && kakaoServiceResponse !== 'null'){
		const responseObject = JSON.parse(kakaoServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용
	}
	
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