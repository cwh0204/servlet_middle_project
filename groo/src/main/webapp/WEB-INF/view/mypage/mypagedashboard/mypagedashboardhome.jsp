<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FullCalendar JSP 통합</title>

<script src="jquery/jquery-3.7.1.min.js"></script>
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css'
	rel='stylesheet' />
<link href='css/mypage/mypagedashboard/mypagedashboard.css'
	rel='stylesheet' />

<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.min.js'></script>

<script src="js/mypage/mypagedashboard/mypagedashboard.js"></script>

</head>
<body>
	<div id='fullCalendar'></div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		const memLoginId = sessionStorage.getItem('userId');

		// 1. 달력 초기화
		initFullCalendar();

		$.ajax({
			url : 'myvote.do',
			type : 'POST',
			dataType : 'json',
			data : {
				memLoginId : memLoginId
			},

			success : function(response) {
				console.log("서버 응답:", response);

				const calendarEvents = response.map(function(voteItem) {
                    
                    const startDate = voteItem.voteEnd;
                    
                    const endDateObject = new Date(voteItem.voteEnd);
                    
                    endDateObject.setDate(endDateObject.getDate() + 7);

                    const endDate = endDateObject.toISOString().slice(0, 19).replace('T', ' ');

					return {
						id : voteItem.voteId, 
						title : voteItem.voteTitle, 
						start : startDate, 
						end : endDate,    
						allDay : false,

						extendedProps : {
							content : voteItem.voteContent,
							nickname : voteItem.memNick,
							role : voteItem.studyRoll,
							okCount : voteItem.voteOk
						}
					};
				});

				if (window.calendar) {
					window.calendar.removeAllEvents(); 
					window.calendar.addEventSource(calendarEvents); 
					window.calendar.render(); 
				} else {
                    console.error("FullCalendar 객체를 찾을 수 없습니다. initFullCalendar() 함수를 확인하세요.");
                }
			},

			error : function(request, status, error) {
				console.error("AJAX Error:", status, error);
			}
		});
	});
</script>
</html>