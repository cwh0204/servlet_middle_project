<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FullCalendar JSP 통합</title>

    <script src="jquery/jquery-3.7.1.min.js"></script> 
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
    <link href='css/mypage/mypagedashboard/mypagedashboard.css' rel='stylesheet' />
    
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script> 
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.min.js'></script> 
    
    <script src="js/mypage/mypagedashboard/mypagedashboard.js"></script>
    
</head>
<body>
	<div id='fullCalendar'></div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	initFullCalendar(); 
});
</script>
</html>