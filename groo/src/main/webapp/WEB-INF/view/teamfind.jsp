<%@ page contentType="text/html; charset=UTF-8"%>
<!-- teamfind.do -->
<!DOCTYPE html>
<html>
<head>
<link href="css/teamfind.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title></title>

</head>
<body>
	<header class="L_container">
		<img src="./images/로고.png">
		<div class="searchbar">
			<input type="text" class="form-control"
				placeholder="find the group you're looking for"
				aria-label="Recipient's username" aria-describedby="basic-addon2">
			<button type="button" class="btn btn-success">searching</button>
		</div>
		<nav class="header-nav">
			<ol>
				<li>about</li>
				<li>Logout</li>
			</ol>
		</nav>
	</header>
	<main class="m_container">

		<div class="text-row">
			<div class="text1">Create Group</div>
			<div class="text2">My Page</div>
			<div class="text3">Archive</div>
			<div class="text4">Interview</div>
		</div>

		<div class="slidebox">
			<div id="carouselExampleIndicators" class="carousel slide custom_c_s"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="3" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="4" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="./images/group.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="./images/Ai.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="./images/개발자들2.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="./images/개발자3.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="./images/개발자들1.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="cartegory-line">
			<div class="cartegory-box">
				<div class="text-row2">
					<div class="text1">Development</div>
					<div class="text2">Editing</div>
					<div class="text3">Language</div>
					<div class="text4">Marketing</div>
					<div class="text5">Design</div>
				</div>

				<div class="teamimage">
					<div class="team-card">
						<img src="./images/dev1.jpg">
						<div class="caption-top">개발자 공부모임</div>
						<div class="caption-bottom">개발자 공부모임모임 간단 설명@@@@@@@@@@@@@@@@@@@@@@@@@@@@
						@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</div>
					</div>

					<div class="team-card">
						<img src="./images/dig.jpg">
						<div class="caption-top">디자인 공부모임</div>
						<div class="caption-bottom">웹디 같이 공부해요</div>
					</div>

					<div class="team-card">
						<img src="./images/arc2.jpg">
						<div class="caption-top">건축 공부모임</div>
						<div class="caption-bottom">실내건축기사 준비중!</div>
					</div>

					<div class="team-card">
						<img src="./images/video.jpg">
						<div class="caption-top">영상편집 공부모임</div>
						<div class="caption-bottom">영상편집 30일 완성하고 싶은 사람만</div>
					</div>

					<div class="team-card">
						<img src="./images/meta.jpg">
						<div class="caption-top">메타버스 공부모임</div>
						<div class="caption-bottom">메타버스 기초부터 차근히 공부해봐요</div>
					</div>

				</div>
			</div>
		</div>
	</main>
	<footer class="f_container"> </footer>



</body>
</html>