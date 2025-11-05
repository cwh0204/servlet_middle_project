<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시물</title>
<link href='css/mypage/myboard/myboard.css' rel='stylesheet' /> </head>
<body>
	<div class="page-header">
		<h2>나의 게시물</h2>
	</div>

	<div class="my-board-section">
		<h3 class="board-title">📚 공부 게시물</h3>
		<div class="board-list-container">
			<div class="board-item" data-post-id="101">
				<span class="post-title">CSS Flexbox 복습 자료</span>
				<span class="post-date">2025.11.05</span>
				<span class="post-views">조회 15</span>
			</div>
			<div class="board-item" data-post-id="102">
				<span class="post-title">자바 Optional 사용 예제 질문합니다.</span>
				<span class="post-date">2025.10.28</span>
				<span class="post-views">조회 22</span>
			</div>
			<div class="board-item" data-post-id="103">
				<span class="post-title">스터디 3주차 요약 정리본 공유</span>
				<span class="post-date">2025.10.20</span>
				<span class="post-views">조회 40</span>
			</div>
		</div>
        <div class="more-link-area">
            <a href="studyBoardList.do?writer=me" class="more-link">더 보기 ></a>
        </div>
	</div>

	<hr class="section-divider">

	<div class="my-board-section">
		<h3 class="board-title">🗣️ 자유 게시물</h3>
		<div class="board-list-container">
			<div class="board-item" data-post-id="201">
				<span class="post-title">주말에 다녀온 맛집 추천!</span>
				<span class="post-date">2025.11.03</span>
				<span class="post-views">조회 50</span>
			</div>
			<div class="board-item" data-post-id="202">
				<span class="post-title">팀 회식 장소 추천 받아요!</span>
				<span class="post-date">2025.10.29</span>
				<span class="post-views">조회 35</span>
			</div>
			<div class="board-item" data-post-id="203">
				<span class="post-title">최근 흥미롭게 본 드라마 추천</span>
				<span class="post-date">2025.10.15</span>
				<span class="post-views">조회 60</span>
			</div>
		</div>
        <div class="more-link-area">
            <a href="freeBoardList.do?writer=me" class="more-link">더 보기 ></a>
        </div>
	</div>
</body>
</html>