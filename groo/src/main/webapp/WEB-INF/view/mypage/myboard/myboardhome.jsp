<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시물 목록</title>
<link href='css/mypage/myboard/myboard.css' rel='stylesheet' />
<style>
/* =======================================================
   CSS 스타일: .board-table 사용
   ======================================================= */
.container {
	width: 85%;
	max-width: 1200px;
	margin: 40px auto;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

h2 {
	font-size: 1.8em;
	color: #333;
	border-bottom: 3px solid #4CAF50;
	padding-bottom: 10px;
	margin-bottom: 25px;
}

/* 테이블 스타일: .board-table */
.board-table {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.95em;
}

.board-table th, .board-table td {
	border: 1px solid #dee2e6;
	padding: 15px;
	text-align: left;
}

.board-table th {
	background-color: #e9ecef;
	color: #495057;
	font-weight: 600;
}

.board-table tr:hover {
	background-color: #f0f8ff;
}

/* 링크 스타일 */
.board-table a {
	color: #007bff;
	text-decoration: none;
	transition: color 0.2s;
}

.board-table a:hover {
	color: #0056b3;
	text-decoration: underline;
}

/* 컬럼 너비 조정 */
.board-table th:nth-child(1), .board-table td:nth-child(1) {
	width: 10%; /* 번호 너비 */
	text-align: center;
}

.board-table td:nth-child(2) {
	max-width: 450px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.board-table th:nth-child(3), .board-table td:nth-child(3) {
	width: 15%; /* 작성일 */
}

/* 현재 HTML에는 조회수가 없으므로, 4번째 컬럼은 CSS에서 임시로 제거하거나 조정합니다.
   테이블 헤더(<th>)와 바디(<td>)의 개수를 3개로 맞춥니다. */
</style>
</head>
<body>

	<div class="container">
		<h2>나의 게시물 목록</h2>

		<table class="board-table">
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="boardDetail.do?postId=102">C++ 벡터 메모리 할당 관련
							질문드립니다.</a></td>
					<td>공부</td>
					<td>2025-11-05</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="boardDetail.do?postId=103">MySQL 성능 튜닝 팁 공유
							(인덱스 최적화)</a></td>
					<td>공부</td>
					<td>2025-11-04</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="boardDetail.do?postId=201">점심 메뉴 추천 받아요!</a></td>
					<td>자유</td>
					<td>2025-11-03</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href="boardDetail.do?postId=202">퇴근 후 코딩 국룰인가요?</a></td>
					<td>자유</td>
					<td>2025-10-30</td>
				</tr>
				<tr>
					<td>5</td>
					<td><a href="boardDetail.do?postId=203">맥북 vs 윈도우 개발 환경 추천</a>
					</td>
					<td>자유</td>
					<td>2025-10-25</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>