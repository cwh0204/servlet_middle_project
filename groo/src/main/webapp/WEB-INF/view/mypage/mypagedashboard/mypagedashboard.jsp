<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>

<link href="css/mypage/mypage.css" rel="stylesheet">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css'
	rel='stylesheet' />
<link href='css/mypage/mypagedashboard/mypagedashboard.css'
	rel='stylesheet' />

<script src="jquery/jquery-3.7.1.min.js"></script>

<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.min.js'></script>

<script src="js/mypage/mypagedashboard/mypagedashboard.js"></script>

</head>
<body>
	<div class="mypagecontainer">
		<%@ include file="../mypagenav.jsp"%>
		<div class="mypagecontent">
			<div id='fullCalendar'></div>
		</div>
	</div>
</body>
</html>