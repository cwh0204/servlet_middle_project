<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/board/boardtable.css" rel="stylesheet">
</head>
<body>
<%@ include file="noticesearch.jsp"%>
	<table class="table table-hover">
		<thead class="table-light">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">게시자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				<th scope="col">댓글</th>
				<th scope="col">좋아요</th>
			</tr>
		</thead>
		<tbody>
			<tr class="table-success">
				<th scope="row">필독</th>
				<td>**[긴급]** 개인정보 보호를 위한 비밀번호 변경 권고</td>
				<td>관리자</td>
				<td>2025.10.22</td>
				<td>2,500</td>
				<td>15</td>
				<td>32</td>
			</tr>
			<tr>
				<th scope="row">10</th>
				<td>101010</td>
				<td>김00</td>
				<td>2025.10.15</td>
				<td>870</td>
				<td>5</td>
				<td>18</td>
			</tr>
			<tr>
				<th scope="row">9</th>
				<td>999</td>
				<td>이00</td>
				<td>2025.10.10</td>
				<td>1,120</td>
				<td>12</td>
				<td>55</td>
			</tr>
			<tr>
				<th scope="row">8</th>
				<td>888</td>
				<td>박00</td>
				<td>2025.10.05</td>
				<td>450</td>
				<td>3</td>
				<td>10</td>
			</tr>
			<tr>
				<th scope="row">7</th>
				<td>777</td>
				<td>최00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>8</td>
				<td>22</td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td>666</td>
				<td>정00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>0</td>
				<td>1</td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>555</td>
				<td>윤00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>1</td>
				<td>3</td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>444</td>
				<td>장00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>4</td>
				<td>14</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>333</td>
				<td>신00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>7</td>
				<td>25</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>222</td>
				<td>임00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>2</td>
				<td>8</td>
			</tr>
			<tr>
				<th scope="row">1</th>
				<td>111</td>
				<td>고00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>1</td>
				<td>4</td>
			</tr>
		</tbody>
	</table>
</body>
</html>