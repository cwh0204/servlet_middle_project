<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userId = (String) session.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/index.js"></script>
</head>
<body>
	<div class=nevi>
		<header>
			<img src="./images/로고.png">
		</header>
		<ul class="nav nav-pills nav-fill">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">Active</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Much
					longer nav link</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#"
				tabindex="-1" aria-disabled="true">Disabled</a></li>
		</ul>
	</div>
	<div class=contanier>
		<div class=leftbox>
			leftbox
			<div class=upbox>upbox</div>
			<div class=downbox>downbox</div>
		</div>
		<div class=centerbox1>centerbox1</div>
		<div class=centerbox2>
			<div class="card">
				<div class="card-header">Featured</div>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>




<!-- <button class="btn btn-groo" type="button">상세정보</button>
					<button class="btn btn-groo" type="button">로그아웃</button> -->