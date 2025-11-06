<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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

/* 테이블 스타일 */
.reply-table {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.95em;
}

.reply-table th, .reply-table td {
	border: 1px solid #dee2e6;
	padding: 15px;
	text-align: left;
}

.reply-table th {
	background-color: #e9ecef;
	color: #495057;
	font-weight: 600;
}

.reply-table tr:hover {
	background-color: #f0f8ff;
}

/* 링크 스타일 */
.reply-table a {
	color: #007bff;
	text-decoration: none;
	transition: color 0.2s;
}

.reply-table a:hover {
	color: #0056b3;
	text-decoration: underline;
}

/* 컬럼 너비 조정 (번호 부분 10% 유지) */
.reply-table th:nth-child(1), .reply-table td:nth-child(1) {
	width: 10%; /* 번호 너비 */
	text-align: center;
}

.reply-table th:nth-child(4), .reply-table td:nth-child(4) {
	width: 15%; /* 작성일 너비 */
}

.reply-table td:nth-child(2) {
	max-width: 350px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
} /* 댓글 내용 너비 */
</style>
<body>
</head>
<body>
	<div class="container">
		<h2>나의 댓글 목록</h2>

		<table class="reply-table">
			<tbody>
				<tr>
					<td>1</td>
					<td>순서 보장이 정말 중요하죠. 깔끔하게 정리 감사합니다.</td>
					<td><a href="#">자바스크립트 비동기 처리 핵심</a></td>
					<td>2025-11-05</td>
				</tr>
				<tr>
					<td>2</td>
					<td>저도 AS alias 때문에 고생했는데, 덕분에 해결했어요!</td>
					<td><a href="#">Spring DTO 매핑 오류 해결법</a></td>
					<td>2025-11-04</td>
				</tr>
				<tr>
					<td>3</td>
					<td>Flexbox는 사랑입니다. 좋은 예시들이 많네요.</td>
					<td><a href="#">CSS Flexbox 완벽 가이드</a></td>
					<td>2025-11-03</td>
				</tr>
				<tr>
					<td>4</td>
					<td>MyBatis 설정에 대한 내용이 상세해서 많은 도움이 되었습니다. 감사합니다.</td>
					<td><a href="#">개발자 Q&A 게시판 - 오류 문의</a></td>
					<td>2025-11-02</td>
				</tr>
			</tbody>
		</table>

	</div>

</body>


</html>