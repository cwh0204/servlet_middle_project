// 캘린더 초기화 함수 정의 (페이지 재로드 시 재호출용)
        function initFullCalendar() {
            var calendarEl = document.getElementById('fullCalendar');
            
            // 중복 초기화 방지 및 요소 존재 여부 확인
            if (!calendarEl || $(calendarEl).hasClass('fc')) {
                if (!calendarEl) {
                    console.error("Error: 'fullCalendar' ID를 가진 요소를 찾을 수 없습니다.");
                }
                return; 
            }
            
            // 오늘 날짜를 동적으로 계산 (YYYY-MM-DD 형식)
            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1).padStart(2, '0');
            const day = String(today.getDate()).padStart(2, '0');
            const dynamicInitialDate = `${year}-${month}-${day}`;
            
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth', 
                initialDate: dynamicInitialDate, 
                locale: 'ko', 
                
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },

                editable: true, 
                selectable: true, 
                
                select: function(info) {
                    var title = prompt('새 일정 제목을 입력하세요 (개인 일정으로 등록):');
                    if (title) {
                        calendar.addEvent({ 
                            title: title, 
                            start: info.startStr, 
                            end: info.endStr, 
                            allDay: info.allDay, 
                            color: '#5b5f97',
                            extendedProps: { isTeamEvent: false }
                        });
                    }
                    calendar.unselect();
                },
                
                // ⭐ 팀/개인 일정 구분 로직
                eventClick: function(info) {
                    const isTeamEvent = info.event.extendedProps.isTeamEvent || false; 

                    if (isTeamEvent) {
                        alert(`[${info.event.title}]은(는) 팀 공동 일정입니다. 삭제 권한이 없습니다.`);
                    } else {
                        alert(`일정 제목: ${info.event.title}\n시작 날짜: ${info.event.startStr}`);
                        
                        if (confirm(`[${info.event.title}] 본인 일정을 삭제하시겠습니까?`)) {
                            info.event.remove(); 
                        }
                    }
                },

                events: [
                    {
                        title: '팀 일정: 주간 스터디 회의',
                        start: dynamicInitialDate, 
                        color: '#d1ecf1', 
                        textColor: '#0c5460',
                        extendedProps: { isTeamEvent: true } // 팀 일정 (삭제 불가)
                    },
                    {
                        title: '개인 일정: 최종 발표 준비',
                        start: `${year}-${month}-27`, 
                        color: '#f8d7da',
                        textColor: '#721c24',
                        // extendedProps 생략 또는 isTeamEvent: false
                    },
                    {
                        title: '개인 일정: 다음 달 멘토링',
                        start: `${year}-${String(today.getMonth() + 2).padStart(2, '0')}-17`, 
                    }
                ]
            });

            calendar.render();
            $(window).trigger('resize');
        }

        // ⭐ 변경된 부분: $(document).ready() 대신 window.onload 사용
        window.onload = initFullCalendar;