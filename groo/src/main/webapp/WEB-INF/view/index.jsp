<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<img src="./images/로고.png" class="logo_img"> <a href="/logout"> <i class="bi bi-box-arrow-right"></i>
		</a>
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
				<img src="./images/열공남.png"> <i class="bi bi-person-fill-check"><strong> 스터디를 만들어요!</strong></i>
				<button type="button" class="btn btn-outline-success">스터디 생성</button>
				<img src="./images/열공녀.png"> <i class="bi bi-people-fill"><strong> 스터디에 가입해봐요!</strong></i>
				<button type="button" class="btn btn-outline-warning">스터디 찾기</button>
			</div>
			<div class="downbox flex_container">
				<strong>님의 스터디 목록</strong>
				<ul class="list-group">
					<li class="list-group-item list-group-item-primary"><a href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-secondary"><a href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-success"><a href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-danger"><a href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-warning"><a href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-info"><a href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-light"><a href="#">팀 목록</a></li>
					<li class="list-group-item list-group-item-dark"><a href="#">팀 목록</a></li>
				</ul>
			</div>
		</div>
		<div class="centerbox">
			<div class="study">
				<div class=hotstudy>
					<h3>🔥 인기 스터디</h3>
				</div>
				<div class=newstudy>newstudy</div>
			</div>
			<div class="board">
				<div class=hotboard>
					<div class="marquee-guide-text">📢 GROO의 가장 핫한 글을 확인하세요!</div>
					<div class="hotboard-marquee-wrap">
						<ul id="popular-posts">
							<li>인기글 제목 1</li>
							<li>인기글 제목 2</li>
							<li>인기글 제목 3</li>
							<li>인기글 제목 4</li>
							<li>인기글 제목 5</li>
						</ul>
					</div>
				</div>
				<div class=find>
					<div class="find-guide-text">💡 새로운 스터디원을 찾습니다!</div>
					<div class="find-marquee-wrap">
						<ul id="find-posts">
							<li>찾는 멤버 목록 1</li>
							<li>찾는 멤버 목록 2</li>
							<li>찾는 멤버 목록 3</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>