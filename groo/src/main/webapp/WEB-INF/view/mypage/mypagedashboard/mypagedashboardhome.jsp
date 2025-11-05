<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FullCalendar JSP 통합</title>

    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
    <script src="js/mypage/mypagedashboard/mypagedashboard.js"></script>
    
    <style>
        #fullCalendar {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            
            /* 캘린더 영역 강제 높이 지정 */
            height: 700px; 
        }
    </style>
</head>
<body>

    <div id='fullCalendar'>
        </div>

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.min.js'></script>
</body>
<script type="text/javascript">
$(document).ready(function() {
	initFullCalendar();
});
</script>
</html>
