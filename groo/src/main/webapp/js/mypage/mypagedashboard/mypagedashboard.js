// 캘린더 초기화 함수 정의 (페이지 재로드 시 재호출용)
function initFullCalendar() {
	var calendarEl = document.getElementById('fullCalendar');

	if (!calendarEl || $(calendarEl).hasClass('fc')) {
		if (!calendarEl) {
			console.error("Error: 'fullCalendar' ID를 가진 요소를 찾을 수 없습니다.");
		}
		return;
	}

	const today = new Date();
	const year = today.getFullYear();
	const month = String(today.getMonth() + 1).padStart(2, '0');
	const day = String(today.getDate()).padStart(2, '0');
	const dynamicInitialDate = `${year}-${month}-${day}`;

	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		initialDate: dynamicInitialDate,
		locale: 'ko',
		initialView: 'dayGridMonth',
		editable: true,
		selectable: true,

		eventClick: function(info) {
			const isTeamEvent = info.event.extendedProps.isTeamEvent || false;

			if (isTeamEvent) {
				alert(`일정 제목: ${info.event.title}\n시작 날짜: ${info.event.startStr}`);
			}
		},

		events: [
			{
				title: '주간 스터디 회의',
				start: dynamicInitialDate,
				color: '#d1ecf1',
				textColor: '#4CAF50', // 글자색 통일
				extendedProps: { isTeamEvent: true }
			}
		]
	});

	calendar.render();
	$(window).trigger('resize');
}

window.onload = initFullCalendar;