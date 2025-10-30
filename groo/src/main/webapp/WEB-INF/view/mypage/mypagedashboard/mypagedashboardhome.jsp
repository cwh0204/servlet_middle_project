<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage/mypagedashboard/mypagedashboard.css"
	rel="stylesheet">
</head>
<body>

	<table class="calendar">
		<caption>
			<h2>2025년 10월</h2>
		</caption>
		<thead>
			<tr class="day-name">
				<th class="sunday">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th class="saturday">토</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="sunday"><span class="date-number">19</span></td>
				<td><span class="date-number">20</span></td>
				<td><span class="date-number">21</span>
					<div class="schedule-list">
						<div class="schedule-item">팀 회의 (오전)</div>
					</div></td>
				<td><span class="date-number">22</span></td>
				<td><span class="date-number">23</span>
					<div class="schedule-list">
						<div class="schedule-item">프로젝트 마감</div>
						<div class="schedule-item">고객 미팅</div>
					</div></td>
				<td><span class="date-number">24</span></td>
				<td class="saturday"><span class="date-number">25</span></td>
			</tr>
			<tr>
				<td class="sunday"><span class="date-number">26</span></td>
				<td><span class="date-number">27</span>
					<div class="schedule-list">
						<div class="schedule-item">월요일 업무</div>
					</div></td>
				<td><span class="date-number">28</span></td>
				<td><span class="date-number">29</span>
					<div class="schedule-list">
						<div class="schedule-item">병원 예약</div>
					</div></td>
				<td class="today"><span class="date-number">30</span>
					<div class="schedule-list">
						<div class="schedule-item"
							style="background-color: #f8d7da; color: #721c24;">발표 준비</div>
					</div></td>
				<td><span class="date-number">31</span></td>
				<td class="saturday"><span class="date-number">1</span></td>
			</tr>
		</tbody>
	</table>
</body>
</html>