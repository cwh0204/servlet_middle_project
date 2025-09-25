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
	<header class="logolineConainer">
		<img src="./images/로고.png">

		<ol>
			<li>MyPage</li>
			<li>Archive</li>
			<li>Logout</li>
		</ol>
	</header>

	<div class="barbutton">
		<input type="text" class="form-control"
			placeholder="find the group you're looking for"
			aria-label="Recipient's username" aria-describedby="basic-addon2">
		<button type="button" class="btn btn-success">searching</button>
	</div>
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
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


</body>
</html>