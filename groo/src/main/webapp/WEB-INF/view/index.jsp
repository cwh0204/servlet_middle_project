<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userId = (String) session.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/index.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/index.js"></script>
</head>
<body>
	<header>
		<img src="./images/로고.png" class="logo_img">
	</header>
	<div class="nevi">
		<ul class="nav nav-fill">
			<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
			<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="#">QNA</a></li>
			<li class="nav-item"><a class="nav-link" href="#">미정</a></li>
		</ul>
	</div>
	<div class=contanier>
		<div class=leftbox>
			<div class="upbox flex_container">
				<img src="./images/열공남.png"> <i
					class="bi bi-person-fill-check"><strong> 스터디를 만들어요!</strong></i>
				<button type="button" class="btn btn-outline-success">스터디
					생성</button>
				<img src="./images/열공녀.png"> <i class="bi bi-people-fill"><strong>
						스터디에 가입해봐요!</strong></i>
				<button type="button" class="btn btn-outline-warning">스터디
					찾기</button>
			</div>
			<div class="downbox flex_container">
			<strong>{}님의 스터디 목록</strong>
				<ul class="list-group">
					<li class="list-group-item list-group-item-primary"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-secondary"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-success"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-danger"><a href="#">팀
							목록</a></li>
					<li class="list-group-item list-group-item-warning"><a
						href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-info"><a href="#">팀
							목록</a></li>
					<li class="list-group-item list-group-item-light"><a href="#">팀
							목록</a></li>
					<li class="list-group-item list-group-item-dark"><a href="#">팀
							목록</a></li>
				</ul>
			</div>
		</div>
		<div class=centerbox1>centerbox1</div>
		<div class="centerbox2">
			<div class="card">
				<div class="card mb-3" style="max-width: 540px;">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="..." class="img-fluid rounded-start" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-body-secondary">Last updated 3 mins
										ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="todo flex_container">
			<strong>{}님의 {}스터디 todo</strong>
				<ul class="list-group">
					<li class="list-group-item active" aria-current="true">An
						active item</li>
					<li class="list-group-item">A second item</li>
					<li class="list-group-item">A third item</li>
					<li class="list-group-item">A fourth item</li>
					<li class="list-group-item">And a fifth one</li>
				</ul>
			</div>
		</div>
</body>
</html>




<!-- <button class="btn btn-groo" type="button">상세정보</button>
					<button class="btn btn-groo" type="button">로그아웃</button> -->