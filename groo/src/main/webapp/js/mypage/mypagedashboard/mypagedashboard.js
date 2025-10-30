$(function() {
    
    // 이 변수들은 이제 $(function(){...}) 내부의 클로저 스코프를 가집니다.
    const today = new Date();
    const todayYear = today.getFullYear();
    const todayMonth = today.getMonth();
    const todayDate = today.getDate();

    // 월 이동 상태를 저장할 변수 (let으로 선언)
    let currentYear; 
    let currentMonth; 

    /**
     * 캘린더를 이전 달 또는 다음 달로 이동시키는 함수
     * 이 함수는 클로저를 통해 currentYear와 currentMonth에 접근합니다.
     */
    function moveMonth(direction) {
        const newDate = new Date(currentYear, currentMonth + direction, 1);
        const newYear = newDate.getFullYear();
        const newMonth = newDate.getMonth();
        generateCalendar(newYear, newMonth);
    }

    /**
     * 지정된 연도와 월을 기반으로 캘린더 그리드를 동적으로 생성합니다.
     */
    function generateCalendar(year, month) {
        // 캘린더 상태 업데이트
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

        // 6주(42일) 반복
        for (let i = 0; i < 42; i++) {
            const date = new Date(calendarStart);
            date.setDate(calendarStart.getDate() + i);

            const dayOfMonth = date.getDate();
            const cellMonth = date.getMonth(); 
            const dayOfWeek = date.getDay();
            
            let cellClasses = 'day-cell';

            // 이전/다음 달 구분
            if (cellMonth !== month) {
                cellClasses += (date < firstDayOfMonth) ? ' prev-month' : ' next-month';
            }
            
            // 오늘 날짜 강조
            const isToday = (date.getFullYear() === todayYear && cellMonth === todayMonth && dayOfMonth === todayDate);
            if (isToday) {
                cellClasses += ' is-today';
            }
            
            // 주말 구분
            if (dayOfWeek === 0) { 
                cellClasses += ' sunday';
            } else if (dayOfWeek === 6) { 
                cellClasses += ' saturday';
            }

            const $cell = $('<div>').addClass(cellClasses);
            const $dayNumber = $('<span>').addClass('day-number').text(dayOfMonth);
            const $schedules = $('<div>').addClass('schedules');
            
            // 스케줄 데이터 표시 예시
            if (cellMonth === month) {
                if (dayOfMonth === 7) {
                    $schedules.append('<div class="schedule important">📢 데모 발표</div>');
                } else if (dayOfMonth === 1) {
                    $schedules.append('<div class="schedule">💡 아이디어 회의</div>');
                }
            }
            if (isToday) {
                $schedules.append('<div class="schedule important">✅ 오늘 할 일</div>');
            }

            $cell.append($dayNumber).append($schedules);
            $daysGrid.append($cell);
        }
    }


    // 1. 초기 캘린더 로드 (현재 시점의 달)
    generateCalendar(todayYear, todayMonth);
    
    // 2. 버튼 클릭 이벤트 리스너 설정
    $('#prev-month-btn').on('click', function() {
        moveMonth(-1);
    });
    
    $('#next-month-btn').on('click', function() {
        moveMonth(1);
    });
    
    // 3. 버튼 보이게 설정 유지
    $('#prev-month-btn').show(); 
    $('#next-month-btn').show(); 

}); // $(function() { ... }); 블록 종료