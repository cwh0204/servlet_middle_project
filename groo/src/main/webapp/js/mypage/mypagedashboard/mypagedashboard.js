$(document).ready(function() {
    
    const today = new Date();
    const todayYear = today.getFullYear();
    const todayMonth = today.getMonth();
    const todayDate = today.getDate();

    let currentYear; 
    let currentMonth; 
    
    function formatDate(date) {
        const y = date.getFullYear();
        const m = String(date.getMonth() + 1).padStart(2, '0');
        const d = String(date.getDate()).padStart(2, '0');
        return `${y}-${m}-${d}`;
    }

    function moveMonth(direction) {
        const newDate = new Date(currentYear, currentMonth + direction, 1);
        const newYear = newDate.getFullYear();
        const newMonth = newDate.getMonth();
        generateCalendar(newYear, newMonth);
    }

    // 캘린더 테스트를 위한 가상 일정
    const TEST_SCHEDULES = [
        { date: formatDate(new Date(todayYear, todayMonth, todayDate + 1)), title: '내일 회의', type: 'schedule' },
        { date: formatDate(new Date(todayYear, todayMonth + 1, 15)), title: '중요 마감일', type: 'important' }
    ];

    function generateCalendar(year, month) {
        currentYear = year;
        currentMonth = month;
        
        const $daysGrid = $('#days-grid');
        const $monthYearDisplay = $('#month-year-display');
        
        if ($daysGrid.length === 0 || $monthYearDisplay.length === 0) {
            console.error("Error: Required calendar elements not found.");
            return;
        }
        
        $daysGrid.empty();
        
        const firstDayOfMonth = new Date(year, month, 1);
        const startDayIndex = firstDayOfMonth.getDay(); 
        const calendarStart = new Date(firstDayOfMonth);
        calendarStart.setDate(firstDayOfMonth.getDate() - startDayIndex);
        
        $monthYearDisplay.text(`${year}년 ${month + 1}월`); 

        for (let i = 0; i < 42; i++) {
            const date = new Date(calendarStart);
            date.setDate(calendarStart.getDate() + i);

            const dayOfMonth = date.getDate();
            const cellMonth = date.getMonth(); 
            const dayOfWeek = date.getDay();
            const cellDateStr = formatDate(date); 
            
            let cellClasses = 'day-cell';

            if (cellMonth !== month) {
                cellClasses += (date < firstDayOfMonth) ? ' prev-month' : ' next-month';
            }
            
            const isToday = (date.getFullYear() === todayYear && cellMonth === todayMonth && dayOfMonth === todayDate);
            if (isToday) {
                cellClasses += ' is-today';
            }
            
            if (dayOfWeek === 0) { 
                cellClasses += ' sunday';
            } else if (dayOfWeek === 6) { 
                cellClasses += ' saturday';
            }

            const $cell = $('<div>').addClass(cellClasses);
            const $dayNumber = $('<span>').addClass('day-number').text(dayOfMonth);
            const $schedules = $('<div>').addClass('schedules');
            
            // TEST_SCHEDULES 기반으로 일정 표시
            TEST_SCHEDULES.filter(schedule => schedule.date === cellDateStr)
                     .forEach(schedule => {
                let scheduleClass = 'schedule';
                if (schedule.type === 'important') {
                    scheduleClass += ' important';
                } else if (schedule.type === 'vote') {
                    scheduleClass += ' vote';
                }
                $schedules.append(`<div class="${scheduleClass}">${schedule.title}</div>`);
            });

            $cell.append($dayNumber).append($schedules);
            $daysGrid.append($cell);
        }
    }

    // === 초기화 및 이벤트 리스너 ===

    // 초기 캘린더 로드 
    generateCalendar(todayYear, todayMonth);
    
    // 버튼 클릭 이벤트 리스너 설정
    $('#prev-month-btn').on('click', function() {
        moveMonth(-1);
    });
    
    $('#next-month-btn').on('click', function() {
        moveMonth(1);
    });
    
    // ❗ [수정] 달력 셀 클릭 이벤트 리스너 (선택 및 월 이동)
    $('#days-grid').on('click', '.day-cell', function() {
        const $cell = $(this);
        
        // 1. 월 이동 로직
        if ($cell.hasClass('prev-month')) {
            moveMonth(-1); // 이전 달로 이동
            return; // 이동 후에는 선택 로직을 실행하지 않음 (generateCalendar가 화면을 새로 그림)
        } 
        
        if ($cell.hasClass('next-month')) {
            moveMonth(1); // 다음 달로 이동
            return; // 이동 후에는 선택 로직을 실행하지 않음
        } 
        
        // 2. 현재 월 날짜 클릭 시 하이라이트
        $('#days-grid .day-cell').removeClass('is-selected');
        $cell.addClass('is-selected');
    });
});