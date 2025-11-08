<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FullCalendar JSP 통합</title>
</head>
<body>
	<div id='fullCalendar'></div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		
        // 🌟 1. initFullCalendar()를 DOM 준비 시점에 호출 🌟
        //    (이 함수가 mypagedashboard.js 파일에 정의되어 있어야 합니다.)
        if (typeof initFullCalendar === 'function') {
            initFullCalendar();
        } else {
             console.error("initFullCalendar 함수가 정의되지 않았습니다. mypagedashboard.js 파일을 확인하세요.");
             return;
        }

		const memLoginId = sessionStorage.getItem('userId');

		$.ajax({
			url : 'myvote.do',
			type : 'POST',
			dataType : 'json',
			data : {
				memLoginId : memLoginId
			},

			success : function(response) {
				console.log("서버 응답:", response);
                
                // 🌟 초록, 노랑 색상 정의 🌟
                const colors = [
                    { bgColor: '#66BB6A', bdColor: '#388E3C', txtColor: '#FFFFFF' }, // 초록
                    { bgColor: '#FFEB3B', bdColor: '#FFC107', txtColor: '#000000' }  // 노랑
                ];

				const calendarEvents = response.map(function(voteItem, index) { // 🌟 index 사용
                    
                    const startDate = voteItem.voteEnd;
                    const endDateObject = new Date(voteItem.voteEnd);
                    endDateObject.setDate(endDateObject.getDate() + 7);
                    const endDate = endDateObject.toISOString().slice(0, 19).replace('T', ' ');
                    
                    // 색상 순환 적용
                    const colorData = colors[index % colors.length];

					return {
						id : voteItem.voteId, 
						title : voteItem.voteTitle, 
						start : startDate, 
						end : endDate,    
						allDay : false,
                        
                        // 🌟 계산된 색상 적용 🌟
                        backgroundColor: colorData.bgColor, 
                        borderColor: colorData.bdColor,
                        textColor: colorData.txtColor, 

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