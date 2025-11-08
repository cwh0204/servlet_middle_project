/**
 * FullCalendar를 초기화하고 window.calendar 객체를 전역적으로 생성합니다.
 */
function initFullCalendar() {
	var calendarEl = document.getElementById('fullCalendar');
    
	if (!calendarEl) {
		console.error("Error: 'fullCalendar' ID를 가진 요소를 찾을 수 없습니다.");
		return;
	}

	const today = new Date();
	const year = today.getFullYear();
	const month = String(today.getMonth() + 1).padStart(2, '0');
	const day = String(today.getDate()).padStart(2, '0');
	const dynamicInitialDate = `${year}-${month}-${day}`;

	window.calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		initialDate: dynamicInitialDate,
		locale: 'ko', 
		editable: true,
		selectable: true,

		eventClick: function(info) {
			const isTeamEvent = info.event.extendedProps.isTeamEvent || false;
            const nickname = info.event.extendedProps.nickname;
            const content = info.event.extendedProps.content;
            
            if (info.event.id && !isTeamEvent) { 
                alert(
                    `[투표 일정] ${info.event.title}\n` +
                    `작성자: ${nickname}\n` +
                    `내용: ${content}\n` + 
                    `시작: ${info.event.startStr}\n` +
                    `종료: ${info.event.endStr || '미정'}`
                );
            } else if (isTeamEvent) {
				alert(`[팀 일정] ${info.event.title}\n시작 날짜: ${info.event.startStr}`);
			}
		},

		events: [
			{
				title: '주간 스터디 회의',
				start: dynamicInitialDate,
				color: '#d1ecf1',
				textColor: '#4CAF50',
				extendedProps: { isTeamEvent: true }
			}
		]
	});

	window.calendar.render(); 
	$(window).trigger('resize');
}