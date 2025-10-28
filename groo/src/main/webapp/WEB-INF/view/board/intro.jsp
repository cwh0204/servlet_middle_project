<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7b6fdb32b38b5fe3f3519e23177d5fb&autoload=false"></script>
<script src="js/board/intro.js"></script>
<link href="css/board/intro.css" rel="stylesheet">
<meta charset="UTF-8">
<title> </title>
</head>
<body>

<section class="main">
	<img src="images/intro-study.png" alt="Groo 스터디 그룹">
	<div class="main-text">
		<h1>함께 성장하는 모두의 공간, Groo</h1>
		<p>
		    혼자 들어와도 OK, 여러명이 들어와도 OK<br>
		    누구든지 OK, 분야 상관없이 OK<br>
		    내가 원하는 주제로 스터디 GO❗ GO❗
		</p>
	</div>
	
	<!-- 스크롤 유도 화살표 -->
	<a href="#intro" class="scroll-down">&#x2193;</a>
</section> 

<section class="intro" id="intro">
    <h2>Groo는 스터디 플랫폼입니다.</h2>
    <div class="intro-cards">
        <div class="card">
            <h3>스터디 생성</h3>
            <p>스터디를 생성하고 팀원을 모집할 수 있어요.</p>
        </div>
        <div class="card">
            <h3>투표 & 참여</h3>
            <p>팀원들이 주제를 제안하고 투표로 원하는 주제를 선정할 수 있어요.</p>
        </div>
        <div class="card">
            <h3>결과 공유</h3>
            <p>스터디 결과물을 공유하고 함께 성장할 수 있어요.</p>
        </div>
    </div>
    <p class="footer-msg">
        Groo에서 팀스터디를 진행하며 필요한 것을 배우고 성장하세요.<br>
        당신의 성장을 늘 응원합니다.<br>
        - Groo 일동 올림
    </p>
</section>

<section class="map-section" id="map">
    <h2>Groo 위치</h2>
    <div id="map-container"></div>
</section>

</body>
</html>