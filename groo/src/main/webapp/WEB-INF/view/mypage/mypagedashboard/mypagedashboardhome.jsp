<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>HTML/CSS 캘린더 구조</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/mypage/mypagedashboard/mypagedashboard.js"></script>
<link rel="stylesheet" href="css/mypage/mypagedashboard/mypagedashboard.css">
</head>
<body>
	<div id="page-wrapper">
		<div id="calendar-container">

			<div class="calendar-header">
				<button id="prev-month-btn" class="nav-btn">◀</button>
				<span id="month-year-display" class="month-year"></span>
				<button id="next-month-btn" class="nav-btn">▶</button>
			</div>

			<div class="weekdays">
				<div class="day-name sunday">일</div>
				<div class="day-name">월</div>
				<div class="day-name">화</div>
				<div class="day-name">수</div>
				<div class="day-name">목</div>
				<div class="day-name">금</div>
				<div class="day-name saturday">토</div>
			</div>

			<div id="days-grid" class="days-grid"></div>
		</div>
	</div>