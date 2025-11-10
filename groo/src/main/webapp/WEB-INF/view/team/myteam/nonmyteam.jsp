<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="css/team/myteam/myteamhome.css" rel="stylesheet">
<meta charset="UTF-8">
<title>내 스터디</title>

<style>
/* 1. 🎯 컨테이너가 내부 요소들을 중앙 정렬하도록 설정 */
.content-wrapper {
	width: 100%;
	/* 💡 핵심: 내부의 inline-block (.tip)을 중앙에 배치 */
	text-align: center;
}

.message {
    font-size: 1.7em; 
    font-weight: 700; 
    color: #333333; 
    
    display: block; 
    margin: 40px auto 20px auto; /* 상하 여백 및 좌우 auto로 중앙 정렬 */
    max-width: 80%; /* 중앙 정렬을 위해 너비 제한 */
    
    background: #ffffff; /* 흰색 배경 */
    padding: 25px 35px; /* 내부 여백 */
    border-radius: 10px; /* 둥근 모서리 */
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08); /* 은은한 그림자 */
    
    border-left: 5px solid #4CAF50; 
    
    text-align: left; 
}

.tip {
	font-size: 1.0em;
	font-weight: 400;
	margin-top: 15px;
	margin-bottom: 0;
	line-height: 1.6;
	display: inline-block;
	color: #558B2F;
	background-color: #E8F5E9;
	padding: 10px 20px;
	border-radius: 6px;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<p class="message">현재 참여 중인 스터디가 없습니다.</p>
		<p class="tip">새로운 스터디를 찾아보거나 직접 개설해보세요!</p>
	</div>

</body>
</html>