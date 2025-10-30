<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOAST UI Simple Calendar</title>
    
    <link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
    
    <style>
        /* 캘린더가 제대로 보이도록 높이를 지정해 줍니다. */
        #calendar {
            height: 700px;
            max-width: 1000px;
            margin: 50px auto;
        }
    </style>
</head>
<body>

    <div id="calendar"></div>

    <script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 3. Calendar 클래스를 가져옵니다.
            const Calendar = tui.Calendar; 
            const container = document.getElementById('calendar');

            // 4. 최소한의 옵션으로 캘린더 인스턴스를 생성합니다.
            const calendar = new Calendar(container, {
                // 월간(month) 뷰를 기본으로 설정합니다.
                defaultView: 'month',
                // 현재 시간을 기준으로 달력이 초기화됩니다.
            });
            
            // 5. 달력 제목을 콘솔에 출력 (디버깅용)
            console.log("Calendar initialized:", calendar.getDate());
        });
    </script>
</body>
</html>