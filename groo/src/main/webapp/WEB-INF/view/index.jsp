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
	<header>
		<img src="./images/로고.png">
	</header>
	<div class=nevi>
		<ul class="nav nav-pills nav-fill">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">공지사항</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">자유게시판</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">QNA</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">미정</a></li>
		</ul>
	</div>
	<div class=contanier>
		<div class=leftbox>
			leftbox
			<div class=upbox>upbox</div>
			<div class=downbox>
				downbox
				<ul class="list-group">
					<li class="list-group-item">팀 목록</li>
					<li class="list-group-item list-group-item-primary">팀 목록</li>
					<li class="list-group-item list-group-item-secondary">팀 목록</li>
					<li class="list-group-item list-group-item-success">팀 목록</li>
					<li class="list-group-item list-group-item-danger">팀 목록</li>
					<li class="list-group-item list-group-item-warning">팀 목asdas록</li>
					<li class="list-group-item list-group-item-info">팀 목록</li>
					<li class="list-group-item list-group-item-light">팀 목록</li>
					<li class="list-group-item list-group-item-dark">팀 목록</li>
				</ul>
			</div>
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